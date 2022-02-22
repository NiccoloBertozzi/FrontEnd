import { Component, ElementRef, Inject, OnInit, ViewChild } from '@angular/core';
import { FormBuilder, Validators, FormGroup, FormControl } from '@angular/forms';
import { ActivatedRoute, Router } from '@angular/router';
import { CookieService } from 'ngx-cookie-service';
import { Allenatore } from 'src/app/models/allenatore.model';
import { Atleta } from 'src/app/models/atleta.model';
import { NavbarService } from 'src/app/services/navbar.service';
import {UserService} from '../../services/user.service';
import {TorneoAPIService} from '../../services/torneo-api.service';
import {MatDialog, MatDialogRef, MAT_DIALOG_DATA} from '@angular/material/dialog';
import { Observable} from 'rxjs';
import {map, startWith} from 'rxjs/operators';

export interface DialogData {
  error: string;
}
@Component({
  selector: 'app-iscrivi-squadra',
  templateUrl: './iscrivi-squadra.component.html',
  styleUrls: ['./iscrivi-squadra.component.scss']
})
export class IscriviSquadraComponent implements OnInit {

  formrcrea:FormGroup;
  Atleti !:Atleta[];
  _Atleti_ !:Atleta[];
  Allenatori !:Allenatore[];
  _Allenatori_ !:Allenatore[];
  myControl = new FormControl();
  filteredOptions!: Observable<Atleta[]>;
  myControl2 = new FormControl();
  filteredOptions2!: Observable<Atleta[]>;
  myControlRes = new FormControl();
  filteredOptionsRes!: Observable<Allenatore[]>;
  nomesquadra:string="";
  idTorneo:any;
  errore!: string;
  idatleta1!:number;
  idatleta2!:number;
  idallenatore!:number;
  constructor(private navbarService: NavbarService,public dialog: MatDialog,private formBuilder: FormBuilder,private router:Router,private activatedRoute:ActivatedRoute,private TorneoAPIService:TorneoAPIService,private UserService:UserService,private cookieService: CookieService) { 
    this.formrcrea = this.formBuilder.group({
      atleta1: ['', Validators.required],
      atleta2: ['', Validators.required],
      allenatore: [''],
      wildcard:['false',Validators.required]
    });
    this.idTorneo=this.activatedRoute.snapshot.paramMap.get('id')?.toString();
  }

  ngOnInit(): void {
    this.loadUser();
  }
  loadUser(){
//scarico tutti gli atleti
this.UserService.GetAtleti(this.cookieService.get('token')).subscribe(
  obj=>{
    this.Atleti=obj as Atleta[];
    this.searchComuni();
  },
  error=>{
    console.log("error", error);
})
//scarico tutti gli allenatori
this.UserService.GetAllenatori(this.cookieService.get('token')).subscribe(
  obj=>{
    this.Allenatori=obj as Allenatore[];
    this.searchComuni();
  },
  error=>{
    console.log("error", error);
})
  }
  searchComuni(){
    this.filteredOptions = this.myControl.valueChanges.pipe(
      startWith(''),
      map(value => (typeof value === 'string' ? value : value.cognome)),
      map(cognome => (cognome ? this._filter(cognome) : this.Atleti.slice())),
    );
    this.filteredOptions2 = this.myControl2.valueChanges.pipe(
      startWith(''),
      map(value => (typeof value === 'string' ? value : value.cognome)),
      map(cognome => (cognome ? this._filter(cognome) : this.Atleti.slice())),
    );
    this.filteredOptionsRes = this.myControlRes.valueChanges.pipe(
      startWith(''),
      map(value => (typeof value === 'string' ? value : value.citta)),
      map(citta => (citta ? this._filterAllentaore(citta) : this.Allenatori.slice())),
    );
  }
  private _filter(citta: string): Atleta[] {
    const filterValue = citta.toLowerCase();
    return this.Atleti.filter(option => option.cognome.toLowerCase().includes(filterValue));
  }
  private _filterAllentaore(citta: string): Allenatore[] {
    const filterValue = citta.toLowerCase();
    return this.Allenatori.filter(option => option.cognome.toLowerCase().includes(filterValue));
  }
  setuser1(id:number){
    this.idatleta1=id;
  }
  setuser2(id:number){
    this.idatleta2=id;
  }
  setallenatore(id:number){
    this.idallenatore=id;
  }
  onChange(){
    this.nomesquadra="";
    let user1 = this.myControl.value!=undefined ?this.myControl.value.split(" "): "";
    let user2 = this.myControl2.value!=undefined ?this.myControl2.value.split(" "): "";
    //scrivo tutti i cognomi
    for(let i=2;i<user1.length;i++) this.nomesquadra+=user1[i]+" ";
    //nomeat1-cognomeat2 nomeat2
    this.nomesquadra+=user1[1].charAt(0)+". - ";
    for(let i=2;i<user2.length;i++) this.nomesquadra+=user2[i]+" ";
    this.nomesquadra+=user2[1].charAt(0)+".";
  }

  @ViewChild('multiUserSearch1') multiUserSearchInput1!:ElementRef;
  @ViewChild('multiUserSearch2') multiUserSearchInput2!:ElementRef;
  @ViewChild('multiUserSearchAllenatore') multiUserSearchInputAllenatore!:ElementRef;

  Iscrivi(){
    let body;
    if(this.myControl.value!=undefined && this.myControl2.value!=undefined){

    body="{ \r\n"+
      "\"atleta1\":\""+this.idatleta1 +"\" , \r\n"+
      "\"atleta2\": \""+this.idatleta2+"\", \r\n"+
      "\"accettato\": true , \r\n"+
      "\"nomeTeam\": \""+this.nomesquadra +"\", \r\n"+
      "\"iscritto\": { \r\n"+
        "\"idTorneo\": \""+this.idTorneo +"\", \r\n";
      if(this.myControlRes.value!=undefined)"\"idAllenatore\": "+this.idallenatore+", \r\n";
       body+="\"wildCard\": "+this.formrcrea.controls["wildcard"].value+
      "\r\n} \r\n"+
    "}";
    //scarico tutti gli allenatori
    this.TorneoAPIService.IscriviSquadra(this.cookieService.get('token'),body).subscribe(
      obj=>{
        this.router.navigate(['/InfoTorneo/'+this.idTorneo]);
      },
      error=>{
        this.errore=error.error.message;
        console.log("error", error);
        this.openDialog();
      })
    }
  }
  
 openDialog(): void {
  const dialogRef = this.dialog.open(DialogOverviewExampleDialog, {
    panelClass: 'custom-dialog-container',
    data: {error: this.errore},
  });
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