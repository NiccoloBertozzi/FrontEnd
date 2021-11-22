import { Component, OnInit, ViewChild,ElementRef, Inject,AfterViewInit  } from '@angular/core';
import { ActivatedRoute, Router } from '@angular/router';
import { HttpClient} from '@angular/common/http';
import {map, startWith} from 'rxjs/operators';
import { Observable,of } from 'rxjs';

import {Comuni} from '../../models/comuni.model'
import { Societa } from 'src/app/models/societa.model';
import {Info} from '../../models/info.model'

import { NavbarService } from '../../services/navbar.service';
import {RegisterService} from '../../services/register.service';
import { CookieService } from 'ngx-cookie-service';
import { FormBuilder, Validators, FormGroup, FormControl } from '@angular/forms';
import {MatDialog, MatDialogRef, MAT_DIALOG_DATA} from '@angular/material/dialog';
import { faEye,faEyeSlash } from '@fortawesome/free-solid-svg-icons';

export interface DialogData {
  error: string;
}
@Component({
  selector: 'app-register',
  templateUrl: './register.component.html',
  styleUrls: ['./register.component.scss']
})
export class RegisterComponent implements OnInit {
  formregister:FormGroup;
  cityes!: Comuni[];
  cityesres!: Comuni[];
  myControl = new FormControl();
  filteredOptions!: Observable<Comuni[]>;
  myControlRes = new FormControl();
  filteredOptionsRes!: Observable<Comuni[]>;
  societa!: Societa[];
  registerStatus!:Info;
  errore!: string;
  faeye = faEyeSlash;
  commonBox:boolean;
  atletaBox:boolean;
  allenatoreBox:boolean;
  delegatoBox:boolean;
  societaBox:boolean;

  constructor(private http:HttpClient,public dialog: MatDialog,private RegisterService:RegisterService,private router:Router,private activatedRoute:ActivatedRoute,private cookieService: CookieService,private navbarService: NavbarService,private formBuilder: FormBuilder) { 
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
      tel: ['', Validators.required,
      Validators.pattern('^\\s*(?:\\+?(\\d{1,3}))?[-. (]*(\\d{3})[-. )]*(\\d{3})[-. ]*(\\d{4})(?: *x(\\d+))?\\s*$')],
      tel1: ['', Validators.required,
      Validators.pattern('^\\s*(?:\\+?(\\d{1,3}))?[-. (]*(\\d{3})[-. )]*(\\d{3})[-. ]*(\\d{4})(?: *x(\\d+))?\\s*$')],
      tel2: ['', Validators.required,
      Validators.pattern('^\\s*(?:\\+?(\\d{1,3}))?[-. (]*(\\d{3})[-. )]*(\\d{3})[-. ]*(\\d{4})(?: *x(\\d+))?\\s*$')],
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
 //mostra password
 @ViewChild('password') mostra;
 showPassword() {
   if (this.mostra.nativeElement.type === "password") {
    this.faeye=faEye;
     this.mostra.nativeElement.type = "text";
   }
   else
   {
     this.mostra.nativeElement.type = "password";
     this.faeye=faEyeSlash;
   }
 }
 @ViewChild('pswSoc') mostrapswSoc;
 showPasswordpswSoc() {
   if (this.mostrapswSoc.nativeElement.type === "password") {
     this.mostrapswSoc.nativeElement.type = "text";
     this.faeye=faEye;
   }
   else
   {
     this.mostrapswSoc.nativeElement.type = "password";
     this.faeye=faEyeSlash;
   }
 }


 openDialog(): void {
  const dialogRef = this.dialog.open(DialogOverviewExampleDialog, {
    panelClass: 'custom-dialog-container',
    data: {error: this.errore},
  });
}


  ngOnInit(){
  }
  ngAfterViewInit(){
    this.loadComuni();
  }


  loadComuni(){
  //societa
  this.RegisterService.getSocieta().subscribe(
    obj=>{
      this.societa=obj;
    },
    error=>{
      console.log("error", error);
  });
  //comuni
  this.RegisterService.getComuni().subscribe(
    obj=>{
      this.cityes=obj;
      this.searchComuni();      
    },
    error=>{
      console.log("error", error);
  });
}
searchComuni(){
  this.filteredOptions = this.myControl.valueChanges.pipe(
    startWith(''),
    map(value => (typeof value === 'string' ? value : value.citta)),
    map(citta => (citta ? this._filter(citta) : this.cityes.slice())),
  );
  this.filteredOptionsRes = this.myControlRes.valueChanges.pipe(
    startWith(''),
    map(value => (typeof value === 'string' ? value : value.citta)),
    map(citta => (citta ? this._filter(citta) : this.cityes.slice())),
  );
}
private _filter(citta: string): Comuni[] {
  const filterValue = citta.toLowerCase();
  return this.cityes.filter(option => option.citta.toLowerCase().includes(filterValue));
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
      if(role == "Societa") parameter += "\"citta\":\"" + this.myControl.value + "},\r\n  \"cred\": {\r\n \"password\": \"" + this.formregister.controls["pswSoc"].value + "\",\r\n"+"\"nomeSocieta\":\"" + this.formregister.controls["nomeSocieta"].value+ "\",\r\n";
      else parameter += "},\r\n  \"cred\": {\r\n \"password\": \"" + this.formregister.controls["password"].value + "\",\r\n";
      if (role == "Atleta" || role == "Allenatore") parameter += "\"nomeSocieta\":\"" + this.formregister.controls["cbNomeSocieta"].value + "\",\r\n";
      if (role != "Societa") parameter += "\"comuneNascita\":\"" + this.myControl.value + "\",\r\n";
      parameter+="\"comuneResidenza\":\"" + this.myControlRes.value + "\"\r\n}\r\n}";
    //console.log(parameter);
    //Register
    this.RegisterService.Register(role,parameter).subscribe(
      obj=>{
        this.registerStatus=obj;
        console.log(this.registerStatus.messaggio);
      },
      error=>{
        this.registerStatus=error;
        this.errore=error.error.message;
        console.log("error", error);
        this.openDialog();
    })
  }
  @ViewChild('btnAtleta') btnAtleta!:ElementRef;
  @ViewChild('btnAllenatore') btnAllenatore!:ElementRef;
  @ViewChild('btnDelegato') btnDelegato!:ElementRef;
  @ViewChild('btnSocieta') btnSocieta!:ElementRef;
  AtletaClick(){
    this.filteredOptions=of([]);
    this.filteredOptionsRes=of([]);
    this.searchComuni();
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
    this.filteredOptions=of([]);
    this.filteredOptionsRes=of([]);
    this.searchComuni();
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
    this.filteredOptions=of([]);
    this.filteredOptionsRes=of([]);
    this.searchComuni();
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
    this.filteredOptions=of([]);
    this.filteredOptionsRes=of([]);
    this.searchComuni();
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


@Component({
  selector: 'dialog-overview-example-dialog',
  templateUrl: 'dialog.html',
})
export class DialogOverviewExampleDialog {
  constructor(
    public dialogRef: MatDialogRef<DialogOverviewExampleDialog>,
    @Inject(MAT_DIALOG_DATA) public data: DialogData,
  ) {}

  onNoClick(): void {
    this.dialogRef.close();
  }
}
