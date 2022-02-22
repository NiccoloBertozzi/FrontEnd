import { Component, OnInit,Inject } from '@angular/core';
import { ActivatedRoute, Router } from '@angular/router';

import { NavbarService } from '../../services/navbar.service';
import { SocietaApiService } from '../../services/societa-api.service';
import {RegisterService} from '../../services/register.service';

import { CookieService } from 'ngx-cookie-service';
import { FormBuilder, Validators, FormGroup, FormControl } from '@angular/forms';
import { Comuni } from 'src/app/models/comuni.model';
import { Observable } from 'rxjs';
import { map, startWith } from 'rxjs/operators';
import { Info } from 'src/app/models/info.model';
import {MatDialog, MatDialogRef, MAT_DIALOG_DATA} from '@angular/material/dialog';

export interface DialogData {
  error: string;
}
@Component({
  selector: 'app-add-impianti',
  templateUrl: './add-impianti.component.html',
  styleUrls: ['./add-impianti.component.scss']
})

export class AddImpiantiComponent implements OnInit {
  
  formrcrea: FormGroup;
  cityes!: Comuni[];
  myControl = new FormControl();
  filteredOptions!: Observable<Comuni[]>;
  Info!:Info;
  errore!: string;

  constructor(private RegisterService: RegisterService,public dialog: MatDialog, private SocietaApiService: SocietaApiService, private router: Router, private activatedRoute: ActivatedRoute, private cookieService: CookieService, private navbarService: NavbarService, private formBuilder: FormBuilder) {
   
    this.formrcrea = this.formBuilder.group({
      nomeImpianto: ['', Validators.required],
      numeroCampi: ['', Validators.required],
      indirizzo: ['', Validators.required],
      cap: ['', Validators.required],
      email: ['', Validators.required],
      sito: ['', Validators.required],
      tel: ['', Validators.required],
    });
  }

  openDialog(): void {
    const dialogRef = this.dialog.open(DialogOverviewExampleDialog, {
      panelClass: 'custom-dialog-container',
      data: {error: this.errore},
    });
  }
  ngOnInit(): void {
  }
  ngAfterViewInit(){
    this.loadComuni();
  }
  loadComuni(){
    //comuni
    this.RegisterService.getComuni().subscribe(
      obj=>{
        this.cityes=obj;
        this.searchComuni();      
      },
      error=>{
        console.log("error", error);
    });
  }
  searchComuni(){
    this.filteredOptions = this.myControl.valueChanges.pipe(
      startWith(''),
      map(value => (typeof value === 'string' ? value : value.citta)),
      map(citta => (citta ? this._filter(citta) : this.cityes.slice())),
    ); 
  }
  private _filter(citta: string): Comuni[] {
    const filterValue = citta.toLowerCase();
    return this.cityes.filter(option => option.citta.toLowerCase().includes(filterValue));
  }

  Crea_Click() {
    let body = "{\r\n";
    body += " \"nomeComune\": \"" + this.myControl.value + "\",\r\n";
    Object.keys(this.formrcrea.controls).forEach(key => {
      //scorro tutti gli input e creo il body della chiamata
      if (this.formrcrea.controls[key].status == "VALID")
          body += " \"" + key + "\": \"" + this.formrcrea.controls[key].value + "\",\r\n";
    });
    body += " \"idSocieta\": \"" + this.cookieService.get("id") + "\"\r\n}";
    console.log("IMPIANTO",body);
    //Register
    this.SocietaApiService.AddImpianti(this.cookieService.get("token"),body).subscribe(
      obj=>{
        this.Info=obj;
      },
      error=>{
        this.errore=error.error.message;
        console.log("error", error);
        this.openDialog();
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
