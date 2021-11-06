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

@Component({
  selector: 'app-anagrafica',
  templateUrl: './anagrafica.component.html',
  styleUrls: ['./anagrafica.component.scss']
})
export class AnagraficaComponent implements OnInit {
  id!:string;
  title!:string;
  elements:any;
  Info:any;
  options = { year: 'numeric', month: 'numeric', day: 'numeric' }as const;//opzioni formato data

  constructor(private router: Router,private activatedRoute:ActivatedRoute, private navbarService: NavbarService, private UserService: UserService, private SocietaApiService: SocietaApiService,private cookieService: CookieService) {}

  ngOnInit(): void {
    let ruolo=this.cookieService.get("ruolo");
    this.id=this.cookieService.get("id");
    if(ruolo!="Societa"){
      if(ruolo=="Atleta"){
        this.title="Anagrafica Atleta";
        //get anagrafica
        this.UserService.GetAnagraficaAtleta(this.cookieService.get("token"),this.id).subscribe(
          obj=>{
            this.Info= obj as Atleta;
            this.Update(ruolo);
          },
          error=>{
            console.log("error", error);
        })
      }
      else if (ruolo=="Allenatore"){
        this.title="Anagrafica Allenatore";
        //get anagrafica
        this.UserService.GetAnagraficaAllenatore(this.cookieService.get("token"),this.id).subscribe(
          obj=>{
            this.Info= obj as Allenatore;
            this.Update(ruolo);
          },
          error=>{
            console.log("error", error);
        })
      }    
      else if (ruolo=="Delegato"|| ruolo=="Admin"){
        this.title="Anagrafica Delegato";
        //get anagrafica
        this.UserService.GetAnagraficaDelegato(this.cookieService.get("token"),this.id).subscribe(
          obj=>{
            this.Info= obj as Delegato;
            this.Update(ruolo);
          },
          error=>{
            console.log("error", error);
        })
      }   
    }
    else if(ruolo=="Societa"){
      this.title="Anagrafica Società";
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
              "Telefono 1":this.Info[0]["tel1"],
              "Telefono 2":this.Info[0]["tel2"],
              "Pec":this.Info[0]["pec"],
              "Piva":this.Info[0]["piva"],
              "Cf":this.Info[0]["cf"],
              "Cu":this.Info[0]["cu"],
              "Presidente":this.Info[0]["presidente"],
              "Referente":this.Info[0]["referente"],
            }
          },
          error=>{
            console.log("error", error);
        })
      }   
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
      "Telefono":this.Info[0]["tel"],
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
    this.router.navigate(['/AnagraficaEdit']);
  }
  // Preserve original property order of Info Torneo
  originalOrder = (a: KeyValue<number,string>, b: KeyValue<number,string>): number => {
    return 0;
  }
}
