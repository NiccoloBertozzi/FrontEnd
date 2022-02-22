import { HttpClient, HttpHeaders} from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Observable } from 'rxjs';
import { Societa } from '../models/societa.model';
import { environment } from '../../environments/environment';
import { Torneo } from '../models/torneo.model';
import { Info } from '../models/info.model';

@Injectable({
  providedIn: 'root'
})
export class SocietaApiService {

  constructor(private HttpClient:HttpClient) { }

  //GET INFO SOCIETA
  public getinfoSocieta(idsocieta:number,token:string):Observable<Societa>{
    const httpOptions = {
      headers: new HttpHeaders({
        "Content-Type": "application/json; charset=UTF-8",
        'Accept':  'application/json',
        'Authorization':'Bearer '+token
      })
    }; 
    return this.HttpClient.get<Societa>(environment.apiURL+"api/v1/societa/GetInfoSocieta/"+idsocieta,httpOptions)
  }
  //GET ANAGRAFICA SOCIETA
  public getAnagraficaSocieta(token:string,idsocieta:string):Observable<Societa>{
    const httpOptions = {
      headers: new HttpHeaders({
        "Content-Type": "application/json; charset=UTF-8",
        'Accept':  'application/json',
        'Authorization':'Bearer '+token
      })
    }; 
    return this.HttpClient.get<Societa>(environment.apiURL+"api/v1/societa/GetAnagraficaSocieta/"+idsocieta,httpOptions)
  }
  //GET Tornei In corso Societa
  public GetTorneiInCorsoSocieta(token:string,idutente:string):Observable<Torneo[]>{
    const httpOptions = {
      headers: new HttpHeaders({
        "Content-Type": "application/json; charset=UTF-8",
        'Accept':  'application/json',
        'Authorization':'Bearer '+token
      })
    }; 
    return this.HttpClient.get<Torneo[]>(environment.apiURL+"api/v1/societa/TorneiInCorso/"+idutente,httpOptions)
  }
  //GET Tornei finiti Delegato
  public GetTorneiFinitiSocieta(token:string,idutente:string):Observable<Torneo[]>{
    const httpOptions = {
      headers: new HttpHeaders({
        "Content-Type": "application/json; charset=UTF-8",
        'Accept':  'application/json',
        'Authorization':'Bearer '+token
      })
    }; 
    return this.HttpClient.get<Torneo[]>(environment.apiURL+"api/v1/societa/TorneiFiniti/"+idutente,httpOptions)
  }
  //Add Impianti
  public AddImpianti(token:string,body:string):Observable<Info>{
    const httpOptions = {
      headers: new HttpHeaders({
        "Content-Type": "application/json; charset=UTF-8",
        'Accept':  'application/json',
        'Authorization':'Bearer '+token
      })
    }; 
    return this.HttpClient.post<Info>(environment.apiURL+"api/v1/societa/AddImpianto",body,httpOptions)
  }
}
