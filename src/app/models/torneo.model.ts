export class Torneo{
    idTorneo!: number;
    titolo!: string;
    nomeSocieta!: string;
    tipoTorneo!: string;
    supervisoreTorneo!: string;
    supervisoreArbitrale!: string;
    direttoreCompetizione!: string;
    formula!: string;
    nomeImpianto!: string;
    citta!: string;
    quotaIscrizione!: number;
    puntiVittoria!: number;
    montepremi!: number;
    dataInizio!: number;
    dataFine!: number;
    dataChiusuraIscrizioni!: Date;
    gender!: string;
    numMaxTeamMainDraw!: number;
    numMaxTeamQualifiche!: number;
    numTeamQualificati!: number;
    numWildCard!: number;
    outdoor!: boolean;
    riunioneTecnica!: boolean;
    oraInizio!: string;
    tour!: string
}