import { KeyValue } from '@angular/common';
import { Component, OnInit } from '@angular/core';
import { ActivatedRoute, Router } from '@angular/router';
import { CookieService } from 'ngx-cookie-service';
import { Allenatore } from 'src/app/models/allenatore.model';
import { Atleta } from 'src/app/models/atleta.model';
import { Delegato } from 'src/app/models/delegato.model';
import { Societa } from 'src/app/models/societa.model';
import { NavbarService } from 'src/app/services/navbar.service';
import { SocietaApiService } from 'src/app/services/societa-api.service';
import { UserService } from 'src/app/services/user.service';
import { FormBuilder, Validators, FormGroup } from '@angular/forms';

@Component({
  selector: 'app-modifica-anagrafica',
  templateUrl: './modifica-anagrafica.component.html',
  styleUrls: ['./modifica-anagrafica.component.scss']
})
export class ModificaAnagraficaComponent implements OnInit {
  
  id!:string;
  elements:any;
  Info:any;
  options = { year: 'numeric', month: 'numeric', day: 'numeric' }as const;//opzioni formato data
  formrcrea!:FormGroup;

  constructor(private router: Router,private activatedRoute:ActivatedRoute, private navbarService: NavbarService,private UserService: UserService, private SocietaApiService: SocietaApiService,private cookieService: CookieService,private formBuilder: FormBuilder) {}

  ngOnInit(): void {
    let ruolo=this.cookieService.get("ruolo");
    this.id=this.cookieService.get("id");
    if(ruolo!="Societa"){
      if(ruolo=="Atleta"){
        //get anagrafica
        this.UserService.GetAnagraficaAtleta(this.cookieService.get("token"),this.id).subscribe(
          obj=>{
            this.Info= obj as Atleta;
            this.Update(ruolo);
            this.setData();
          },
          error=>{
            console.log("error", error);
        })
      }
      else if (ruolo=="Allenatore"){
        //get anagrafica
        this.UserService.GetAnagraficaAllenatore(this.cookieService.get("token"),this.id).subscribe(
          obj=>{
            this.Info= obj as Allenatore;
            this.Update(ruolo);
            this.setData();
          },
          error=>{
            console.log("error", error);
        })
      }    
      else if (ruolo=="Delegato"|| ruolo=="Admin"){
        //get anagrafica
        this.UserService.GetAnagraficaDelegato(this.cookieService.get("token"),this.id).subscribe(
          obj=>{
            this.Info= obj as Delegato;
            this.Update(ruolo);
            this.setData();
          },
          error=>{
            console.log("error", error);
        })
      }   
    }
    else if(ruolo=="Societa"){
        //get anagrafica
        this.SocietaApiService.getAnagraficaSocieta(this.cookieService.get("token"),this.id).subscribe(
          obj=>{
            this.Info= obj as Societa;
            this.elements={
              "Nome Societa":this.Info[0]["nomeSocieta"],
              "Indirizzo":this.Info[0]["indirizzo"],
              "Città": this.Info[0]["citta"],
              "Cap":this.Info[0]["cap"],
              "Data di Fondazione":new Date(this.Info[0]["dataFondazione"]).toLocaleString('it-IT',this.options),
              "Codice Affiliazione":this.Info[0]["codiceAffiliazione"],
              "Email":this.Info[0]["email"],
              "Sito":this.Info[0]["sito"],
              "Tel 1":this.Info[0]["tel1"],
              "Tel 2":this.Info[0]["tel2"],
              "Pec":this.Info[0]["pec"],
              "Piva":this.Info[0]["piva"],
              "Cf":this.Info[0]["cf"],
              "Cu":this.Info[0]["cu"],
              "Presidente":this.Info[0]["presidente"],
              "Referente":this.Info[0]["referente"],
            }
            this.setData();
          },
          error=>{
            console.log("error", error);
        })
      }   
  } 
  setData(){
    this.formrcrea = this.formBuilder.group({
      nome: [this.Info[0]["nome"], Validators.required],
      cognome: [this.Info[0]["cognome"], Validators.required],
      sesso: [this.Info[0]["sesso"], Validators.required],
      cf: [this.Info[0]["cf"], Validators.required],
      datanascita: [this.Info[0]["dataNascita"], Validators.required],
      comunedinascita: [this.Info[0]["comuneNascita"], Validators.required],
      comunediresidenza: [this.Info[0]["comuneResidenza"], Validators.required],
      indirizzo: [this.Info[0]["indirizzo"], Validators.required],
      cap: [this.Info[0]["cap"], Validators.required],
      email: [this.Info[0]["email"], Validators.required],
      tel: [this.Info[0]["tel"], Validators.required],
      altezza: [this.Info[0]["altezza"], Validators.required],
      peso: [this.Info[0]["peso"], Validators.required],
      datascadenzacertificato: [this.Info[0]["dataScadenzaCertificato"], Validators.required],
      puntibase: [this.Info[0]["puntiBase"], Validators.required],
      grado: [this.Info[0]["grado"], Validators.required],
      nomesocieta: [this.Info[0]["nomeSocieta"], Validators.required],
      citta: [this.Info[0]["citta"], Validators.required],
      datafondazione: [this.Info[0]["dataFondazione"], Validators.required],
      codiceaffiliazione: [this.Info[0]["codiceAffiliazione"], Validators.required],
      tel1: [this.Info[0]["tel1"], Validators.required],
      tel2: [this.Info[0]["tel2"], Validators.required],
      pec: [this.Info[0]["pec"], Validators.required],
      piva: [this.Info[0]["piva"], Validators.required],
      cu: [this.Info[0]["cu"], Validators.required],
      presidente: [this.Info[0]["presidente"], Validators.required],
      referente: [this.Info[0]["referente"], Validators.required]
    });
  }
  Update(ruolo:string){
    //stampo informazioni comuni
    this.elements={
      "Nome":this.Info[0]["nome"],
      "Cognome":this.Info[0]["cognome"],
      "Sesso": this.Info[0]["sesso"],
      "CF":this.Info[0]["cf"],
      "Data di Nascita":new Date(this.Info[0]["dataNascita"]).toLocaleString('it-IT',this.options),
      "Comune di Nascita":this.Info[0]["comuneNascita"],
      "Comune di Residenza":this.Info[0]["comuneResidenza"],
      "Indirizzo":this.Info[0]["indirizzo"],
      "CAP":this.Info[0]["cap"],
      "Email":this.Info[0]["email"],
      "Tel":this.Info[0]["tel"],
    }
    if(ruolo=="Atleta"){
      this.elements["Altezza"]=this.Info[0]["altezza"];
      this.elements["Peso"]=this.Info[0]["peso"];
      this.elements["Data scadenza Certificato"]=new Date(this.Info[0]["dataScadenzaCertificato"]).toLocaleString('it-IT',this.options),
      this.elements["Punti Base"]=this.Info[0]["puntiBase"];
    }
    else if(ruolo=="Allenatore"){
      this.elements["Grado"]=this.Info[0]["grado"];
    }
  }

