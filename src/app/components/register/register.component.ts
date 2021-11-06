import { Component, OnInit, ViewChild,ElementRef } from '@angular/core';
import { ActivatedRoute, Router } from '@angular/router';

import {Comuni} from '../../models/comuni.model'
import { Societa } from 'src/app/models/societa.model';
import {Info} from '../../models/info.model'

import { NavbarService } from '../../services/navbar.service';
import {RegisterService} from '../../services/register.service';
import { CookieService } from 'ngx-cookie-service';
import { FormBuilder, Validators, FormGroup } from '@angular/forms';

@Component({
  selector: 'app-register',
  templateUrl: './register.component.html',
  styleUrls: ['./register.component.scss']
})
export class RegisterComponent implements OnInit {
  formregister:FormGroup;
  city!:Comuni[];
  societa!:Societa[];
  registerStatus!:Info;
  
  commonBox:boolean;
  atletaBox:boolean;
  allenatoreBox:boolean;
  delegatoBox:boolean;
  societaBox:boolean;
  constructor(private RegisterService:RegisterService,private router:Router,private activatedRoute:ActivatedRoute,private cookieService: CookieService,private navbarService: NavbarService,private formBuilder: FormBuilder) { 
    navbarService.clearAllItems();
    this.commonBox=false; //false show
    this.atletaBox=false; //true hide
    this.allenatoreBox=true;
    this.delegatoBox=true;
    this.societaBox=true;
    this.router.navigate(
      ['../register'], 
      {
        relativeTo: this.activatedRoute,
        queryParams: {ruolo:'Atleta'}, 
        queryParamsHandling: 'merge', // remove to replace all query params by provided
      });

    this.formregister = this.formBuilder.group({
      nome: ['', Validators.required],
      cognome: ['', Validators.required],
      dataNascita: ['', Validators.required],
      cbComNasc: ['', Validators.required],
      cf: ['', Validators.required],
      sesso: ['', Validators.required],
      tel: ['', Validators.required],
      tel1: ['', Validators.required],
      tel2: ['', Validators.required],
      sito: ['', Validators.required],
      cbComRes: ['', Validators.required],
      indirizzo: ['', Validators.required],
      cap: ['', Validators.required],
      email: ['', Validators.required],
      password: ['', Validators.required],
      pswSoc: ['', Validators.required],
      cbNomeSocieta: ['', Validators.required],
      citta: ['', Validators.required],
      dataScadenzaCertificato: ['', Validators.required],
      altezza: ['', Validators.required],
      peso: ['', Validators.required],
      grado: ['', Validators.required],
      arbitro: ['', Validators.required],
      supervisore: ['', Validators.required],
      Presidente: ['', Validators.required],
      Referente: ['', Validators.required],
      cu: ['', Validators.required],
      cfSoc: ['', Validators.required],
      PIVA: ['', Validators.required],
      pec: ['', Validators.required],
      codiceAffiliazione: ['', Validators.required],
      dataAffiliazione: ['', Validators.required],
      dataFondazione: ['', Validators.required],
      nomeSocieta: ['', Validators.required]
    });
 }

  ngOnInit(): void {
    //scarico tutti i comuni
    this.RegisterService.getComuni().subscribe(
      obj=>{
        this.city=obj;
      },
      error=>{
        console.log("error", error);
    })
    //scarico tutte le società
    this.RegisterService.getSocieta().subscribe(
      obj=>{
        this.societa=obj;
      },
      error=>{
        console.log("error", error);
    })
  }

