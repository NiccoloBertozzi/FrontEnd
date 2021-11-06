import { Component, OnInit } from '@angular/core';
import { FormGroup,FormBuilder, Validators } from '@angular/forms';
import { ActivatedRoute, Router } from '@angular/router';
import { CookieService } from 'ngx-cookie-service';
import { DelegatiTorneo } from 'src/app/models/delegatiTorneo.model';
import { NavbarService } from 'src/app/services/navbar.service';
import { UserService } from 'src/app/services/user.service';

@Component({
  selector: 'app-assegna-delegato',
  templateUrl: './assegna-delegato.component.html',
  styleUrls: ['./assegna-delegato.component.scss']
})
export class AssegnaDelegatoComponent implements OnInit {
  
  formassegna:FormGroup;
  Arbitro!:DelegatiTorneo[];
  Supervisore!:DelegatiTorneo[];
  Direttore!:DelegatiTorneo[];
  idTorneo:any;

  constructor(private UserService:UserService,private router:Router,private activatedRoute:ActivatedRoute,private cookieService: CookieService,private navbarService: NavbarService,private formBuilder: FormBuilder) { 
    this.formassegna = this.formBuilder.group({
      IdSupervisore: ['', Validators.required],
      IdSupArbitrale: ['', Validators.required],
      IdDirettore: ['', Validators.required]
    });
    this.idTorneo=this.activatedRoute.snapshot.paramMap.get('id');
  }

  ngOnInit(): void {
    //scarico supervisorei
    this.UserService.GetSupervisori(this.cookieService.get('token')).subscribe(
      obj=>{
        this.Supervisore=obj;
      },
      error=>{
        console.log("error", error);
    })
    //scarico arbitri
    this.UserService.GetArbitri(this.cookieService.get('token')).subscribe(
      obj=>{
        this.Arbitro=obj;
      },
      error=>{
        console.log("error", error);
    })
    //scarico direttori
    this.UserService.GetDirettori(this.cookieService.get('token')).subscribe(
      obj=>{
        this.Direttore=obj;
      },
      error=>{
        console.log("error", error);
    })
  }

  AssegnaDelegato(){
    let body;
    body="{\r\n";
    Object.keys(this.formassegna.controls).forEach(key => {
      //scorro tutti gli input e creo il body della chiamata
      if(this.formassegna.controls[key].status=="VALID"){
        body += " \"" + key + "\": \"" + this.formassegna.controls[key].value + "\",\r\n";
      }
    });

    body+="\"IdTorneo\":" + this.idTorneo + "\r\n}";
    //assegnadelegati
    this.UserService.AssegnaDelegati(this.cookieService.get('token'),body).subscribe(
      obj=>{
        this.router.navigate(['OutputTornei/L1']);
      },
      error=>{
        console.log("error", error);
    })
  }
}
