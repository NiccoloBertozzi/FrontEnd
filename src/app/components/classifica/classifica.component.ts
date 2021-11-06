import { Component, OnInit, ViewChild } from '@angular/core';
import { FormBuilder, FormGroup, Validators } from '@angular/forms';
import { MatPaginator } from '@angular/material/paginator';
import { MatSort } from '@angular/material/sort';
import { MatTableDataSource } from '@angular/material/table';
import { ActivatedRoute,Router} from '@angular/router';
import { Classifica } from 'src/app/models/classifica.model';
import { PuntiTappaAtleta } from 'src/app/models/PuntiTappaAtleta.model';
import { TorneoAPIService } from 'src/app/services/torneo-api.service';

import { GestionaleService } from '../../services/gestionale.service';

@Component({
  selector: 'app-classifica',
  templateUrl: './classifica.component.html',
  styleUrls: ['./classifica.component.scss']
})
export class ClassificaComponent implements OnInit {

  ELEMENT_DATA !: Classifica[];
  displayedColumns!: string[];
  dataSource:any;
  genere:any;
  tappe:string[]=[];
  formtour:FormGroup;
  Tour!:string[];
  @ViewChild(MatPaginator) paginator!: MatPaginator;
  @ViewChild(MatSort) sort!: MatSort;
  constructor(private GestionaleService:GestionaleService,private activatedRoute:ActivatedRoute,private Router:Router,private formBuilder:FormBuilder,private TorneoAPIService:TorneoAPIService ) {
    this.formtour = this.formBuilder.group({
      tour: ['', Validators.required],
    });
    //scarico tour
    this.TorneoAPIService.getTourTorneo().subscribe(
      obj=>{
        this.Tour=obj  as string[]
      },
      error=>{
        console.log("error", error);
    })
   }

  ngOnInit(): void {
    this.displayedColumns= ['nome','punteggi'];
    this.dataSource = new MatTableDataSource<Classifica>(this.ELEMENT_DATA);
    this.dataSource.paginator = this.paginator;
    this.dataSource.sort=this.sort;
    this.genere=this.activatedRoute.snapshot.paramMap.get('genere');
     //scarico classifica
     this.GestionaleService.getClassifica(this.genere).subscribe(
      obj=>{
        this.dataSource.data=obj  as Classifica[]
      },
      error=>{
        console.log("error", error);
    })
  }
  
  public doFilter = (value: any) => {
    this.dataSource.filter = (<HTMLInputElement>value.target).value.trim().toLocaleLowerCase();
  }

  onSelectChange(e) {
    let tour=this.formtour.get("tour")?.value;
    
    if(tour=="AIBVC TOUR"){
      this.tappe=[];
      this.ngOnInit();
    }
    else{
      //prendo numero tappe e creo tabella
      //scarico classifica
     this.GestionaleService.getTappe(tour).subscribe(
      obj=>{
        obj  as string[]
        for(let i=0;i<obj.length;i++){
          this.tappe.push(obj[i]);
          this.displayedColumns.push(obj[i]);
        }
      },
      error=>{
        console.log("error", error);
    })
      //scarico classifica
      this.GestionaleService.getClassificaTour(this.genere,tour).subscribe(
        obj=>{
          this.dataSource.data=obj  as Classifica[]
          //prendo tutte le tappe di ogni atleta
          for(let i=0;i<this.dataSource.data.length;i++){
            //scarico classifica
            this.GestionaleService.getPuntiAltetaTappa(tour,this.dataSource.data[i]["idatleta"]).subscribe(
              obj=>{
                this.dataSource.data[i]["Tappe"]=obj  as PuntiTappaAtleta[];
                //console.log(this.dataSource.data);
              },
              error=>{
                console.log("error", error);
            })
          }
          this.genere="M \n"+tour;
        },
        error=>{
          console.log("error", error);
      })
    }
  }
}
