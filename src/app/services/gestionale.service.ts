import { Injectable } from '@angular/core';
import { HttpClient,HttpHeaders}from '@angular/common/http';
import { Observable } from 'rxjs';
import { Classifica } from '../models/classifica.model';
import { PuntiTappaAtleta } from '../models/PuntiTappaAtleta.model';
import { Partita } from '../models/partita.model';
import { Info } from '../models/info.model';
import { environment } from '../../environments/environment';
@Injectable({
  providedIn: 'root'
})
export class GestionaleService {

  constructor(private HttpClient:HttpClient) { }
  //GET CLASSIFICA
  public getClassifica(genere:string) : Observable<Classifica[]>{
    const httpOptions = {
      headers: new HttpHeaders({
        "Content-Type": "application/json; charset=UTF-8",
        'Accept':  'application/json',
      }),
    }; 
    return this.HttpClient.get<Classifica[]>(environment.apiURL+"api/v1/gestionale/GetClassifica/"+genere,httpOptions)
  }//GET CLASSIFICA
  public getClassificaTour(genere:string,tour:string) : Observable<Classifica[]>{
    const httpOptions = {
      headers: new HttpHeaders({
        "Content-Type": "application/json; charset=UTF-8",
        'Accept':  'application/json',
      }),
    }; 
    return this.HttpClient.get<Classifica[]>(environment.apiURL+"api/v1/gestionale/GetClassificaTour/"+genere+"/Tour/"+tour,httpOptions)
  }
  public getPuntiAltetaTappa(tour:string,idalteta:string) : Observable<PuntiTappaAtleta[]>{
    const httpOptions = {
      headers: new HttpHeaders({
        "Content-Type": "application/json; charset=UTF-8",
        'Accept':  'application/json',
      }),
    }; 
    return this.HttpClient.get<PuntiTappaAtleta[]>(environment.apiURL+"api/v1/gestionale/GetPuntiAletaTappa/"+tour+"/Atleta/"+idalteta,httpOptions)
  }
  public getTappe(tour:string,) : Observable<string[]>{
    const httpOptions = {
      headers: new HttpHeaders({
        "Content-Type": "application/json; charset=UTF-8",
        'Accept':  'application/json',
      }),
    }; 
    return this.HttpClient.get<string[]>(environment.apiURL+"api/v1/gestionale/GetTappe/"+tour,httpOptions)
  }
  public getPartita(idtorneo:string,numpartita:string) : Observable<Partita>{
    const httpOptions = {
      headers: new HttpHeaders({
        "Content-Type": "application/json; charset=UTF-8",
        'Accept':  'application/json',
      }),
    }; 
    return this.HttpClient.get<Partita>(environment.apiURL+"api/v1/supervisore/GetPartita/"+idtorneo+"/Partita/"+numpartita,httpOptions)
  }
  public UpdateInfoPartita(token:string,body:string) : Observable<Info>{
    const httpOptions = {
      headers: new HttpHeaders({
        "Content-Type": "application/json; charset=UTF-8",
        'Accept':  'application/json',
        'Authorization':'Bearer '+token
      }),
    }; 
    return this.HttpClient.put<Info>(environment.apiURL+"api/v1/tornei/AssegnaInfoPartita",body,httpOptions)
  }
  public UpdateInfoRisultatiPartita(token:string,body:string) : Observable<string>{
    const httpOptions = {
      headers: new HttpHeaders({
        "Content-Type": "application/json; charset=UTF-8",
        'Accept':  'application/json',
        'Authorization':'Bearer '+token
      }),
    }; 
    return this.HttpClient.put<string>(environment.apiURL+"api/v1/supervisore/AggiornaRisultati",body,httpOptions)
  }
  //GET ANAGRAFICHE
  public getAnagrafiche(token:string,ruolo:string,id:string) : Observable<Classifica[]>{
    const httpOptions = {
      headers: new HttpHeaders({
        "Content-Type": "application/json; charset=UTF-8",
        'Accept':  'application/json',
        'Authorization':'Bearer '+token
      }),
    };
    if(ruolo=="Atleta")
    return this.HttpClient.get<Classifica[]>(environment.apiURL+"api/v1/atleti/GetAnagraficaAtleta/"+id,httpOptions)
    else if(ruolo=="Allenatore")
    return this.HttpClient.get<Classifica[]>(environment.apiURL+"api/v1/allenatore/GetAnagraficaAllenatore/"+id,httpOptions)
    else if(ruolo=="Delegato"||ruolo=="Admin")
    return this.HttpClient.get<Classifica[]>(environment.apiURL+"api/v1/GetAnagraficaDelegato/"+id,httpOptions)
    return this.HttpClient.get<Classifica[]>(environment.apiURL+"api/v1/societa/GetAnagraficaSocieta/"+id,httpOptions)
  }
}
