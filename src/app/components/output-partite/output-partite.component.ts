import { Component, OnInit, ViewChild } from '@angular/core';
import { faFileExcel } from '@fortawesome/free-solid-svg-icons';

import { CookieService } from 'ngx-cookie-service';
import { NavbarService } from '../../services/navbar.service';
import { TorneoAPIService } from '../../services/torneo-api.service';

import { ActivatedRoute, Router } from '@angular/router';

import { MatPaginator, PageEvent } from '@angular/material/paginator';
import { MatSort } from '@angular/material/sort';
import { MatTableDataSource } from '@angular/material/table';
import { Partita } from 'src/app/models/partita.model';
import { ClassificaTorneo } from 'src/app/models/classificaTorneo.model';

import { Workbook } from 'exceljs';

import {saveAs} from 'file-saver';
import { TestaDiSerie } from 'src/app/models/testadiserie.model';

@Component({
  selector: 'app-output-partite',
  templateUrl: './output-partite.component.html',
  styleUrls: ['./output-partite.component.scss']
})
export class OutputPartiteComponent implements OnInit {

  faFileExcel=faFileExcel;
  id:any;

  ELEMENT_DATA !: Partita[];
  dataSource= new MatTableDataSource<Partita>(this.ELEMENT_DATA);
  displayedColumns: string[] = ['datapartita','fase','team','set'];
  @ViewChild('PartitaPaginator', {static: true}) PartitaPaginator!: MatPaginator;
  @ViewChild('PartitaSort', {static: true}) PartitaSort!: MatSort;

  ELEMENT_DATA_CLASSIFICA !: ClassificaTorneo[];
  dataSourceClassifica= new MatTableDataSource<ClassificaTorneo>(this.ELEMENT_DATA_CLASSIFICA);
  displayedColumnsClassifica: string[] = ['cA1','cA2','rank','team','punti'];
  @ViewChild('ClassificaPaginator', {static: true}) ClassificaPaginator!: MatPaginator;
  @ViewChild('ClassificaSort', {static: true}) ClassificaSort!: MatSort;



  @ViewChild(MatPaginator) paginator!: MatPaginator;
  @ViewChild('PartitaSort') sort1!: MatSort;
  @ViewChild('ClassificaSort') sort2!: MatSort;
  constructor(private router: Router,private activatedRoute:ActivatedRoute, private navbarService: NavbarService, private TorneoAPIService: TorneoAPIService,private cookieService: CookieService) {}

  ngOnInit(): void {
    
    this.dataSource.paginator = this.PartitaPaginator;
    this.dataSource.sort = this.PartitaSort;

    this.dataSourceClassifica.paginator = this.ClassificaPaginator;
    this.dataSourceClassifica.sort = this.ClassificaSort;

   
    this.id=this.activatedRoute.snapshot.paramMap.get('id');
    //get partite
    this.TorneoAPIService.GetPartiteTorneo(this.cookieService.get("token"),this.id).subscribe(
      obj=>{
        this.dataSource.data= obj as Partita[];       
      },
      error=>{
        console.log("error", error);
    })
    //get partite
    this.TorneoAPIService.getClassificaTorneo(this.cookieService.get("token"),this.id).subscribe(
      obj=>{
        this.dataSourceClassifica.data= obj as ClassificaTorneo[];       
      },
      error=>{
        console.log("error", error);
    })

  }

  applyFilterOne(filterValue: any) {
    this.dataSource.filter = (<HTMLInputElement>filterValue.target).value.trim().toLowerCase();
  }
  getRecord(row){
    //console.log(row);
    this.router.navigate(['/InfoPartita/'+this.id+'/Partita/'+row.numPartita]);
  }
  applyFilterTwo(filterValue: any) {
    this.dataSourceClassifica.filter = (<HTMLInputElement>filterValue.target).value.trim().toLowerCase();
  }

  downloadExcel(){
    let testadiserie!: TestaDiSerie[];
    //create new excel work book
    let workbook = new Workbook();
    //add name to sheet
    let worksheet = workbook.addWorksheet("Teste di serie");
    //add column name
    worksheet.columns = [
      { header: "Num", key: "num", width: 3 },
      { header: "TitoloTorneo", key: "tt", width: 50 },
      { header: "NomeTeam", key: "nt", width: 50 },
      { header: "Pool", key: "idpool", width: 20 },
      { header: "PF", key: "pf", width: 20 },
      { header: "PS", key: "ps", width: 20 },
      { header: "QP", key: "qp", width: 20 }
    ];
    //get partite
    this.TorneoAPIService.GetTestadiSerie(this.cookieService.get("token"),this.id).subscribe(
      obj=>{
        testadiserie= obj as TestaDiSerie[];  
        console.log(testadiserie);
        for (let i=0;i<testadiserie.length;i++)
        {
          worksheet.addRow({num:i+1, tt: testadiserie[i]["TitoloTorneo"], nt: testadiserie[i]["nomeTeam"], idpool: testadiserie[i]["idPool"], pf:testadiserie[i]["pf"], ps:testadiserie[i]["ps"], qp:testadiserie[i]["qp"] });
        }
        //set downloadable file name
        let fname="Testa di Serie"

        //add data and file name and download
        workbook.xlsx.writeBuffer().then((data) => {
          let blob = new Blob([data], { type: 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet' });
          saveAs(blob, fname+'-'+testadiserie[0]["titolo"]+'.xlsx');
        }); 
      },
      error=>{
        console.log("error", error);
    });
    
  }
}