  //REGISTER
  Register(){
    //prendo il ruolo dell'utente che si registra
    let role;
    role=this.activatedRoute.snapshot.queryParamMap.get('ruolo');
    let parameter;
    if(role=="Atleta")
    parameter = "{\r\n  \"atleta\": {\r\n";
    else if (role == "Allenatore")
      parameter = "{\r\n  \"allenatore\": {\r\n";
    else if (role == "Delegato")
      parameter = "{\r\n  \"delegato\": {\r\n";
    else if (role == "Societa")
      {
        parameter = "{\r\n  \"societa\": {\r\n";
      }

      Object.keys(this.formregister.controls).forEach(key => {
        //console.log(this.formregister.controls);
        //scorro tutti gli input e creo il body della chiamata
        if(this.formregister.controls[key].status=="VALID"&& key !="password" && key !="pswSoc"&& key !="cbNomeSocieta"&& key !="cbComNasc"&& key !="cbComRes")
          parameter += " \"" + key + "\": \"" + this.formregister.controls[key].value + "\",\r\n";
      });
      parameter = parameter.substring(0, parameter.length - 3);//elimino ultimi 3 caratteri
      //setto credenziali per accesso
      if(role == "Societa") parameter += "},\r\n  \"cred\": {\r\n \"password\": \"" + this.formregister.controls["pswSoc"].value + "\",\r\n"+"\"nomeSocieta\":\"" + this.formregister.controls["nomeSocieta"].value+ "\",\r\n";
      else parameter += "},\r\n  \"cred\": {\r\n \"password\": \"" + this.formregister.controls["password"].value + "\",\r\n";
      if (role == "Atleta" || role == "Allenatore") parameter += "\"nomeSocieta\":\"" + this.formregister.controls["cbNomeSocieta"].value + "\",\r\n";
      if (role != "Societa") parameter += "\"comuneNascita\":\"" + this.formregister.controls["cbComNasc"].value + "\",\r\n";
      parameter+="\"comuneResidenza\":\"" + this.formregister.controls["cbComRes"].value + "\"\r\n}\r\n}";
    //console.log(parameter);
    //Register
    this.RegisterService.Register(role,parameter).subscribe(
      obj=>{
        this.registerStatus=obj;
        console.log(this.registerStatus.messaggio);
      },
      error=>{
        console.log("error", error);
    })
  }
  @ViewChild('btnAtleta') btnAtleta!:ElementRef;
  @ViewChild('btnAllenatore') btnAllenatore!:ElementRef;
  @ViewChild('btnDelegato') btnDelegato!:ElementRef;
  @ViewChild('btnSocieta') btnSocieta!:ElementRef;
  AtletaClick(){
    //sostituisco le classi per gli stili
    if(!this.btnAtleta.nativeElement.classList.contains("btn-info")){
      this.btnAtleta.nativeElement.classList.add("btn-info");
      this.btnAtleta.nativeElement.classList.remove("btn-secondary");
      if(this.btnDelegato.nativeElement.classList.contains("btn-info")){
      this.btnDelegato.nativeElement.classList.remove("btn-info");
      this.btnDelegato.nativeElement.classList.add("btn-secondary");
      }
      if(this.btnAllenatore.nativeElement.classList.contains("btn-info")){
        this.btnAllenatore.nativeElement.classList.remove("btn-info");
        this.btnAllenatore.nativeElement.classList.add("btn-secondary");
      }
      if(this.btnSocieta.nativeElement.classList.contains("btn-info")){
        this.btnSocieta.nativeElement.classList.remove("btn-info");
        this.btnSocieta.nativeElement.classList.add("btn-secondary");
      }
    }
    /* Cambio il modulo da visualizzare ATLETA*/
    this.delegatoBox=true;
    this.allenatoreBox=true;
    this.societaBox=true;
    this.atletaBox=false;
    this.commonBox=false;
    this.router.navigate(
      ['../register'], 
      {
        relativeTo: this.activatedRoute,
        queryParams: {ruolo:'Atleta'}, 
        queryParamsHandling: 'merge', // remove to replace all query params by provided
      });    
  }
  AllenatoreClick(){
    //sostituisco le classi per gli stili
    if(!this.btnAllenatore.nativeElement.classList.contains("btn-info")){
      this.btnAllenatore.nativeElement.classList.add("btn-info");
      this.btnAllenatore.nativeElement.classList.remove("btn-secondary");
      if(this.btnDelegato.nativeElement.classList.contains("btn-info")){
      this.btnDelegato.nativeElement.classList.remove("btn-info");
      this.btnDelegato.nativeElement.classList.add("btn-secondary");
      }
      if(this.btnAtleta.nativeElement.classList.contains("btn-info")){
        this.btnAtleta.nativeElement.classList.remove("btn-info");
        this.btnAtleta.nativeElement.classList.add("btn-secondary");
      }
      if(this.btnSocieta.nativeElement.classList.contains("btn-info")){
        this.btnSocieta.nativeElement.classList.remove("btn-info");
        this.btnSocieta.nativeElement.classList.add("btn-secondary");
      }
    }
    /* Cambio il modulo da visualizzare ALLENATORE*/
    this.delegatoBox=true;
    this.allenatoreBox=false;
    this.atletaBox=true;
    this.societaBox=true;
    this.commonBox=false;
    this.router.navigate(
      ['../register'], 
      {
        relativeTo: this.activatedRoute,
        queryParams: {ruolo:'Allenatore'}, 
        queryParamsHandling: 'merge', // remove to replace all query params by provided
      });  
  }
  DelegatoClick(){
    //sostituisco le classi per gli stili
    if(!this.btnDelegato.nativeElement.classList.contains("btn-info")){
      this.btnDelegato.nativeElement.classList.add("btn-info");
      this.btnDelegato.nativeElement.classList.remove("btn-secondary");
      if(this.btnAtleta.nativeElement.classList.contains("btn-info")){
      this.btnAtleta.nativeElement.classList.remove("btn-info");
      this.btnAtleta.nativeElement.classList.add("btn-secondary");
      }
      if(this.btnAllenatore.nativeElement.classList.contains("btn-info")){
        this.btnAllenatore.nativeElement.classList.remove("btn-info");
        this.btnAllenatore.nativeElement.classList.add("btn-secondary");
      }
      if(this.btnSocieta.nativeElement.classList.contains("btn-info")){
        this.btnSocieta.nativeElement.classList.remove("btn-info");
        this.btnSocieta.nativeElement.classList.add("btn-secondary");
      }
    }
    /* Cambio il modulo da visualizzare DELEGATO*/
    this.delegatoBox=false;
    this.allenatoreBox=true;
    this.societaBox=true;
    this.atletaBox=true;
    this.commonBox=false;
    this.router.navigate(
      ['../register'], 
      {
        relativeTo: this.activatedRoute,
        queryParams: {ruolo:'Delegato'}, 
        queryParamsHandling: 'merge', // remove to replace all query params by provided
      });  
  }
  SocietaClick(){
    //sostituisco le classi per gli stili
    if(!this.btnSocieta.nativeElement.classList.contains("btn-info")){
      this.btnSocieta.nativeElement.classList.add("btn-info");
      this.btnSocieta.nativeElement.classList.remove("btn-secondary");
      if(this.btnDelegato.nativeElement.classList.contains("btn-info")){
      this.btnDelegato.nativeElement.classList.remove("btn-info");
      this.btnDelegato.nativeElement.classList.add("btn-secondary");
      }
      if(this.btnAtleta.nativeElement.classList.contains("btn-info")){
        this.btnAtleta.nativeElement.classList.remove("btn-info");
        this.btnAtleta.nativeElement.classList.add("btn-secondary");
      }
      if(this.btnAllenatore.nativeElement.classList.contains("btn-info")){
        this.btnAllenatore.nativeElement.classList.remove("btn-info");
        this.btnAllenatore.nativeElement.classList.add("btn-secondary");
      }
    }
    /* Cambio il modulo da visualizzare ALLENATORE*/
    this.delegatoBox=true;
    this.allenatoreBox=true;
    this.atletaBox=true;
    this.commonBox=true;
    this.societaBox=false;
    this.router.navigate(
      ['../register'], 
      {
        relativeTo: this.activatedRoute,
        queryParams: {ruolo:'Societa'}, 
        queryParamsHandling: 'merge', // remove to replace all query params by provided
      });  
  }


}
