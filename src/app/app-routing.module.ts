import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';
import {LoginComponent} from './components/login/login.component';
import {RegisterComponent} from './components/register/register.component';
import { AppComponent } from './app.component';
import { OutputTorneiComponent } from './components/output-tornei/output-tornei.component';
import { InfoTorneoComponent } from './components/info-torneo/info-torneo.component';
import { CreaTorneoComponent } from './components/crea-torneo/crea-torneo.component';
import { IscriviSquadraComponent } from './components/iscrivi-squadra/iscrivi-squadra.component';
import { ClassificaComponent } from './components/classifica/classifica.component';
import { OutputPartiteComponent } from './components/output-partite/output-partite.component';
import { OutputTorneiIscrittiComponent } from './components/output-tornei-iscritti/output-tornei-iscritti.component';
import { AnagraficaComponent } from './components/anagrafica/anagrafica.component';
import { ModificaAnagraficaComponent } from './components/modifica-anagrafica/modifica-anagrafica.component';
import { AssegnaDelegatoComponent } from './components/assegna-delegato/assegna-delegato.component';
import { InfoPartitaComponent } from './components/info-partita/info-partita.component';
import { GestisciPartitaComponent } from './components/gestisci-partita/gestisci-partita.component';
import { NewPasswordComponent } from './components/new-password/new-password.component';
import { AddImpiantiComponent } from './components/add-impianti/add-impianti.component';

const routes: Routes = [
  { path: 'login', component: LoginComponent },
  { path: 'register', component: RegisterComponent },
  { path: 'OutputTornei/:tipologia/:storico', component: OutputTorneiComponent },
  { path: 'OutputTorneiIscritti', component: OutputTorneiIscrittiComponent },
  { path: 'OutputPartite/:id', component: OutputPartiteComponent },
  { path: 'CreaTorneo', component: CreaTorneoComponent },
  { path: 'AutorizzaTorneo', component: CreaTorneoComponent },
  { path: 'InfoTorneo/:id', component: InfoTorneoComponent },
  { path: 'IscriviSquadra/:id', component: IscriviSquadraComponent },
  { path: 'Classifica/:genere', component: ClassificaComponent },
  { path: 'Anagrafica', component: AnagraficaComponent },
  { path: 'AnagraficaEdit', component: ModificaAnagraficaComponent },
  { path: 'AssegnaDelegato/:id', component: AssegnaDelegatoComponent },
  { path: 'InfoPartita/:id/Partita/:partita', component: InfoPartitaComponent },
  { path: 'GestisciPartita/:id/Partita/:partita', component: GestisciPartitaComponent },
  { path: 'newpassword', component: NewPasswordComponent },
  { path: 'AddImpianto', component: AddImpiantiComponent },
  
  { path: '', component: AppComponent }
];

@NgModule({
  imports: [RouterModule.forRoot(routes)],
  exports: [RouterModule]
})
export class AppRoutingModule { }
