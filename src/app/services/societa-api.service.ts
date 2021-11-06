import { HttpClient, HttpHeaders} from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Observable } from 'rxjs';
import { Societa } from '../models/societa.model';

@Injectable({
  providedIn: 'root'
})
export class SocietaApiService {

  constructor(private HttpClient:HttpClient) { }
  URL:string="http://80.211.0.174:8082/"; 

  //GET INFO SOCIETA
  public getinfoSocieta(idsocieta:number,token:string):Observable<Societa>{
    const httpOptions = {
      headers: new HttpHeaders({
        "Content-Type": "application/json; charset=UTF-8",
        'Accept':  'application/json',
        'Authorization':'Bearer '+token
      })
    }; 
    return this.HttpClient.get<Societa>("api/v1/societa/GetInfoSocieta/"+idsocieta,httpOptions)
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
    return this.HttpClient.get<Societa>("api/v1/societa/GetAnagraficaSocieta/"+idsocieta,httpOptions)
  }
}
