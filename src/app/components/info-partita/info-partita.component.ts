import { Component, OnInit } from '@angular/core';
import { ActivatedRoute, Router } from '@angular/router';
import * as moment from 'moment';
import { CookieService } from 'ngx-cookie-service';
import { Partita } from 'src/app/models/partita.model';
import { NavbarService } from 'src/app/services/navbar.service';
import { GestionaleService } from '../../services/gestionale.service';
import { TorneoAPIService } from '../../services/torneo-api.service';

@Component({
  selector: 'app-info-partita',
  templateUrl: './info-partita.component.html',
  styleUrls: ['./info-partita.component.scss']
})
export class InfoPartitaComponent implements OnInit {

  modifica:boolean;

  constructor(private router: Router,private activatedRoute:ActivatedRoute, private navbarService: NavbarService, private GestionaleService: GestionaleService, private TorneoAPIService: TorneoAPIService,private cookieService: CookieService) {
    this.modifica=true;
  }

  partita!: Partita;
  idtorneo:any;
  numpartita:any;
  nomeT!:string;
  ngOnInit(): void {
    //prendo id torneo e num partita dai parametri
    this.idtorneo=this.activatedRoute.snapshot.paramMap.get('id');
    this.numpartita=this.activatedRoute.snapshot.paramMap.get('partita');
  
    //get partita
  this.GestionaleService.getPartita(this.idtorneo,this.numpartita).subscribe(
    obj=>{
      this.partita=obj as Partita;
      this.partita[0]["dataPartita"]=moment(this.partita[0]["dataPartita"]).format('DD-MM-YYYY');
    },
    error=>{
      console.log("error", error);
  })
  
  //get titolo torneo
  this.TorneoAPIService.getTitoloTorneo(this.idtorneo).subscribe(
    obj=>{
      this.nomeT=obj as string;  
    },
    error=>{
      console.log("error", error);
  })

  let ruolo=this.cookieService.get("ruolo");
  if(ruolo=="Admin"||ruolo=="Delegato")this.modifica=false;
  else this.modifica=true;
  }
  
  Modifica(){
    this.router.navigate(['/GestisciPartita/'+this.idtorneo+'/Partita/'+this.numpartita]);
  }
}
