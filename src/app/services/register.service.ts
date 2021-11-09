import { Injectable } from '@angular/core';
import { HttpClient, HttpHeaders} from '@angular/common/http';
import { Observable } from 'rxjs';
import {Comuni} from '../models/comuni.model';
import {Societa} from '../models/societa.model';
import { Info } from '../models/info.model';
import { environment } from '../../environments/environment';

@Injectable({
  providedIn: 'root'
})
export class RegisterService {

  constructor(private HttpClient:HttpClient) { }


  //GET COMUNI
  public getComuni():Observable<Comuni[]>{
    const httpOptions = {
      headers: new HttpHeaders({
        "Content-Type": "application/json; charset=UTF-8",
        'Accept':  'application/json'
      })
    }; 
    return this.HttpClient.get<Comuni[]>(environment.apiURL+"api/v1/gestionale/GetComuni",httpOptions)
  }

  //GET SOCIETA
  public getSocieta():Observable<Societa[]>{
    const httpOptions = {
      headers: new HttpHeaders({
        "Content-Type": "application/json; charset=UTF-8",
        'Accept':  'application/json'
      })
    }; 
    return this.HttpClient.get<Societa[]>(environment.apiURL+"api/v1/societa/GetAllSocieta",httpOptions)
  }

  //REGISTER
  public Register(ruolo:string,body:string):Observable<Info>{
    const httpOptions = {
      headers: new HttpHeaders({
        "Content-Type": "application/json; charset=UTF-8",
        'Accept':  'application/json'
      })
    }; 
    return this.HttpClient.post<Info>(environment.apiURL+"api/v1/LoginRegister/Registra"+ruolo,body,httpOptions)
  }
}
