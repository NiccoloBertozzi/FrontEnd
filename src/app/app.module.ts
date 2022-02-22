import { NgModule } from '@angular/core';
import { BrowserModule } from '@angular/platform-browser';
import { CookieService } from 'ngx-cookie-service';
import { FormsModule,ReactiveFormsModule  } from '@angular/forms';
import { MatFormFieldModule } from '@angular/material/form-field';
import {HttpClientModule} from '@angular/common/http'
import { FontAwesomeModule } from '@fortawesome/angular-fontawesome';
import { BrowserAnimationsModule } from '@angular/platform-browser/animations';
import {MatPaginatorModule} from '@angular/material/paginator';
import {MatTableModule} from '@angular/material/table';
import { MatSortModule } from '@angular/material/sort';
import { MatInputModule } from '@angular/material/input';
import { MatSelectModule } from '@angular/material/select';
import {MatAutocompleteModule} from '@angular/material/autocomplete';

import { AppRoutingModule } from './app-routing.module';
import { AppComponent } from './app.component';
import { LoginComponent } from './components/login/login.component';
import { RegisterComponent } from './components/register/register.component';
import { OutputTorneiComponent } from './components/output-tornei/output-tornei.component';
import { InfoTorneoComponent } from './components/info-torneo/info-torneo.component';
import { CreaTorneoComponent } from './components/crea-torneo/crea-torneo.component';
import { IscriviSquadraComponent } from './components/iscrivi-squadra/iscrivi-squadra.component';
import { ClassificaComponent } from './components/classifica/classifica.component';
import { AnagraficaComponent } from './components/anagrafica/anagrafica.component';
import { OutputPartiteComponent } from './components/output-partite/output-partite.component';
import { OutputTorneiIscrittiComponent } from './components/output-tornei-iscritti/output-tornei-iscritti.component';
import { ModificaAnagraficaComponent } from './components/modifica-anagrafica/modifica-anagrafica.component';
import { AssegnaDelegatoComponent } from './components/assegna-delegato/assegna-delegato.component';
import { InfoPartitaComponent } from './components/info-partita/info-partita.component';
import { GestisciPartitaComponent } from './components/gestisci-partita/gestisci-partita.component';
import { MatDialog, MatDialogModule } from '@angular/material/dialog';
import { NewPasswordComponent } from './components/new-password/new-password.component';
import { NgxMatSelectSearchModule } from 'ngx-mat-select-search';
import { AddImpiantiComponent } from './components/add-impianti/add-impianti.component';

@NgModule({
  declarations: [
    AppComponent,
    LoginComponent,
    RegisterComponent,
    OutputTorneiComponent,
    InfoTorneoComponent,
    CreaTorneoComponent,
    IscriviSquadraComponent,
    ClassificaComponent,
    AnagraficaComponent,
    OutputPartiteComponent,
    OutputTorneiIscrittiComponent,
    ModificaAnagraficaComponent,
    AssegnaDelegatoComponent,
    InfoPartitaComponent,
    GestisciPartitaComponent,
    NewPasswordComponent,
    AddImpiantiComponent,

  ],
  imports: [
    BrowserModule,
    AppRoutingModule,
    FormsModule,
    ReactiveFormsModule,
    MatFormFieldModule,
    HttpClientModule,
    FontAwesomeModule,
    BrowserAnimationsModule,
    MatPaginatorModule,
    MatTableModule,
    MatSortModule,
    MatInputModule,
    MatSelectModule,
    MatDialogModule,
    MatAutocompleteModule,
    NgxMatSelectSearchModule
    ],
  providers: [CookieService],
  bootstrap: [AppComponent]
})
export class AppModule { }
