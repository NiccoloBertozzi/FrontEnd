import { Injectable } from '@angular/core';
import { HttpClient, HttpHeaders} from '@angular/common/http';
import { Observable } from 'rxjs';
import { Torneo } from '../models/torneo.model';
import { Impianto } from '../models/impianto.model';
import { TipoTorneo } from '../models/tipoTorneo.model';
import { FormulaTorneo } from '../models/formulaTorneo.model';
import { ParametroTorneo } from '../models/parametroTorneo.model';
import { Info } from '../models/info.model';
import { Squadra } from '../models/squadra.model';
import { Partita } from '../models/partita.model';
import { ClassificaTorneo } from '../models/classificaTorneo.model';
import { TestaDiSerie } from '../models/testadiserie.model';
import { environment } from '../../environments/environment';

@Injectable({
  providedIn: 'root'
})
export class TorneoAPIService {

  constructor(private HttpClient:HttpClient) { }

  //GET TORNEI
  public getAllTornei():Observable<Torneo[]>{
    const httpOptions = {
      headers: new HttpHeaders({
        "Content-Type": "application/json; charset=UTF-8",
        'Accept':  'application/json'
      })
    }; 
    return this.HttpClient.get<Torneo[]>(environment.apiURL+"api/v1/tornei/GetTornei",httpOptions)
  }
  //GET TORNEI TIPO
  public getTorneiTipo(tipo:string):Observable<Torneo[]>{
    const httpOptions = {
      headers: new HttpHeaders({
        "Content-Type": "application/json; charset=UTF-8",
        'Accept':  'application/json'
      })
    }; 
    return this.HttpClient.get<Torneo[]>(environment.apiURL+"api/v1/tornei/GetTorneiTipo/"+tipo,httpOptions)
  }
  public getTorneiTipoStorico(tipo:string):Observable<Torneo[]>{
    const httpOptions = {
      headers: new HttpHeaders({
        "Content-Type": "application/json; charset=UTF-8",
        'Accept':  'application/json'
      })
    }; 
    return this.HttpClient.get<Torneo[]>(environment.apiURL+"api/v1/tornei/GetTorneiTipoStorico/"+tipo,httpOptions)
  }
  //GET TORNEI NON AUTORIZZATI
  public getTorneiNonAutorizzati(token:string):Observable<Torneo[]>{
    const httpOptions = {
      headers: new HttpHeaders({
        "Content-Type": "application/json; charset=UTF-8",
        'Accept':  'application/json',
        'Authorization':'Bearer '+token
      })
    }; 
    return this.HttpClient.get<Torneo[]>(environment.apiURL+"api/v1/tornei/GetTorneiNonAutorizzati",httpOptions)
  }
  //GET INFO TORNEO
  public getInfoTorneo(id:number):Observable<Torneo>{
    const httpOptions = {
      headers: new HttpHeaders({
        "Content-Type": "application/json; charset=UTF-8",
        'Accept':  'application/json'
      })
    }; 
    return this.HttpClient.get<Torneo>(environment.apiURL+"api/v1/supervisore/GetTorneoByID/"+id,httpOptions)
  }
  //GET L'IMPIANTO DI UNA SOCIETA
  public getImpiantoSocieta(idsocieta:number,idimpianto:number,token:string):Observable<Impianto>{
    const httpOptions = {
      headers: new HttpHeaders({
        "Content-Type": "application/json; charset=UTF-8",
        'Accept':  'application/json',
        'Authorization':'Bearer '+token
      })
    }; 
    return this.HttpClient.get<Impianto>(environment.apiURL+"api/v1/societa/GetImpianto/"+idsocieta+"/Impianto/"+idimpianto,httpOptions)
  }
  //GET IMPIANTI DI UNA SOCIETA
  public getImpiantiSocieta(idsocieta:number,token:string):Observable<Impianto[]>{
    const httpOptions = {
      headers: new HttpHeaders({
        "Content-Type": "application/json; charset=UTF-8",
        'Accept':  'application/json',
        'Authorization':'Bearer '+token
      })
    }; 
    return this.HttpClient.get<Impianto[]>(environment.apiURL+"api/v1/tornei/GetImpianti/"+idsocieta,httpOptions)
  }
  //GET TIPI TORNEO
  public getTipiTorneo():Observable<TipoTorneo[]>{
    const httpOptions = {
      headers: new HttpHeaders({
        "Content-Type": "application/json; charset=UTF-8",
        'Accept':  'application/json'
      })
    }; 
    return this.HttpClient.get<TipoTorneo[]>(environment.apiURL+"api/v1/tornei/TipoTorneo",httpOptions)
  }
  //GET FORMULA TORNEO
  public getFormulaTorneo():Observable<FormulaTorneo[]>{
    const httpOptions = {
      headers: new HttpHeaders({
        "Content-Type": "application/json; charset=UTF-8",
        'Accept':  'application/json'
      })
    }; 
    return this.HttpClient.get<FormulaTorneo[]>(environment.apiURL+"api/v1/tornei/FormulaTorneo",httpOptions)
  }
  //GET PARAMETRI TORNEO
  public getParametriTorneo():Observable<ParametroTorneo[]>{
    const httpOptions = {
      headers: new HttpHeaders({
        "Content-Type": "application/json; charset=UTF-8",
        'Accept':  'application/json'
      })
    }; 
    return this.HttpClient.get<ParametroTorneo[]>(environment.apiURL+"api/v1/tornei/ParametroTorneo",httpOptions)
  }
  //CREA TORNEO
  public CreaTorneo(token:string,body:string):Observable<Info>{
    const httpOptions = {
      headers: new HttpHeaders({
        "Content-Type": "application/json; charset=UTF-8",
        'Accept':  'application/json',
        'Authorization':'Bearer '+token
      })
    }; 
    return this.HttpClient.post<Info>(environment.apiURL+"api/v1/tornei/CreaTorneo",body,httpOptions)
  }
  //AUTORIZZA TORNEO
  public AutorizzaTorneo(token:string,idTorneo:string,stato:boolean):Observable<string>{
    const httpOptions = {
      headers: new HttpHeaders({
        "Content-Type": "application/json; charset=UTF-8",
        'Accept':  'application/json',
        'Authorization':'Bearer '+token
      })
    }; 
    console.log(httpOptions.headers);
    return this.HttpClient.put<string>(environment.apiURL+"api/v1/tornei/AutorizzaTorneo/"+idTorneo+"/Stato/"+stato,null,httpOptions)
  }
  //CHECK AUTORIZZAZIONE
  public CheckAutorizzazione(idTorneo:string):Observable<boolean>{
    const httpOptions = {
      headers: new HttpHeaders({
        "Content-Type": "application/json; charset=UTF-8",
        'Accept':  'application/json'
      })
    }; 
    return this.HttpClient.get<boolean>(environment.apiURL+"api/v1/tornei/ControllaAutorizzazione/"+idTorneo,httpOptions)
  }
  //GET SQUADRE TORNEO
  public getSquadreTorneo(token:string,idTorneo:string):Observable<Squadra[]>{
    const httpOptions = {
      headers: new HttpHeaders({
        "Content-Type": "application/json; charset=UTF-8",
        'Accept':  'application/json',
        'Authorization':'Bearer '+token
      })
    }; 
    return this.HttpClient.get<Squadra[]>(environment.apiURL+"api/v1/tornei/SquadreTorneo/"+idTorneo,httpOptions)
  }
  //CONTROLLO CHIUSURA ISCRIZIONI
  public ControlloChiusuraIscrizioni(token:string,idTorneo:string):Observable<boolean>{
    const httpOptions = {
      headers: new HttpHeaders({
        "Content-Type": "application/json; charset=UTF-8",
        'Accept':  'application/json',
        'Authorization':'Bearer '+token
      })
    }; 
    return this.HttpClient.get<boolean>(environment.apiURL+"api/v1/tornei/ControlloChiusuraIscrizioni/"+idTorneo,httpOptions)
  }
  //CONTROLLO INIZIO TORNEO
  public ControlloInizioTorneo(token:string,idTorneo:string):Observable<boolean>{
    const httpOptions = {
      headers: new HttpHeaders({
        "Content-Type": "application/json; charset=UTF-8",
        'Accept':  'application/json',
        'Authorization':'Bearer '+token
      })
    }; 
    return this.HttpClient.get<boolean>(environment.apiURL+"api/v1/tornei/ControlloInizioTorneo/"+idTorneo,httpOptions)
  }
   //CONTROLLO PRESENZA TABELLONE TORNEO
   public ControlloPresenzaTabellone(token:string,idTorneo:string):Observable<boolean>{
    const httpOptions = {
      headers: new HttpHeaders({
        "Content-Type": "application/json; charset=UTF-8",
        'Accept':  'application/json',
        'Authorization':'Bearer '+token
      })
    }; 
    return this.HttpClient.get<boolean>(environment.apiURL+"api/v1/tornei/ControlloPresenzaTabellone/"+idTorneo,httpOptions)
  }
  //CREA LISTA INGRESSO
  public CreaListaIngresso(token:string,idTorneo:string,idutente:string):Observable<Info>{
    const httpOptions = {
      headers: new HttpHeaders({
        "Content-Type": "application/json; charset=UTF-8",
        'Accept':  'application/json',
        'Authorization':'Bearer '+token
      })
    }; 
    return this.HttpClient.post<Info>(environment.apiURL+"api/v1/tornei/CreaListaIngresso/"+idTorneo+"/Supervisore/"+idutente,null,httpOptions)
  }
  //CREA TORNEO QUALIFICHE
  public CreaTorneoQualifiche(token:string,idTorneo:string,datafine:string,datainizio:string):Observable<Info>{
    const httpOptions = {
      headers: new HttpHeaders({
        "Content-Type": "application/json; charset=UTF-8",
        'Accept':  'application/json',
        'Authorization':'Bearer '+token
      })
    }; 
    return this.HttpClient.post<Info>(environment.apiURL+"api/v1/tornei/CreaTorneoQualifiche/"+idTorneo+"/"+datainizio+"/"+datafine+"/"+datafine,null,httpOptions)
  }
  //CREA POOl
  public Creapool(token:string,idTorneo:string):Observable<Info>{
    const httpOptions = {
      headers: new HttpHeaders({
        "Content-Type": "application/json; charset=UTF-8",
        'Accept':  'application/json',
        'Authorization':'Bearer '+token
      })
    }; 
    return this.HttpClient.post<Info>(environment.apiURL+"api/v1/tornei/CreaPool/"+idTorneo,httpOptions)
  }
  //GET TESTA DI SERIE  
  public GetTestadiSerie(token:string,idTorneo:string):Observable<TestaDiSerie[]>{
    const httpOptions = {
      headers: new HttpHeaders({
        "Content-Type": "application/json; charset=UTF-8",
        'Accept':  'application/json',
        'Authorization':'Bearer '+token
      })
    }; 
    return this.HttpClient.get<TestaDiSerie[]>(environment.apiURL+"api/v1/tornei/GetTestadiSerie/"+idTorneo,httpOptions)
  }
  //GET PARTITE TORNEO
  public GetPartiteTorneo(token:string,idTorneo:string):Observable<Partita[]>{
    const httpOptions = {
      headers: new HttpHeaders({
        "Content-Type": "application/json; charset=UTF-8",
        'Accept':  'application/json',
        'Authorization':'Bearer '+token
      })
    }; 
    return this.HttpClient.get<Partita[]>(environment.apiURL+"api/v1/tornei/GetPartiteTorneo/"+idTorneo,httpOptions)
  }
  //GET PARAMETRI TORNEO
  public getClassificaTorneo(token:string,idTorneo:string):Observable<ClassificaTorneo[]>{
    const httpOptions = {
      headers: new HttpHeaders({
        "Content-Type": "application/json; charset=UTF-8",
        'Accept':  'application/json',
        'Authorization':'Bearer '+token
      })
    }; 
    return this.HttpClient.get<ClassificaTorneo[]>(environment.apiURL+"api/v1/tornei/GetClassifica/"+idTorneo,httpOptions)
  }
  //GET TOUR TORNEO
  public getTourTorneo():Observable<string[]>{
    const httpOptions = {
      headers: new HttpHeaders({
        "Content-Type": "application/json; charset=UTF-8",
        'Accept':  'application/json'
      })
    }; 
    return this.HttpClient.get<string[]>(environment.apiURL+"api/v1/tornei/GetTourTornei/",httpOptions)
  }
  //GET TITOLO TORNEO
  public getTitoloTorneo(idTorneo:string):Observable<string>{
    const httpOptions = {
      headers: new HttpHeaders({
        "Content-Type": "application/json; charset=UTF-8",
        'Accept':  'application/json'
      })
    }; 
    return this.HttpClient.get<string>(environment.apiURL+"api/v1/tornei/GetTitoloTorneo/"+idTorneo,httpOptions)
  }
  //ISCRIVI SQUADRA
  public IscriviSquadra(token:string,body:string):Observable<Info>{
    const httpOptions = {
      headers: new HttpHeaders({
        "Content-Type": "application/json; charset=UTF-8",
        'Accept':  'application/json',
        'Authorization':'Bearer '+token
      })
    }; 
    return this.HttpClient.post<Info>(environment.apiURL+"api/v1/tornei/InserisciSquadra",body,httpOptions)
  }
}
