import { Injectable } from '@angular/core';
import { HttpClient, HttpHeaders} from '@angular/common/http';
import { Observable } from 'rxjs';
import {Comuni} from '../models/comuni.model';
import {Societa} from '../models/societa.model';
import { Info } from '../models/info.model';

@Injectable({
  providedIn: 'root'
})
export class RegisterService {

  constructor(private HttpClient:HttpClient) { }

  URL = "api/v1/";

  //GET COMUNI
  public getComuni():Observable<Comuni[]>{
    const httpOptions = {
      headers: new HttpHeaders({
        "Content-Type": "application/json; charset=UTF-8",
        'Accept':  'application/json'
      })
    }; 
    return this.HttpClient.get<Comuni[]>(this.URL+"gestionale/GetComuni",httpOptions)
  }

  //GET SOCIETA
  public getSocieta():Observable<Societa[]>{
    const httpOptions = {
      headers: new HttpHeaders({
        "Content-Type": "application/json; charset=UTF-8",
        'Accept':  'application/json'
      })
    }; 
    return this.HttpClient.get<Societa[]>(this.URL+"societa/GetAllSocieta",httpOptions)
  }

  //REGISTER
  public Register(ruolo:string,body:string):Observable<Info>{
    const httpOptions = {
      headers: new HttpHeaders({
        "Content-Type": "application/json; charset=UTF-8",
        'Accept':  'application/json'
      })
    }; 
    return this.HttpClient.post<Info>(this.URL+"LoginRegister/Registra"+ruolo,body,httpOptions)
  }
}
