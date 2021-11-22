import { Injectable } from '@angular/core';
import { HttpClient, HttpHeaders} from '@angular/common/http';
import { Observable } from 'rxjs';
import { PwdRecover } from '../models/pwdrecover.model';
import { environment } from '../../environments/environment';

@Injectable({
  providedIn: 'root'
})
export class PasswordRecoverService {

  constructor(private HttpClient:HttpClient) { }


  //RECUPERA PASSWORD
  public Recover(body:string):Observable<PwdRecover>{
    const httpOptions = {
      headers: new HttpHeaders({
        "Content-Type": "application/json; charset=UTF-8",
        'Accept':  'application/json'
      })
    }; 
    return this.HttpClient.post<PwdRecover>(environment.apiURL+"api/v1/LoginRegister/RecuperaPassword",body,httpOptions)
  }

  public ChangePsw(body:string):Observable<PwdRecover>{
    const httpOptions = {
      headers: new HttpHeaders({
        "Content-Type": "application/json; charset=UTF-8",
        'Accept':  'application/json'
      })
    }; 
    return this.HttpClient.post<PwdRecover>(environment.apiURL+"api/v1/LoginRegister/CambiaPsw",body,httpOptions)
  }
}