  ModificaAnagrafica_Click(){
    let comuneN;
    let comuneR;
    let ruolo=this.cookieService.get("ruolo").toLocaleLowerCase();
    if(this.cookieService.get("ruolo")=="Admin")ruolo="delegato";
    let body ="{\r\n\""+ruolo+"\":{\r\n";  
    body+="\"id"+ruolo+"\":"+this.id+",\r\n";
    Object.keys(this.formrcrea.controls).forEach(key => {
      if(this.formrcrea.controls[key].status=="VALID"){
        if(key!="comunedinascita"&& key!="comunediresidenza"&& key!="nomesocieta"){
        body += " \"" + key + "\": \"" + this.formrcrea.controls[key].value + "\",\r\n";
        }
        else if(key=="comunedinascita")comuneN=this.formrcrea.controls[key].value;
        else if(key=="comunediresidenza")comuneR=this.formrcrea.controls[key].value;
      }
    });
    body = body.substring(0, body.length - 3);//elimino la virgola finale
    body+="\r\n},\r\n";
    if(ruolo!="societa"){
      body+="\"comuneNascita\":\""+comuneN+"\",\r\n";
      body+="\"comuneResidenza\":\""+comuneR+"\",\r\n";
    }
    if(ruolo=="allenatore"||ruolo=="atleta"){
      body+="\"nomeSocieta\":\""+this.Info[0]["nomeSocieta"]+"\"\r\n}";
    }
    console.log(body);
  }

  originalOrder = (a: KeyValue<number,string>, b: KeyValue<number,string>): number => {
    return 0;
  }
}
