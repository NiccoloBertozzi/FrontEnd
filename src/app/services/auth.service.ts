import { Injectable } from '@angular/core';
import { HttpClient,HttpHeaders}from '@angular/common/http';
import { Observable } from 'rxjs';

import {Login} from '../models/login.model';

@Injectable({
  providedIn: 'root'
})
export class AuthService {

  constructor(private HttpClient:HttpClient) { }
  URL:string="http://80.211.0.174:8082/"; 
  public Login(credenziali:Login) : Observable<Login>{
    const httpOptions = {
      headers: new HttpHeaders({
        "Content-Type": "application/json; charset=UTF-8",
        'Accept':  'application/json',
      }),
      withCredentials: true,
    }; 
    const body = {email: credenziali.username, password: credenziali.pwd};
    return this.HttpClient.post<Login>("api/v1/LoginRegister/Login",body,httpOptions)
  }
}
