import { Component, Inject, OnInit, ViewChild } from '@angular/core';
import { Router } from '@angular/router';

import {AuthService} from '../../services/auth.service';
import {PasswordRecoverService} from '../../services/password-recover.service';
import {Login} from '../../models/login.model'
import {Auth} from '../../models/auth.model'
import {PwdRecover} from '../../models/pwdrecover.model'

import { NavbarService } from '../../services/navbar.service';
import { CookieService } from 'ngx-cookie-service';
import {MatDialog, MatDialogRef, MAT_DIALOG_DATA} from '@angular/material/dialog';
import { AppComponent } from 'src/app/app.component';
export interface DialogData {
  info: string;
}
@Component({
  selector: 'app-login',
  templateUrl: './login.component.html',
  styleUrls: ['./login.component.scss']
})
export class LoginComponent implements OnInit {
  data:any;
  email!:string;
  pwd!:string;
  info!: string;

  constructor(public dialog: MatDialog,private AuthService:AuthService,private PasswordRecoverService:PasswordRecoverService,private router:Router,private cookieService: CookieService,private navbarService: NavbarService) { 
    navbarService.clearAllItems();
  }

  ngOnInit(): void {
  }
 openDialog(): void {
  const dialogRef = this.dialog.open(DialogOverviewExampleDialog, {
    panelClass: 'custom-dialog-container',
    data: {info: this.info},
  });
}
  //Login
  Login():void{
    let credenziali=new Login();
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
      AuthService.login=true;
      //cambio pagina
      if(this.cookieService.get("ruolo")=="Admin") {this.router.navigate(['OutputTornei/NonAutorizzati/false']);}
      else{
        this.router.navigate(['OutputTorneiIscritti']);
      }
    },
  error=>{
      console.log("error", error);
      this.info=error.error.message;
        this.openDialog();
  })
}

  //mostra password
  @ViewChild('PWD') mostra;
  showPassword() {
    if (this.mostra.nativeElement.type === "password") {
      this.mostra.nativeElement.type = "text";
    }
    else
    {
      this.mostra.nativeElement.type = "password";
    }
  }

  //recupera password
  RecoverPassword(){
    let recover:PwdRecover;
    //Call Service
    this.PasswordRecoverService.Recover("{\r\n  \"email\": \"" + this.email + "\",\r\n  \"password\": \"\"\r\n}").subscribe(
      obj=>{
        recover=obj;
        console.log(recover);
        this.info="Email inviata a "+this.email;
        this.openDialog();
      },
      error=>{
        console.log("error", error);
    })
  }

}


@Component({
  selector: 'dialog-overview-example-dialog',
  templateUrl: 'dialog.html',
})
export class DialogOverviewExampleDialog {
  constructor(
    public dialogRef: MatDialogRef<DialogOverviewExampleDialog>,
    @Inject(MAT_DIALOG_DATA) public data: DialogData,
  ) {}

  onNoClick(): void {
    this.dialogRef.close();
  }
}