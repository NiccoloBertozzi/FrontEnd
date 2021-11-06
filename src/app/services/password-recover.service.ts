import { Injectable } from '@angular/core';
import { HttpClient, HttpHeaders} from '@angular/common/http';
import { Observable } from 'rxjs';
import { PwdRecover } from '../models/pwdrecover.model';

@Injectable({
  providedIn: 'root'
})
export class PasswordRecoverService {

  constructor(private HttpClient:HttpClient) { }
  URL:string="http://80.211.0.174:8082/"; 


  //RECUPERA PASSWORD
  public Recover(body:string):Observable<PwdRecover>{
    const httpOptions = {
      headers: new HttpHeaders({
        "Content-Type": "application/json; charset=UTF-8",
        'Accept':  'application/json'
      })
    }; 
    return this.HttpClient.post<PwdRecover>("api/v1/LoginRegister/RecuperaPassword",body,httpOptions)
  }
}
