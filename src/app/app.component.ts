import { Component, OnInit } from '@angular/core';
import { ActivatedRoute, Router } from '@angular/router';
import { faBars } from '@fortawesome/free-solid-svg-icons';

import { NavbarService } from './services/navbar.service';
import { CookieService } from 'ngx-cookie-service';
import { THIS_EXPR } from '@angular/compiler/src/output/output_ast';
import { AuthService } from './services/auth.service';

@Component({
  selector: 'app-root',
  templateUrl: './app.component.html',
  styleUrls: ['./app.component.scss']
})
export class AppComponent implements OnInit {
  title = 'aibvc';
  links!: Array<{ text: string, path: string }>;
  isLoggedIn = AuthService.login;
  faIcon = faBars;

  constructor(private router: Router,private ActivatedRoute: ActivatedRoute, private cookieService: CookieService, private navbarService: NavbarService) {}

  ngOnInit() {
    this.links = this.navbarService.getLinks();
    var passcookie = this.cookieService.get("newpassword");
    if(passcookie=="SI"){
      AuthService.login=false;
      this.isLoggedIn=AuthService.login; 
      this.router.navigate(['newpassword']);
    }
    else{
      //controllo che non ci sia già un utente loggato
      var logcookie = this.cookieService.get("token");
      //se è logattto setto il flag
      if(!logcookie)
        AuthService.login=false;
      else 
        AuthService.login=true;
      this.isLoggedIn=AuthService.login; 
      //va nella home
      this.router.navigate(['OutputTornei/L1/false']); 
    } 
  }
  Change(route:string){
    this.router.navigateByUrl('/', {skipLocationChange: true}).then(() =>
    this.router.navigate([route])
  )}

  LogOut(){
    AuthService.login=false;
    this.isLoggedIn=AuthService.login;  
    this.cookieService.deleteAll();
    this.router.navigate(['login']);
  }
  LogIn(){
    this.cookieService.deleteAll();
    this.router.navigate(['login']);
  }
}
