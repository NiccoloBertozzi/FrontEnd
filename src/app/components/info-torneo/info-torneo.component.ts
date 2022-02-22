import { Component, OnInit, ViewChild} from '@angular/core';
import { Torneo } from 'src/app/models/torneo.model';
import { ActivatedRoute,Router} from '@angular/router';

import { CookieService } from 'ngx-cookie-service';
import { TorneoAPIService } from '../../services/torneo-api.service';
import { SocietaApiService } from '../../services/societa-api.service';
import { KeyValue,Location } from '@angular/common';
import { Impianto } from 'src/app/models/impianto.model';
import { Societa } from 'src/app/models/societa.model';
import { Squadra } from 'src/app/models/squadra.model';
import { MatTableDataSource } from '@angular/material/table';
import { MatPaginator } from '@angular/material/paginator';
import { MatSort } from '@angular/material/sort';

@Component({
  selector: 'app-info-torneo',
  templateUrl: './info-torneo.component.html',
  styleUrls: ['./info-torneo.component.scss']
})
export class InfoTorneoComponent implements OnInit {
 
  id:any;
  btnautorizza:boolean;
  btniscrivi:boolean;
  btntabellone:boolean;
  assegnadelegato:boolean;

  ELEMENT_DATA !: Squadra[];
  displayedColumns: string[] = ['index','nomeTeam','atleta1','atleta2','entrypoints'];
  dataSource = new MatTableDataSource<Squadra>(this.ELEMENT_DATA);
  @ViewChild(MatPaginator) paginator!: MatPaginator;
  @ViewChild(MatSort) sort!: MatSort;
  constructor(private TorneoAPIService: TorneoAPIService,private SocietaApiService: SocietaApiService,private activatedRoute:ActivatedRoute,private Router:Router,private cookieService: CookieService,private location: Location) 
  {
    this.btnautorizza=true;
    this.btniscrivi=true;
    this.btntabellone=true;
    this.assegnadelegato=true;

    this.id=this.activatedRoute.snapshot.paramMap.get('id');
    if(this.cookieService.get("ruolo")=="Atleta" ||this.cookieService.get("ruolo")=="Delegato" || this.cookieService.get("ruolo")=="Admin")this.CheckAutorizzazione();
  }
  
  Info!:Torneo;
  Impianto!:Impianto;
  InfoSchematizato:any;
  InfoLocalita:any;
  Societa!:Societa;
  ngOnInit(): void {
    this.dataSource.paginator = this.paginator;
    this.dataSource.sort=this.sort;
    //prendo parametro id dall URL
     //scarico info Torneo/id
     this.TorneoAPIService.getInfoTorneo(parseInt(this.id)).subscribe(
      obj=>{
        this.Info=obj  as Torneo;
        let options = { year: 'numeric', month: 'numeric', day: 'numeric' }as const;//opzioni formato data

        //scarico info societa
        this.SocietaApiService.getinfoSocieta(parseInt(this.Info[0]["idSocieta"]),this.cookieService.get("token")).subscribe(
          obj2=>{
              this.Societa=obj2 as Societa;
              //riempio un array per stamapre dinamicamente poi html
              this.InfoSchematizato={
                "Tipo torneo":this.Info[0]["tipoTorneo"],
                "Titolo":this.Info[0]["titolo"],
                "Società": this.Societa[0]["nomeSocieta"],
                "Data chiusura iscrizioni":new Date(this.Info[0]["dataChiusuraIscrizioni"]).toLocaleString('it-IT',options),
                "Data Inizio":new Date(this.Info[0]["dataInizio"]).toLocaleString('it-IT',options),
                "Data Fine":new Date(this.Info[0]["dataFine"]).toLocaleString('it-IT',options),
                "Formula":this.Info[0]["formula"],
                "Genere":this.Info[0]["gender"],
                "Montepremi":this.Info[0]["montepremi"]+"€",
                "Numero squadre":this.Info[0]["numMaxTeamMainDraw"],
                "Outodoor":this.Info[0]["outdoor"]?"Si":"No",
                "Punti Vittoria":this.Info[0]["puntiVittoria"],
                "Quota Iscrizione":this.Info[0]["quotaIscrizione"]+"€",
                "Riunione tecnica":this.Info[0]["riunioneTecnica"]?"Si":"No",
                "Supervisore arbitrale":this.Info[0]["supervisoreArbitrale"],
                "Supervisore torneo":this.Info[0]["supervisoreTorneo"],
                "Direttore competizione":this.Info[0]["direttoreCompetizione"]
              }
              //scarico informazioni impianto
              this.TorneoAPIService.getImpiantoSocieta(parseInt(this.Info[0]["idSocieta"]),parseInt(this.Info[0]["idImpianto"]),this.cookieService.get("token")).subscribe(
                obj3=>{
                    this.Impianto=obj3 as Impianto;
                    //console.log(this.Impianto);
                    //riempio un array per stamapre dinamicamente poi html
                    this.InfoLocalita={
                      "Nome Impianto": this.Impianto[0]["nomeImpianto"],
                      "Città":this.Impianto[0]["città"],
                      "Indirizzo": this.Impianto[0]["indirizzo"],
                      "Email":this.Impianto[0]["email"],
                      "Sito": this.Impianto[0]["sito"],
                      "Telefono":this.Impianto[0]["tel"]
                    }
                  },
                error=>{
                  console.log("error", error);
              })
              
            },
          error=>{
            console.log("error", error);
        })

      },
      error=>{
        console.log("error", error);
    })
    //autorizzo Torneo
    this.TorneoAPIService.getSquadreTorneo(this.cookieService.get("token"),this.id).subscribe(
      obj=>{
        this.dataSource.data= obj as Squadra[];
      },
      error=>{
        console.log("error", error);
    })
  }

