<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="test.RegisterAtleta" %>

<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
    <title>Register</title>
    <link rel="stylesheet" href="Content/bootstrap.min.css">
    <link rel="stylesheet" href="Content/styles.css">
    <link rel="stylesheet" href="Scripts/main.js">
   
</head>

<body class="register">
    <form id="formregister" runat="server">
        <div class="row container-fluid">
            <div class="col-3 my-auto ml-4">
                <asp:DropDownList ID="ruolo" runat="server">
                    <asp:ListItem Selected="True" ID="btnAtleta" Value="Atleta"> Atleta </asp:ListItem>
                    <asp:ListItem Value="Allenatore" ID="btnAllenatore"> Allenatore </asp:ListItem>
                    <asp:ListItem Value="Delegato" ID="Delegato"> Delegato </asp:ListItem>
                </asp:DropDownList><br />
            </div>
            <div class="col-5 offset-2 my-auto">

                <div class="form-group row">
                    <label for="Tessera"class="col-sm-5 col-form-label register">Codice Tessera</label>
                    <div class="col-sm-7">
                        <input type="text" class="form-control" id="codiceTessera" placeholder="Codice Tessera">
                    </div>
                </div>
                <div class="form-group row">
                    <label for="lblCf" class="col-sm-5 col-form-label register">Codice Fiscale</label>
                    <div class="col-sm-7">
                        <asp:TextBox ID="cf" class="form-control" AccessKey="1" runat="server" required="true"></asp:TextBox>
                    </div>
                </div>
                <div class="form-group row">
                    <label for="lblEmail" class="col-sm-5 col-form-label register">Email</label>
                    <div class="col-sm-7">
                        <asp:TextBox ID="email" class="form-control" AccessKey="1" runat="server" required="true"></asp:TextBox>
                    </div>
                </div>
                <div class="form-group row">
                    <label for="lblPassword" class="col-sm-5 col-form-label register">Password</label>
                    <div class="col-sm-7">
                        <asp:TextBox ID="password" class="form-control" AccessKey="1" runat="server" required="true"></asp:TextBox>
                    </div>
                </div>
                <div class="form-group row">
                    <label for="lblNome" class="col-sm-5 col-form-label register">Nome</label>
                    <div class="col-sm-7">
                        <asp:TextBox ID="nome" class="form-control" AccessKey="1" runat="server" required="true"></asp:TextBox>
                    </div>
                </div>
                <div class="form-group row">
                    <label for="lblCognome" class="col-sm-5 col-form-label register">Cognome</label>
                    <div class="col-sm-7">
                        <asp:TextBox ID="cognome" class="form-control" AccessKey="1" runat="server" required="true"></asp:TextBox>
                    </div>
                </div>
                <div class="form-group row ">
                    <label for="lbldataNascita" class="col-sm-5 col-form-label register">Data di nascita</label>
                    <div class="col-sm-7 ">
                        <asp:TextBox ID="dataNascita" class="form-control" AccessKey="1" runat="server" required="true" TextMode="Date"></asp:TextBox>
                    </div>
                </div>
                <div class="form-group row ">
                    <label for="lblIndirizzo" class="col-sm-5 col-form-label register">Sesso</label>

                    <div class="col-sm-7">
                        <div class="form-check form-check-inline">
                            <asp:RadioButton ID="sesso1" runat="server" Text="Maschio" GroupName="sesso" Checked="true"></asp:RadioButton>
                            <asp:RadioButton ID="sesso2" runat="server" Text="Femmina" GroupName="sesso"></asp:RadioButton>
                        </div>
                    </div>
                </div>
                <div class="form-group row ">
                    <label for="lblTel " class="col-sm-5 col-form-label register">Numero di cellulare</label>
                    <div class="col-sm-7 ">
                        <asp:TextBox ID="tel" class="form-control" runat="server"></asp:TextBox>
                    </div>
                </div>
                <div class="form-group row ">
                    <label for="lblIndirizzo" class="col-sm-3 col-form-label register">Indirizzo di residenza</label>
                    <div class="col-sm-4 ">
                        <asp:TextBox ID="indirizzo" class="form-control" runat="server"></asp:TextBox>
                    </div>
                    <label for="lblCAP" class="col-sm-2 col-form-label register">CAP</label>
                    <div class="col-sm-3 ">
                        <asp:TextBox ID="cap" class="form-control" runat="server"></asp:TextBox>
                    </div>
                </div>
                <div class="form-group row ">
                    <label for="lblcomuneNascita" class="col-sm-5 col-form-label register">Comune di nascita</label>
                    <div class="col-sm-7 ">
                        <asp:TextBox ID="comuneNascita" class="form-control" runat="server"></asp:TextBox>
                    </div>
                </div>
                <div class="form-group row ">
                    <label for="lblcomuneResidenza" class="col-sm-5 col-form-label register">Comune di residenza</label>
                    <div class="col-sm-7 ">
                        <asp:TextBox ID="comuneResidenza" class="form-control" runat="server"></asp:TextBox>
                    </div>
                </div>
                <hr>
                <!--FORM ATLETA-->
                <div id="atleta">
                    <div class="form-group row ">
                        <label for="lblnomeSocieta" class="col-sm-5 col-form-label register">Nome società</label>
                        <div class="col-sm-7 ">
                            <asp:TextBox ID="nomeSocieta" class="form-control" AccessKey="1" runat="server" required="true"></asp:TextBox>
                        </div>
                    </div>
                    <div class="form-group row ">
                        <label for="lblDataScadCert" class="col-sm-5 col-form-label register">Data scadenza certificato</label>
                        <div class="col-sm-7 ">
                            <asp:TextBox runat="server" ID="dataScadenzaCertificato" class="form-control" AccessKey="1" required="true" TextMode="Date"></asp:TextBox>
                        </div>
                    </div>
                    <div class="form-group row ">
                        <label for="lblDataScadCert" class="col-sm-2 col-form-label register">Altezza</label>
                        <div class="col-sm-4 ">
                            <asp:TextBox ID="altezza" class="form-control" runat="server" TextMode="Number"></asp:TextBox>
                        </div>
                        <label for="lblPeso" class="col-sm-2 col-form-label register">Peso</label>
                        <div class="col-sm-4 ">
                            <asp:TextBox ID="peso" class="form-control" runat="server" TextMode="Number"></asp:TextBox>
                        </div>
                    </div>
                </div>
                <!--FORM ALLENATORE-->
                <div id="allenatore">
                    <div class="form-group row ">
                        <label for="lblgrado" class="col-sm-5 col-form-label register">Grado</label>
                        <div class="col-sm-7 ">
                            <asp:TextBox ID="grado" class="form-control" AccessKey="1" Visible="false" runat="server" required="true"></asp:TextBox>
                        </div>
                    </div>
                </div>
                <!--FORM DELEGATO-->
                <div class="form-group row " id="delegato">
                    <label for="lblRuolo" class="col-sm-5 col-form-label register">Ruolo</label>

                    <div class="col-sm-7">
                        <div class="form-check form-check-inline">
                            <asp:RadioButton ID="supervisore" runat="server" Text="Supervisore" GroupName="role" Checked="true"></asp:RadioButton>
                            <asp:RadioButton ID="arbitro" runat="server" Text="Arbitro" GroupName="role"></asp:RadioButton>
                        </div>
                    </div>
                </div>
                <asp:Button ID="btn_registerAtleta" runat="server" Text="RegistraAtleta" OnClick="btn_registerAtleta_Click" />
                <asp:Label ID="risultato" runat="server" Text="Label"></asp:Label>
            </div>
        </div>
    </form>

            <script src="Scripts/jquery-3.4.1.min.js "></script>
        <script src="Scripts/bootstrap.min.js "></script>

</body>
</html>
