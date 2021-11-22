import { Component, Inject, OnInit } from '@angular/core';
import { PwdRecover } from 'src/app/models/pwdrecover.model';
import {PasswordRecoverService} from '../../services/password-recover.service';
import {AuthService} from '../../services/auth.service';
import {Auth} from '../../models/auth.model'
import { CookieService } from 'ngx-cookie-service';
import { Router } from '@angular/router';

@Component({
  selector: 'app-new-password',
  templateUrl: './new-password.component.html',
  styleUrls: ['./new-password.component.scss']
})
export class NewPasswordComponent implements OnInit {

  constructor(private PasswordRecoverService:PasswordRecoverService,private AuthService:AuthService,private cookieService: CookieService,private router:Router) { }
  data:any;
  email!:string;
  pwd!:string;
  ngOnInit(): void {
  }
  ChangePassword(){
    let recover:PwdRecover;
    this.PasswordRecoverService.ChangePsw("{\r\n  \"email\": \"" + this.email + "\",\r\n  \"password\":\""+this.pwd+"\"\r\n}").subscribe(
      obj=>{
        recover=obj;
        console.log(recover);
      },
      error=>{
        console.log("error", error);
    })
  }
  Login():void{
    let credenziali=new this.Login();
    credenziali.username=this.email;
    credenziali.pwd=this.pwd;
    //chiamo l'api login
      this.AuthService.Login(credenziali).subscribe(
        //è andato tutto bene
        obj=>{
        this.data=obj
        let auth=new Auth();
        auth=this.data;
        console.log("response",auth);
        //declare date and get current date time
        var date = new Date();
        //add 20 minutes to date
        date.setTime(date.getTime() + (20* 60 * 1000));
      //salvo il token in un cookie che scade mese per mese
      this.cookieService.set("id",auth.id.toString(),{'expires':date});//id
      this.cookieService.set("token",auth.token,{'expires':date});//token
      //cambio pagina
      this.router.navigate(['OutputTornei/L1']);
    },
  error=>{
      console.log("error", error);
  })
}
}
