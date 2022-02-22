import { Component, ElementRef, OnInit, ViewChild } from '@angular/core';
import * as moment from 'moment';

import { MatPaginator } from '@angular/material/paginator';
import { MatSort } from '@angular/material/sort';
import { MatTableDataSource } from '@angular/material/table';
import { ActivatedRoute, Router } from '@angular/router';
import { CookieService } from 'ngx-cookie-service';
import { Torneo } from 'src/app/models/torneo.model';
import { NavbarService } from 'src/app/services/navbar.service';
import { UserService } from '../../services/user.service';
import { SocietaApiService } from '../../services/societa-api.service';

@Component({
  selector: 'app-output-tornei-iscritti',
  templateUrl: './output-tornei-iscritti.component.html',
  styleUrls: ['./output-tornei-iscritti.component.scss']
})
export class OutputTorneiIscrittiComponent implements OnInit {

  ELEMENT_DATA !: Torneo[];
  displayedColumns: string[] = ['dataInizio','nomeImpianto','titolo','gender','outdoor','montepremi','formula','dataChiusuraIscrizioni','oraInizio'];
  dataSource = new MatTableDataSource<Torneo>(this.ELEMENT_DATA);
  title!:string;
  btniscrivi:boolean;

  @ViewChild(MatPaginator) paginator!: MatPaginator;
  @ViewChild(MatSort) sort!: MatSort;
  constructor(private router: Router,private activatedRoute:ActivatedRoute, private navbarService: NavbarService, private UserService: UserService, private SocietaApiService: SocietaApiService,private cookieService: CookieService) {
    navbarService.clearAllItems();//pulisco la navbar 
    navbarService.addItem(this.cookieService.get("ruolo"));//creo navbar in base al ruolo  
    this.btniscrivi=false;
  }

  ngOnInit(): void {
    this.dataSource.paginator = this.paginator;
    this.dataSource.sort=this.sort;
    this.title="Tornei In Corso";
    if(this.cookieService.get("ruolo")=="Societa") {this.btniscrivi=true;}
    this.InCorsoDowload();
  }

  public doFilter = (value: any) => {
    this.dataSource.filter = (<HTMLInputElement>value.target).value.trim().toLocaleLowerCase();
  }

  onSelect(id:number){
    this.router.navigate(['/InfoTorneo/'+id]);
  }

