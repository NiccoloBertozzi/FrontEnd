import { Component, ElementRef, OnInit, ViewChild } from '@angular/core';
import { FormBuilder, Validators, FormGroup, FormControl } from '@angular/forms';
import { ActivatedRoute, Router } from '@angular/router';
import { CookieService } from 'ngx-cookie-service';
import { Allenatore } from 'src/app/models/allenatore.model';
import { Atleta } from 'src/app/models/atleta.model';
import { NavbarService } from 'src/app/services/navbar.service';
import {UserService} from '../../services/user.service';
import {TorneoAPIService} from '../../services/torneo-api.service';

@Component({
  selector: 'app-iscrivi-squadra',
  templateUrl: './iscrivi-squadra.component.html',
  styleUrls: ['./iscrivi-squadra.component.scss']
})
export class IscriviSquadraComponent implements OnInit {

  formrcrea:FormGroup;
  Atleti !:Atleta[];
  _Atleti_ !:Atleta[];
  Allenatori !:Allenatore[];
  _Allenatori_ !:Allenatore[];
  nomesquadra!:string;
  idTorneo:any;

  constructor(private navbarService: NavbarService,private formBuilder: FormBuilder,private router:Router,private activatedRoute:ActivatedRoute,private TorneoAPIService:TorneoAPIService,private UserService:UserService,private cookieService: CookieService) { 
    this.formrcrea = this.formBuilder.group({
      atleta1: ['', Validators.required],
      atleta2: ['', Validators.required],
      allenatore: [''],
      wildcard:['false',Validators.required]
    });
    this.idTorneo=this.activatedRoute.snapshot.paramMap.get('id')?.toString();
  }

  ngOnInit(): void {
    //scarico tutti gli atleti
    this.UserService.GetAtleti(this.cookieService.get('token')).subscribe(
      obj=>{
        this.Atleti=obj as Atleta[];
        this._Atleti_=obj as Atleta[];
      },
      error=>{
        console.log("error", error);
    })
    //scarico tutti gli allenatori
    this.UserService.GetAllenatori(this.cookieService.get('token')).subscribe(
      obj=>{
        this.Allenatori=obj as Allenatore[];
        this._Allenatori_=obj as Allenatore[];
      },
      error=>{
        console.log("error", error);
    })
  }
  onChange(){
    this.Atleti=this._Atleti_.filter(u=>{
      const cognome:string=u.cognome.toLowerCase();
      return cognome.indexOf('') >-1;
    })
    //cognomeat1 nomeat1-cognomeat2 nomeat2
    this.nomesquadra=this.formrcrea.controls["atleta1"].value["cognome"]+" "+this.formrcrea.controls["atleta1"].value["nome"].charAt(0)+". - ";
    this.nomesquadra+=this.formrcrea.controls["atleta2"].value["cognome"]+" "+this.formrcrea.controls["atleta2"].value["nome"].charAt(0)+".";
  }

  @ViewChild('multiUserSearch1') multiUserSearchInput1!:ElementRef;
  @ViewChild('multiUserSearch2') multiUserSearchInput2!:ElementRef;
  @ViewChild('multiUserSearchAllenatore') multiUserSearchInputAllenatore!:ElementRef;

  onInputChange1(){
    const searhInput=this.multiUserSearchInput1.nativeElement.value ?
      this.multiUserSearchInput1.nativeElement.value.toLowerCase(): '';
      this.Atleti=this._Atleti_.filter(u=>{
        const cognome:string=u.cognome.toLowerCase();
        const nome:string=u.nome.toLowerCase();
        return cognome.indexOf(searhInput) >-1 || nome.indexOf(searhInput) >-1;
      })
  }
  onInputChange2(){
    const searhInput=this.multiUserSearchInput2.nativeElement.value ?
      this.multiUserSearchInput2.nativeElement.value.toLowerCase(): '';
      this.Atleti=this._Atleti_.filter(u=>{
        const cognome:string=u.cognome.toLowerCase();
        const nome:string=u.nome.toLowerCase();
        return cognome.indexOf(searhInput) >-1 || nome.indexOf(searhInput) >-1;      
      })
  }
  onInputChangeAllenatore(){
    const searhInput=this.multiUserSearchInputAllenatore.nativeElement.value ?
      this.multiUserSearchInputAllenatore.nativeElement.value.toLowerCase(): '';
      this.Allenatori=this.Allenatori.filter(u=>{
        const cognome:string=u.cognome.toLowerCase();
        const nome:string=u.nome.toLowerCase();
        return cognome.indexOf(searhInput) >-1 || nome.indexOf(searhInput) >-1;      
      })
  }
  Iscrivi(){
    let body;
    body="{ \r\n"+
      "\"atleta1\":\""+this.formrcrea.controls["atleta1"].value["idAtleta"] +"\" , \r\n"+
      "\"atleta2\": \""+this.formrcrea.controls["atleta2"].value["idAtleta"] +"\", \r\n"+
      "\"accettato\": true , \r\n"+
      "\"nomeTeam\": \""+this.nomesquadra +"\", \r\n"+
      "\"iscritto\": { \r\n"+
        "\"idTorneo\": \""+this.idTorneo +"\", \r\n";
      if(this.formrcrea.controls["allenatore"].value["idAllenatore"]!=undefined)"\"idAllenatore\": "+this.formrcrea.controls["allenatore"].value["idAllenatore"]+", \r\n";
       body+="\"wildCard\": "+this.formrcrea.controls["wildcard"].value+
      "\r\n} \r\n"+
    "}";
    //scarico tutti gli allenatori
    this.TorneoAPIService.IscriviSquadra(this.cookieService.get('token'),body).subscribe(
      obj=>{
        this.router.navigate(['/InfoTorneo/'+this.idTorneo]);
      },
      error=>{
        console.log("error", error);
    })
  }
}
