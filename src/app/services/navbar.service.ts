import { Injectable } from '@angular/core';

@Injectable({
  providedIn: 'root'
})
export class NavbarService {

  private links = new Array<{ text: string, path: string }>();

  constructor() { }
  getLinks() {
    return this.links;
  }
  addItem(ruolo:string) {
    if(ruolo!="")this.links.push({ text: "Anagrafica", path: "Anagrafica" });
    if(ruolo=="Societa"){
    this.links.push({ text: "Crea Torneo", path: "CreaTorneo" });
    this.links.push({ text: "Aggiungi Impianto", path: "AddImpianto" }); 
  }
  else if(ruolo=="Admin")
    this.links.push({ text: "Autorizza Torneo", path: "OutputTornei/NonAutorizzati/false"});
    else if(ruolo=="Atleta"||ruolo=="Allenatore"){
    this.links.push({ text: "Tornei Iscritti", path: "OutputTorneiIscritti"});
    }
  }
  clearAllItems() {
    this.links.length = 0;
  }
}
