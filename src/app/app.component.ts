import { Component, OnInit } from '@angular/core';
import { ActivatedRoute, Router } from '@angular/router';
import { faBars } from '@fortawesome/free-solid-svg-icons';

import { NavbarService } from './services/navbar.service';
import { CookieService } from 'ngx-cookie-service';

@Component({
  selector: 'app-root',
  templateUrl: './app.component.html',
  styleUrls: ['./app.component.scss']
})
export class AppComponent implements OnInit {
  title = 'aibvc';
  links!: Array<{ text: string, path: string }>;
  isLoggedIn = false;
  faIcon = faBars;

  constructor(private router: Router,private ActivatedRoute: ActivatedRoute, private cookieService: CookieService, private navbarService: NavbarService) {}

  ngOnInit() {
    this.links = this.navbarService.getLinks();
    var passcookie = this.cookieService.get("recuperapassword");
    if(passcookie=="true"){
      this.isLoggedIn=false; 
      this.router.navigate(['newpassword']);
    }
    else{
      //controllo che non ci sia già un utente loggato
      var logcookie = this.cookieService.get("token");
      if(!logcookie){
        this.isLoggedIn=false; 
        console.log("Utente non loggato!");
        this.router.navigate(['login']);
      }
      else{
        this.isLoggedIn=true; 
        this.router.navigate(['OutputTornei/L1']);
      }
    } 
  }
  Change(route:string){
    this.router.navigateByUrl('/', {skipLocationChange: true}).then(() =>
    this.router.navigate([route])
  )}

  LogOut(){
    this.isLoggedIn=false; 
    this.cookieService.deleteAll();
    this.router.navigate(['login']);
  }
}
