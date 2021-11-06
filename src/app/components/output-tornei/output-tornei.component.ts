import { Component, OnInit, ViewChild  } from '@angular/core';

import { CookieService } from 'ngx-cookie-service';
import { NavbarService } from '../../services/navbar.service';
import { TorneoAPIService } from '../../services/torneo-api.service';

import { ActivatedRoute, Router } from '@angular/router';
import { MatTableDataSource } from '@angular/material/table';
import { MatPaginator } from '@angular/material/paginator';
import { MatSort } from '@angular/material/sort';
import { Torneo } from '../../models/torneo.model';

@Component({
  selector: 'app-output-tornei',
  templateUrl: './output-tornei.component.html',
  styleUrls: ['./output-tornei.component.scss']
})
export class OutputTorneiComponent implements OnInit {

  ELEMENT_DATA !: Torneo[];
  displayedColumns: string[] = ['dataInizio','localita','nomeSocieta','gender','outdoor','montepremi','formula','oraInizio','coppie','dataChiusuraIscrizioni'];
  dataSource = new MatTableDataSource<Torneo>(this.ELEMENT_DATA);
  title!:string;
  @ViewChild(MatPaginator) paginator!: MatPaginator;
  @ViewChild(MatSort) sort!: MatSort;
  constructor(private router: Router,private activatedRoute:ActivatedRoute, private navbarService: NavbarService, private TorneoAPIService: TorneoAPIService,private cookieService: CookieService) {
    navbarService.clearAllItems();//pulisco la navbar 
    navbarService.addItem(this.cookieService.get("ruolo"));//creo navbar in base al ruolo  
  }
  ngOnInit(): void {  
    this.dataSource.paginator = this.paginator;
    this.dataSource.sort=this.sort;
    //scarico i tornei in base alla tipologia
    let typology=this.activatedRoute.snapshot.paramMap.get('tipologia');
    if(typology=="L1"||typology=="L2"||typology=="L3"){
      this.getTorneiTipo(typology);
      this.title="Tornei "+typology;
    }
    else if(typology=="NonAutorizzati"){
      this.getTorneiNonAutorizzati();
      this.title="Tornei non autorizzati";
    }
  }

  public doFilter = (value: any) => {
    this.dataSource.filter = (<HTMLInputElement>value.target).value.trim().toLocaleLowerCase();
  }

  public getTorneiTipo(type:string){
    //scarico tutti i tornei
    this.TorneoAPIService.getTorneiTipo(type).subscribe(
      obj=>{
        this.dataSource.data=obj  as Torneo[]
      },
      error=>{
        console.log("error", error);
    })
  }
  public getTorneiNonAutorizzati(){
    //scarico tutti i tornei non autorizzati
    this.TorneoAPIService.getTorneiNonAutorizzati(this.cookieService.get("token")).subscribe(
      obj=>{
        this.dataSource.data=obj  as Torneo[]
      },
      error=>{
        console.log("error", error);
    })
  }

  onSelect(id:number){
    this.router.navigate(['/InfoTorneo/'+id]);
  }
}
