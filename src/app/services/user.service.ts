import { Injectable } from '@angular/core';
import { HttpClient, HttpHeaders} from '@angular/common/http';
import { Observable } from 'rxjs';
import { Torneo } from '../models/torneo.model';
import { Atleta } from '../models/atleta.model';
import { Allenatore } from '../models/allenatore.model';
import { Delegato } from '../models/delegato.model';
import { DelegatiTorneo } from '../models/delegatiTorneo.model';
import { Info } from '../models/info.model';
import { environment } from '../../environments/environment';

@Injectable({
  providedIn: 'root'
})
export class UserService {

  constructor(private HttpClient:HttpClient) { }

  //GET Tornei Iscritti
  public GetTorneiIscritti(token:string,idutente:string):Observable<Torneo[]>{
    const httpOptions = {
      headers: new HttpHeaders({
        "Content-Type": "application/json; charset=UTF-8",
        'Accept':  'application/json',
        'Authorization':'Bearer '+token
      })
    }; 
    return this.HttpClient.get<Torneo[]>(environment.apiURL+"api/v1/atleti/Iscrizioni/"+idutente,httpOptions)
  }
   //GET Tornei In corso
   public GetTorneiInCorso(token:string,idutente:string):Observable<Torneo[]>{
    const httpOptions = {
      headers: new HttpHeaders({
        "Content-Type": "application/json; charset=UTF-8",
        'Accept':  'application/json',
        'Authorization':'Bearer '+token
      })
    }; 
    return this.HttpClient.get<Torneo[]>(environment.apiURL+"api/v1/tornei/TorneInCorso/"+idutente,httpOptions)
  }
  //GET Tornei finiti
  public GetTorneiFiniti(token:string,idutente:string):Observable<Torneo[]>{
    const httpOptions = {
      headers: new HttpHeaders({
        "Content-Type": "application/json; charset=UTF-8",
        'Accept':  'application/json',
        'Authorization':'Bearer '+token
      })
    }; 
    return this.HttpClient.get<Torneo[]>(environment.apiURL+"api/v1/tornei/ToreniFiniti/"+idutente,httpOptions)
  } 
    //GET Tornei Iscritti Allenatore
    public GetTorneiIscrittiAllenatore(token:string,idutente:string):Observable<Torneo[]>{
      const httpOptions = {
        headers: new HttpHeaders({
          "Content-Type": "application/json; charset=UTF-8",
          'Accept':  'application/json',
          'Authorization':'Bearer '+token
        })
      }; 
      return this.HttpClient.get<Torneo[]>(environment.apiURL+"api/v1/allenatori/TorneiIscritti/"+idutente,httpOptions)
    }
     //GET Tornei In corso Allenatore
     public GetTorneiInCorsoAllenatore(token:string,idutente:string):Observable<Torneo[]>{
      const httpOptions = {
        headers: new HttpHeaders({
          "Content-Type": "application/json; charset=UTF-8",
          'Accept':  'application/json',
          'Authorization':'Bearer '+token
        })
      }; 
      return this.HttpClient.get<Torneo[]>(environment.apiURL+"api/v1/allenatori/TorneiInCorso/"+idutente,httpOptions)
    }
    //GET Tornei finiti Allenatore
    public GetTorneiFinitiAllenatore(token:string,idutente:string):Observable<Torneo[]>{
      const httpOptions = {
        headers: new HttpHeaders({
          "Content-Type": "application/json; charset=UTF-8",
          'Accept':  'application/json',
          'Authorization':'Bearer '+token
        })
      }; 
      return this.HttpClient.get<Torneo[]>(environment.apiURL+"api/v1/allenatori/TorneiFiniti/"+idutente,httpOptions)
    }
  //GET Tornei Iscritti Delegato
  public GetTorneiIscrittDelegato(token:string,idutente:string):Observable<Torneo[]>{
    const httpOptions = {
      headers: new HttpHeaders({
        "Content-Type": "application/json; charset=UTF-8",
        'Accept':  'application/json',
        'Authorization':'Bearer '+token
      })
    }; 
    return this.HttpClient.get<Torneo[]>(environment.apiURL+"api/v1/supervisore/TorneiIscritti/"+idutente,httpOptions)
  }
   //GET Tornei In corso Delegato
   public GetTorneiInCorsoDelegato(token:string,idutente:string):Observable<Torneo[]>{
    const httpOptions = {
      headers: new HttpHeaders({
        "Content-Type": "application/json; charset=UTF-8",
        'Accept':  'application/json',
        'Authorization':'Bearer '+token
      })
    }; 
    return this.HttpClient.get<Torneo[]>(environment.apiURL+"api/v1/supervisore/TorneiInCorso/"+idutente,httpOptions)
  }
  //GET Tornei finiti Delegato
  public GetTorneiFinitiDelegato(token:string,idutente:string):Observable<Torneo[]>{
    const httpOptions = {
      headers: new HttpHeaders({
        "Content-Type": "application/json; charset=UTF-8",
        'Accept':  'application/json',
        'Authorization':'Bearer '+token
      })
    }; 
    return this.HttpClient.get<Torneo[]>(environment.apiURL+"api/v1/supervisore/TorneiFiniti/"+idutente,httpOptions)
  }
    //GET Anaagrafica Atleta
    public GetAnagraficaAtleta(token:string,idutente:string):Observable<Atleta>{
      const httpOptions = {
        headers: new HttpHeaders({
          "Content-Type": "application/json; charset=UTF-8",
          'Accept':  'application/json',
          'Authorization':'Bearer '+token
        })
      }; 
      return this.HttpClient.get<Atleta>(environment.apiURL+"api/v1/atleti/GetAnagraficaAtleta/"+idutente,httpOptions)
    }
    //GET Anaagrafica Allentaore
    public GetAnagraficaAllenatore(token:string,idutente:string):Observable<Allenatore>{
      const httpOptions = {
        headers: new HttpHeaders({
          "Content-Type": "application/json; charset=UTF-8",
          'Accept':  'application/json',
          'Authorization':'Bearer '+token
        })
      }; 
      return this.HttpClient.get<Allenatore>(environment.apiURL+"api/v1/allenatori/GetAnagraficaAllenatore/"+idutente,httpOptions)
    }
    //GET Anaagrafica Delegato
    public GetAnagraficaDelegato(token:string,idutente:string):Observable<Delegato>{
      const httpOptions = {
        headers: new HttpHeaders({
          "Content-Type": "application/json; charset=UTF-8",
          'Accept':  'application/json',
          'Authorization':'Bearer '+token
        })
      }; 
      return this.HttpClient.get<Delegato>(environment.apiURL+"api/v1/supervisore/GetAnagraficaDelegato/"+idutente,httpOptions)
    }
    //GET Supervisori
    public GetSupervisori(token:string):Observable<DelegatiTorneo[]>{
      const httpOptions = {
        headers: new HttpHeaders({
          "Content-Type": "application/json; charset=UTF-8",
          'Accept':  'application/json',
          'Authorization':'Bearer '+token
        })
      }; 
      return this.HttpClient.get<DelegatiTorneo[]>(environment.apiURL+"api/v1/supervisore/GetSupervisori/",httpOptions)
    }
    //GET Aribtri
    public GetArbitri(token:string):Observable<DelegatiTorneo[]>{
      const httpOptions = {
        headers: new HttpHeaders({
          "Content-Type": "application/json; charset=UTF-8",
          'Accept':  'application/json',
          'Authorization':'Bearer '+token
        })
      }; 
      return this.HttpClient.get<DelegatiTorneo[]>(environment.apiURL+"api/v1/supervisore/GetArbitri/",httpOptions)
    }
    //GET Direttori
    public GetDirettori(token:string):Observable<DelegatiTorneo[]>{
      const httpOptions = {
        headers: new HttpHeaders({
          "Content-Type": "application/json; charset=UTF-8",
          'Accept':  'application/json',
          'Authorization':'Bearer '+token
        })
      }; 
      return this.HttpClient.get<DelegatiTorneo[]>(environment.apiURL+"api/v1/supervisore/GetDirettori/",httpOptions)
    }
    //GET Atleti
    public GetAtleti(token:string):Observable<Atleta[]>{
      const httpOptions = {
        headers: new HttpHeaders({
          "Content-Type": "application/json; charset=UTF-8",
          'Accept':  'application/json',
          'Authorization':'Bearer '+token
        })
      }; 
      return this.HttpClient.get<Atleta[]>(environment.apiURL+"api/v1/atleti/GetAtleti",httpOptions)
    }
    //GET Allenatori
    public GetAllenatori(token:string):Observable<Allenatore[]>{
      const httpOptions = {
        headers: new HttpHeaders({
          "Content-Type": "application/json; charset=UTF-8",
          'Accept':  'application/json',
          'Authorization':'Bearer '+token
        })
      }; 
      return this.HttpClient.get<Allenatore[]>(environment.apiURL+"api/v1/allenatori/GetAllenatori",httpOptions)
    }
    //Assegna Delegati
    public AssegnaDelegati(token:string,body:string):Observable<Info>{
      const httpOptions = {
        headers: new HttpHeaders({
          "Content-Type": "application/json; charset=UTF-8",
          'Accept':  'application/json',
          'Authorization':'Bearer '+token
        })
      }; 
      return this.HttpClient.put<Info>(environment.apiURL+"api/v1/tornei/AssegnaDelegati",body,httpOptions)
    }
}