  @ViewChild('btnIscritti') btnIscritti!:ElementRef;
  @ViewChild('btnInCorso') btnInCorso!:ElementRef;
  @ViewChild('btnFiniti') btnFiniti!:ElementRef;
  Iscritti(){
    //modifico css
    if(!this.btnIscritti.nativeElement.classList.contains("btn-primary")){
      this.btnIscritti.nativeElement.classList.add("btn-primary");
      this.btnIscritti.nativeElement.classList.remove("btn-secondary");
      if(this.btnInCorso.nativeElement.classList.contains("btn-primary")){
      this.btnInCorso.nativeElement.classList.remove("btn-primary");
      this.btnInCorso.nativeElement.classList.add("btn-secondary");
      }
      if(this.btnFiniti.nativeElement.classList.contains("btn-primary")){
        this.btnFiniti.nativeElement.classList.remove("btn-primary");
        this.btnFiniti.nativeElement.classList.add("btn-secondary");
      }
    }
    this.IscrittiDownload();
  }
  IscrittiDownload(){
    if(this.cookieService.get("ruolo")=="Atleta"){
      //scarico tutti i tornei
      this.UserService.GetTorneiIscritti(this.cookieService.get("token"),this.cookieService.get("id")).subscribe(
        obj=>{
          this.dataSource.data=obj  as Torneo[];
          for(let i=0;i<this.dataSource.data.length;i++){
            this.dataSource.data[i]["dataInizio"]=moment(this.dataSource.data[i]["dataInizio"]).format('DD-MM-YYYY');
            this.dataSource.data[i]["dataChiusuraIscrizioni"]=moment(this.dataSource.data[i]["dataChiusuraIscrizioni"]).format('DD-MM-YYYY');
            }
        },
        error=>{
          console.log("error", error);
      })
    }
    else if(this.cookieService.get("ruolo")=="Allenatore"){
      //scarico tutti i tornei
      this.UserService.GetTorneiIscrittiAllenatore(this.cookieService.get("token"),this.cookieService.get("id")).subscribe(
        obj=>{
          this.dataSource.data=obj  as Torneo[];
          for(let i=0;i<this.dataSource.data.length;i++){
            this.dataSource.data[i]["dataInizio"]=moment(this.dataSource.data[i]["dataInizio"]).format('DD-MM-YYYY');
            this.dataSource.data[i]["dataChiusuraIscrizioni"]=moment(this.dataSource.data[i]["dataChiusuraIscrizioni"]).format('DD-MM-YYYY');
            }
        },
        error=>{
          console.log("error", error);
      })
    }
    else if(this.cookieService.get("ruolo")=="Delegato"){
      //scarico tutti i tornei
      this.UserService.GetTorneiIscrittDelegato(this.cookieService.get("token"),this.cookieService.get("id")).subscribe(
        obj=>{
          this.dataSource.data=obj  as Torneo[];
          for(let i=0;i<this.dataSource.data.length;i++){
            this.dataSource.data[i]["dataInizio"]=moment(this.dataSource.data[i]["dataInizio"]).format('DD-MM-YYYY');
            this.dataSource.data[i]["dataChiusuraIscrizioni"]=moment(this.dataSource.data[i]["dataChiusuraIscrizioni"]).format('DD-MM-YYYY');
            }
        },
        error=>{
          console.log("error", error);
      })
    }
  }
  InCorso(){
    //modifico css
    if(!this.btnInCorso.nativeElement.classList.contains("btn-primary")){
      this.btnInCorso.nativeElement.classList.add("btn-primary");
      this.btnInCorso.nativeElement.classList.remove("btn-secondary");
      if(this.btnIscritti.nativeElement.classList.contains("btn-primary")){
      this.btnIscritti.nativeElement.classList.remove("btn-primary");
      this.btnIscritti.nativeElement.classList.add("btn-secondary");
      }
      if(this.btnFiniti.nativeElement.classList.contains("btn-primary")){
        this.btnFiniti.nativeElement.classList.remove("btn-primary");
        this.btnFiniti.nativeElement.classList.add("btn-secondary");
      }
    }
    this.InCorsoDowload();
  }
  InCorsoDowload(){
    if(this.cookieService.get("ruolo")=="Atleta"){
      //scarico tutti i tornei
      this.UserService.GetTorneiInCorso(this.cookieService.get("token"),this.cookieService.get("id")).subscribe(
        obj=>{
          this.dataSource.data=obj  as Torneo[];
          for(let i=0;i<this.dataSource.data.length;i++){
            this.dataSource.data[i]["dataInizio"]=moment(this.dataSource.data[i]["dataInizio"]).format('DD-MM-YYYY');
            this.dataSource.data[i]["dataChiusuraIscrizioni"]=moment(this.dataSource.data[i]["dataChiusuraIscrizioni"]).format('DD-MM-YYYY');
            }
        },
        error=>{
          console.log("error", error);
      })
    }
    else if(this.cookieService.get("ruolo")=="Allenatore"){
      //scarico tutti i tornei
      this.UserService.GetTorneiInCorsoAllenatore(this.cookieService.get("token"),this.cookieService.get("id")).subscribe(
        obj=>{
          this.dataSource.data=obj  as Torneo[];
          for(let i=0;i<this.dataSource.data.length;i++){
            this.dataSource.data[i]["dataInizio"]=moment(this.dataSource.data[i]["dataInizio"]).format('DD-MM-YYYY');
            this.dataSource.data[i]["dataChiusuraIscrizioni"]=moment(this.dataSource.data[i]["dataChiusuraIscrizioni"]).format('DD-MM-YYYY');
            }
        },
        error=>{
          console.log("error", error);
      })
    }
    else if(this.cookieService.get("ruolo")=="Delegato"){
      //scarico tutti i tornei
      this.UserService.GetTorneiInCorsoDelegato(this.cookieService.get("token"),this.cookieService.get("id")).subscribe(
        obj=>{
          this.dataSource.data=obj  as Torneo[];
          for(let i=0;i<this.dataSource.data.length;i++){
            this.dataSource.data[i]["dataInizio"]=moment(this.dataSource.data[i]["dataInizio"]).format('DD-MM-YYYY');
            this.dataSource.data[i]["dataChiusuraIscrizioni"]=moment(this.dataSource.data[i]["dataChiusuraIscrizioni"]).format('DD-MM-YYYY');
            }
        },
        error=>{
          console.log("error", error);
      })
    }
    else if(this.cookieService.get("ruolo")=="Societa"){
      //scarico tutti i tornei
      this.SocietaApiService.GetTorneiInCorsoSocieta(this.cookieService.get("token"),this.cookieService.get("id")).subscribe(
        obj=>{
          this.dataSource.data=obj  as Torneo[];
          for(let i=0;i<this.dataSource.data.length;i++){
            this.dataSource.data[i]["dataInizio"]=moment(this.dataSource.data[i]["dataInizio"]).format('DD-MM-YYYY');
            this.dataSource.data[i]["dataChiusuraIscrizioni"]=moment(this.dataSource.data[i]["dataChiusuraIscrizioni"]).format('DD-MM-YYYY');
            }
        },
        error=>{
          console.log("error", error);
      })
    }
  }
  Finiti(){
    //modifico css
    if(!this.btnFiniti.nativeElement.classList.contains("btn-primary")){
      this.btnFiniti.nativeElement.classList.add("btn-primary");
      this.btnFiniti.nativeElement.classList.remove("btn-secondary");
      if(this.btnInCorso.nativeElement.classList.contains("btn-primary")){
      this.btnInCorso.nativeElement.classList.remove("btn-primary");
      this.btnInCorso.nativeElement.classList.add("btn-secondary");
      }
      if(this.btnIscritti.nativeElement.classList.contains("btn-primary")){
        this.btnIscritti.nativeElement.classList.remove("btn-primary");
        this.btnIscritti.nativeElement.classList.add("btn-secondary");
      }
    }
    this.FinitiDownload();
  }
    FinitiDownload(){
    if(this.cookieService.get("ruolo")=="Atleta"){
      //scarico tutti i tornei
      this.UserService.GetTorneiFiniti(this.cookieService.get("token"),this.cookieService.get("id")).subscribe(
        obj=>{
          this.dataSource.data=obj  as Torneo[];
          for(let i=0;i<this.dataSource.data.length;i++){
            this.dataSource.data[i]["dataInizio"]=moment(this.dataSource.data[i]["dataInizio"]).format('DD-MM-YYYY');
            this.dataSource.data[i]["dataChiusuraIscrizioni"]=moment(this.dataSource.data[i]["dataChiusuraIscrizioni"]).format('DD-MM-YYYY');
            }
        },
        error=>{
          console.log("error", error);
      })
    }
    else if(this.cookieService.get("ruolo")=="Allenatore"){
      //scarico tutti i tornei
      this.UserService.GetTorneiFinitiAllenatore(this.cookieService.get("token"),this.cookieService.get("id")).subscribe(
        obj=>{
          this.dataSource.data=obj  as Torneo[];
          for(let i=0;i<this.dataSource.data.length;i++){
            this.dataSource.data[i]["dataInizio"]=moment(this.dataSource.data[i]["dataInizio"]).format('DD-MM-YYYY');
            this.dataSource.data[i]["dataChiusuraIscrizioni"]=moment(this.dataSource.data[i]["dataChiusuraIscrizioni"]).format('DD-MM-YYYY');
            }
        },
        error=>{
          console.log("error", error);
      })
    }
    else if(this.cookieService.get("ruolo")=="Delegato"){
      //scarico tutti i tornei
      this.UserService.GetTorneiFinitiDelegato(this.cookieService.get("token"),this.cookieService.get("id")).subscribe(
        obj=>{
          this.dataSource.data=obj  as Torneo[];
          for(let i=0;i<this.dataSource.data.length;i++){
            this.dataSource.data[i]["dataInizio"]=moment(this.dataSource.data[i]["dataInizio"]).format('DD-MM-YYYY');
            this.dataSource.data[i]["dataChiusuraIscrizioni"]=moment(this.dataSource.data[i]["dataChiusuraIscrizioni"]).format('DD-MM-YYYY');
            }
        },
        error=>{
          console.log("error", error);
      })
    }
    else if(this.cookieService.get("ruolo")=="Societa"){
      //scarico tutti i tornei
      this.SocietaApiService.GetTorneiFinitiSocieta(this.cookieService.get("token"),this.cookieService.get("id")).subscribe(
        obj=>{
          this.dataSource.data=obj  as Torneo[];
          for(let i=0;i<this.dataSource.data.length;i++){
            this.dataSource.data[i]["dataInizio"]=moment(this.dataSource.data[i]["dataInizio"]).format('DD-MM-YYYY');
            this.dataSource.data[i]["dataChiusuraIscrizioni"]=moment(this.dataSource.data[i]["dataChiusuraIscrizioni"]).format('DD-MM-YYYY');
            }
        },
        error=>{
          console.log("error", error);
      })
    }
  }
}
