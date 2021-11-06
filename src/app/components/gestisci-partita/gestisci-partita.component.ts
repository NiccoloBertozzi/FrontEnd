import { Component, OnInit } from '@angular/core';
import { ActivatedRoute, Router } from '@angular/router';
import { CookieService } from 'ngx-cookie-service';
import { Partita } from 'src/app/models/partita.model';
import { NavbarService } from 'src/app/services/navbar.service';
import { GestionaleService } from '../../services/gestionale.service';
import { TorneoAPIService } from '../../services/torneo-api.service';
import { FormBuilder, Validators, FormGroup, FormArray, FormControl } from '@angular/forms';
import * as moment from 'moment';

@Component({
  selector: 'app-gestisci-partita',
  templateUrl: './gestisci-partita.component.html',
  styleUrls: ['./gestisci-partita.component.scss']
})
export class GestisciPartitaComponent implements OnInit {

  formrcrea!:FormGroup;

  constructor(private router: Router,private activatedRoute:ActivatedRoute, private navbarService: NavbarService, private GestionaleService: GestionaleService, private TorneoAPIService: TorneoAPIService,private cookieService: CookieService,private formBuilder: FormBuilder) {}
  
  partita!: Partita;
  idtorneo:any;
  numpartita:any;
  total:any;
  test!:number;
  ngOnInit(): void {
    //prendo id torneo e num partita dai parametri
  this.idtorneo=this.activatedRoute.snapshot.paramMap.get('id');
  this.numpartita=this.activatedRoute.snapshot.paramMap.get('partita');
  
  //get partita
  this.GestionaleService.getPartita(this.idtorneo,this.numpartita).subscribe(
    obj=>{
      this.partita=obj as Partita;
      this.total=(this.partita[0].setSQ1+this.partita[0].setSQ2)+1;
      console.log(this.partita);
      this.formrcrea = this.formBuilder.group({
        pt1s1: [this.partita[0]["pT1S1"], Validators.required],
        pt2s1: [this.partita[0]["pT2S1"], Validators.required],
        pt1s2: [this.partita[0]["pT1S2"], Validators.required],
        pt2s2: [this.partita[0]["pT2S2"], Validators.required],
        pt1s3: [this.partita[0]["pT1S3"], Validators.required],
        pt2s3: [this.partita[0]["pT2S3"], Validators.required],
        dataPartita: [moment(this.partita[0]["dataPartita"]).format('YYYY-MM-DD'), Validators.required],
        oraPartita: [this.partita[0]["oraPartita"], Validators.required],
        campo: [this.partita[0]["campo"], Validators.required] 
      });
    },
    error=>{
      console.log("error", error);
  })
  }

  ModificaInfo(){
    let body="{\r\n";
    body+="\"campo\":\""+this.formrcrea.controls["campo"].value+"\",\r\n";
    body+="\"dataPartita\":\""+this.formrcrea.controls["dataPartita"].value+"\",\r\n";
    body+="\"oraPartita\":\""+this.formrcrea.controls["oraPartita"].value+"\",\r\n";
    body+="\"idPartita\":\""+this.partita[0]["idPartita"]+"\"\r\n";
    body+="}";
    //update info
    this.GestionaleService.UpdateInfoPartita(this.cookieService.get("token"),body).subscribe(
      obj=>{
        this.router.navigate(['/InfoPartita/'+this.idtorneo+'/Partita/'+this.numpartita]);
      },
      error=>{
        console.log("error", error);
    })
  }

  ModificaRisultati(){
    let body="{\r\n  \"idTorneo\": "+ this.idtorneo + ",\r\n  \"idPartita\": "+this.partita[0]["idPartita"]+",\r\n  \"numPartita\":"+ this.numpartita + "," +
    "\r\n  \"pt1s3\": "+ this.formrcrea.controls["pt1s3"].value + ",\r\n  \"pt1s2\": "+ this.formrcrea.controls["pt1s2"].value + "," +
    "\r\n  \"pt1s1\": "+ this.formrcrea.controls["pt1s1"].value + ",\r\n  \"pt2s3\": "+ this.formrcrea.controls["pt2s3"].value + "," +
    "\r\n  \"pt2s2\":"+ this.formrcrea.controls["pt2s2"].value + ",\r\n  \"pt2s1\": "+ this.formrcrea.controls["pt2s1"].value + "," +
    "\r\n  \"numSet\": "+ this.total+ "\r\n}";
    console.log(body);
    //update info
    this.GestionaleService.UpdateInfoRisultatiPartita(this.cookieService.get("token"),body).subscribe(
      obj=>{
        this.router.navigate(['/OutputPartite/'+this.idtorneo]);
      },
      error=>{
        console.log("error", error);
    })
  }
}