  public doFilter = (value: any) => {
    this.dataSource.filter = (<HTMLInputElement>value.target).value.trim().toLocaleLowerCase();
  }

  // Preserve original property order of Info Torneo
  originalOrder = (a: KeyValue<number,string>, b: KeyValue<number,string>): number => {
    return 0;
  }

  Back(){
    this.location.back();
  }
  Autorizza(){
      //autorizzo Torneo
      this.TorneoAPIService.AutorizzaTorneo(this.cookieService.get("token"),this.id,true).subscribe(
        obj=>{
          this.Router.navigate(['/OutputTornei/L1']);
        },
        error=>{
          console.log("error", error);
      })
  }

  CheckAutorizzazione(){
    //CHECK AUTORIZZAZIONE Torneo
    this.TorneoAPIService.CheckAutorizzazione(this.id).subscribe(
      obj=>{
        //true da autorizzare
        if(obj){
          //DA AUTORIZZARE
            this.btnautorizza=false; //SHOW BTN
            this.btniscrivi=true;
            this.btntabellone=true;
            this.assegnadelegato=true;
        }
        else {
          //GIA AUTORIZZATO
          if(this.cookieService.get("ruolo")=="Admin")this.assegnadelegato=false;
          //controllo chiusura iscrizioni Torneo
          this.TorneoAPIService.ControlloChiusuraIscrizioni(this.cookieService.get("token"),this.id).subscribe(
            obj=>{
              if(!obj){
                if(this.cookieService.get("ruolo")=="Atleta" || this.cookieService.get("ruolo")=="Delegato" || this.cookieService.get("ruolo")=="Admin")this.btniscrivi=false;
                this.btntabellone=true;
              }
              else {
                //controlli se torneo è iniziato o meno
                //true non vedi bottone
                //false vedi bottone
                this.TorneoAPIService.ControlloInizioTorneo(this.cookieService.get("token"),this.id).subscribe(
                  obj=>{
                    if(obj)this.btntabellone=true;
                    else {
                      //CONTROLLARE SE E' GIA STATO CREATO UN TABELLONE
                      //true presente
                      //false ancora da creare
                      this.TorneoAPIService.ControlloPresenzaTabellone(this.cookieService.get("token"),this.id).subscribe(
                        obj=>{
                          if(!obj)this.btntabellone=false;
                          else this.btntabellone=true;
                        },
                        error=>{
                          console.log("error", error);
                      })
                    }
                  },
                  error=>{
                    console.log("error", error);
                })

              }
            },
            error=>{
              console.log("error", error);
          })
        }
      },
      error=>{
        console.log("error", error);
    }) 
  }
  
  AssegnaDelegato(){
    this.Router.navigate(['/AssegnaDelegato/'+this.id]);
  }

  Iscrivi(){
    this.Router.navigate(['/IscriviSquadra/'+this.id]);
    
  }

  VisualizzaPartite(){
    this.Router.navigate(['/OutputPartite/'+this.id]);
  }

  CreaTabellone(){
    //CreaListaIngresso Torneo
    this.TorneoAPIService.CreaListaIngresso(this.cookieService.get("token"),this.id,this.cookieService.get("id")).subscribe(
      obj=>{
        if(this.Info[0]["numMaxTeamQualifiche"]>0){
          //CreaListaIngresso Torneo
          this.TorneoAPIService.CreaTorneoQualifiche(this.cookieService.get("token"),this.id,this.Info[0]["dataFine"].toString(),this.Info[0]["dataInizio"].toString()).subscribe(
            obj1=>{
              //OUTPUTTORNEIDELEGATO
              this.Router.navigate(['/OutputTornei/delegato']);
            },
            error=>{
              console.log("error", error);
          })
        }
        else{
          //crea pool Torneo
          this.TorneoAPIService.Creapool(this.cookieService.get("token"),this.id).subscribe(
            obj=>{
              this.Router.navigate(['/OutputTornei/delegato']);
            },
            error=>{
              console.log("error", error);
          })
        }
      },
      error=>{
        console.log("error", error);
    })
  }
}
