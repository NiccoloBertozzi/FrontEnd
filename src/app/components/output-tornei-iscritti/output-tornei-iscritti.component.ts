import { Component, ElementRef, OnInit, ViewChild } from '@angular/core';
import { MatPaginator } from '@angular/material/paginator';
import { MatSort } from '@angular/material/sort';
import { MatTableDataSource } from '@angular/material/table';
import { ActivatedRoute, Router } from '@angular/router';
import { CookieService } from 'ngx-cookie-service';
import { Torneo } from 'src/app/models/torneo.model';
import { NavbarService } from 'src/app/services/navbar.service';
import { UserService } from '../../services/user.service';

@Component({
  selector: 'app-output-tornei-iscritti',
  templateUrl: './output-tornei-iscritti.component.html',
  styleUrls: ['./output-tornei-iscritti.component.scss']
})
export class OutputTorneiIscrittiComponent implements OnInit {

  ELEMENT_DATA !: Torneo[];
  displayedColumns: string[] = ['dataInizio','nomeImpianto','nomeSocieta','gender','outdoor','montepremi','formula','dataChiusuraIscrizioni','oraInizio'];
  dataSource = new MatTableDataSource<Torneo>(this.ELEMENT_DATA);
  title!:string;
  @ViewChild(MatPaginator) paginator!: MatPaginator;
  @ViewChild(MatSort) sort!: MatSort;
  constructor(private router: Router,private activatedRoute:ActivatedRoute, private navbarService: NavbarService, private UserService: UserService,private cookieService: CookieService) {
    navbarService.clearAllItems();//pulisco la navbar 
    navbarService.addItem(this.cookieService.get("ruolo"));//creo navbar in base al ruolo  
  }

  ngOnInit(): void {
    this.dataSource.paginator = this.paginator;
    this.dataSource.sort=this.sort;
    this.title="Tornei Iscritti";
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
    if(this.cookieService.get("ruolo")=="Atleta"){
      //scarico tutti i tornei
      this.UserService.GetTorneiIscritti(this.cookieService.get("token"),this.cookieService.get("id")).subscribe(
        obj=>{
          this.dataSource.data=obj  as Torneo[];
          console.log("TORNEI ISCRITTI",this.dataSource.data);
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
          console.log("TORNEI ISCRITTI",this.dataSource.data);
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
    if(this.cookieService.get("ruolo")=="Atleta"){
      //scarico tutti i tornei
      this.UserService.GetTorneiInCorso(this.cookieService.get("token"),this.cookieService.get("id")).subscribe(
        obj=>{
          this.dataSource.data=obj  as Torneo[];
          console.log("TORNEI INCORSO",this.dataSource.data);
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
          console.log("TORNEI INCORSO",this.dataSource.data);
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
    if(this.cookieService.get("ruolo")=="Atleta"){
      //scarico tutti i tornei
      this.UserService.GetTorneiFiniti(this.cookieService.get("token"),this.cookieService.get("id")).subscribe(
        obj=>{
          this.dataSource.data=obj  as Torneo[];
          console.log("TORNEI FINITI",this.dataSource.data); 
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
          console.log("TORNEI FINITI",this.dataSource.data); 
        },
        error=>{
          console.log("error", error);
      })
    }
  }
}
