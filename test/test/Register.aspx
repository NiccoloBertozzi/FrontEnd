<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="test.RegisterAtleta" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:DropDownList id="ruolo"
                    AutoPostBack="True"
                    OnSelectedIndexChanged="ruolo_SelectedIndexChanged" 
                    runat="server">
                  <asp:ListItem Selected="True" Value="Atleta"> Atleta </asp:ListItem>
                  <asp:ListItem Value="Allenatore"> Allenatore </asp:ListItem>
                  <asp:ListItem Value="Delegato"> Delegato </asp:ListItem>
                  <asp:ListItem Value="Societa"> Società </asp:ListItem>
               </asp:DropDownList><br />
            <asp:PlaceHolder ID="formregister" runat="server">
            <asp:Label ID="lblTessera" runat="server" Text="Codice Tessera *"></asp:Label> <!-- Codice Tessera -->
            <asp:TextBox ID="codiceTessera" AccessKey="1" runat="server"></asp:TextBox> <br />

            <asp:Label ID="lblNome" runat="server" Text="Nome *"></asp:Label> <!-- Nome -->
            <asp:TextBox ID="nome" AccessKey="1" runat="server"></asp:TextBox> <br />

            <asp:Label ID="lblCognome" runat="server" Text="Cognome *"></asp:Label> <!-- Cognome -->
            <asp:TextBox ID="cognome" AccessKey="1" runat="server"></asp:TextBox> <br />

            <asp:Label ID="lblEmail" runat="server" Text="Email *"></asp:Label> <!-- Email -->
            <asp:TextBox ID="email" AccessKey="1" runat="server"></asp:TextBox> <br />

            <asp:Label ID="lblTel" runat="server" Text="Numero di cellulare"></asp:Label> <!-- Numero Cellulare -->
            <asp:TextBox ID="tel" runat="server"></asp:TextBox> <br />
            
            <asp:Label ID="lblDataNascita" runat="server" Text="Data di nascita mm/gg/aaaa *"></asp:Label> <!-- Data Nascita -->
            <asp:TextBox ID="dataNascita" AccessKey="1" runat="server"></asp:TextBox> <br />

            <asp:Label ID="lblCf" runat="server" Text="Codice fiscale *"></asp:Label> <!-- Codice Fiscale -->
            <asp:TextBox ID="cf" AccessKey="1" runat="server"></asp:TextBox> <br />

            <asp:Label ID="lblIndirizzo" runat="server" Text="Indirizzo"></asp:Label> <!-- Indirizzo -->
            <asp:TextBox ID="indirizzo" runat="server"></asp:TextBox> <br />

            <asp:Label ID="lblCap" runat="server" Text="cap"></asp:Label> <!-- Cap -->
            <asp:TextBox ID="cap" runat="server"></asp:TextBox> <br />

            <asp:Label ID="lblDataScadCert" runat="server" Text="Data di scadenza del certificato"></asp:Label> <!-- Data Scadenza Certificato -->
            <asp:TextBox ID="dataScadenzaCertificato" runat="server"></asp:TextBox> <br />

            <asp:Label ID="lblAltezza" runat="server" Text="Altezza"></asp:Label> <!-- Altezza -->
            <asp:TextBox ID="altezza" runat="server"></asp:TextBox> <br />

            <asp:Label ID="lblPeso" runat="server" Text="Peso"></asp:Label> <!-- Peso -->
            <asp:TextBox ID="peso" runat="server"></asp:TextBox> <br />

            <asp:Label ID="lblSesso" runat="server" Text="Sesso"></asp:Label> <!-- Sesso -->
            <asp:RadioButton ID="sesso1" runat="server" Text="Maschio" GroupName="sesso"></asp:RadioButton>
            <asp:RadioButton ID="sesso2" runat="server" Text="Femmina" GroupName="sesso"></asp:RadioButton> <br/>

            <asp:Label ID="lblgrado" runat="server" Visible="false" Text="Grado *"></asp:Label> <!-- Codice Fiscale -->
            <asp:TextBox ID="grado" AccessKey="1" Visible="false" runat="server"></asp:TextBox> <br />

            <!--CREDENZIALI-->

            <asp:Label ID="lblComuneNascita" runat="server" Text="Comune di nascita"></asp:Label> <!-- Comune di nascita -->
            <asp:TextBox ID="comuneNascita" runat="server"></asp:TextBox> <br />

            <asp:Label ID="lblComuneResidenza" runat="server" Text="Comune di residenza"></asp:Label> <!-- Comune di residenza -->
            <asp:TextBox ID="comuneResidenza" runat="server"></asp:TextBox> <br />

            <asp:Label ID="lblNomeSocieta" runat="server" Text="Nome della società *"></asp:Label> <!-- Nome Società  -->
            <asp:TextBox ID="nomeSocieta" AccessKey="1" runat="server"></asp:TextBox> <br />

            <asp:Label ID="lblPassword" runat="server" Text="Password *"></asp:Label> <!-- Password -->
            <asp:TextBox ID="password" AccessKey="1" runat="server"></asp:TextBox> <br />
            </asp:PlaceHolder> <br />
            <asp:Label ID="info" runat="server" Text="* Campi obbligatori"></asp:Label> <br /> <!-- obbligatori -->
            <asp:Button ID="btn_registerAtleta" runat="server" Text="RegistraAtleta" OnClick="btn_registerAtleta_Click" /> <br/>
            <asp:Label ID="risultato" runat="server" Text="Label"></asp:Label>
        </div>
    </form>
</body>
</html>