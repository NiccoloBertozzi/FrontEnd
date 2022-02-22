import { Injectable } from '@angular/core';
import { HttpClient,HttpHeaders}from '@angular/common/http';
import { Observable } from 'rxjs';

import {Login} from '../models/login.model';
import { environment } from '../../environments/environment';

@Injectable({
  providedIn: 'root'
})
export class AuthService {

  static login=false;

  constructor(private HttpClient:HttpClient) { }
  public Login(credenziali:Login) : Observable<Login>{
    const httpOptions = {
      headers: new HttpHeaders({
        "Content-Type": "application/json; charset=UTF-8",
        'Accept':  'application/json',
      }),
    }; 
    const body = {email: credenziali.username, password: credenziali.pwd};
    return this.HttpClient.post<Login>(environment.apiURL+"api/v1/LoginRegister/Login",body,httpOptions)
  }
  public SetLogin(status){
    AuthService.login=status;
  }
}
