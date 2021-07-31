<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="test.Login" %>

<!DOCTYPE html>
<html>

<head runat="server">
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
    <title>Login</title>
    <link rel="stylesheet" href="Content/bootstrap.min.css">
    <link rel="stylesheet" href="Content/styles.css">
    <script src="https://kit.fontawesome.com/95609c6d0f.js" crossorigin="anonymous"></script>
    <script type="text/javascript">
        function test() {
            if (document.getElementById('<%= PWD.ClientID %>').type == 'password') {
                document.getElementById('<%= PWD.ClientID %>').type = 'singleline'
            }
            else
                document.getElementById('<%= PWD.ClientID %>').type = 'password'
        }
        function Register() {
            LoadPage("Register.aspx");
        }
        function showPassword() {
            var x = document.getElementById("PWD");
            if (x.type === "password") {
                x.type = "text";
            }
            else
            {
                x.type = "password";
            }
        }
    </script>
</head>
<body>
    <nav class="navbar navbar-dark navbar-expand-md my-navbar sticky-top" id="my-navbar">
        <div class="container-fluid">
            <button data-toggle="collapse" class="navbar-toggler my-button" data-target="#navcol-1" id="my-navbar-items">
                <span class="sr-only">Toggle navigation</span>
                <i class="fas fa-bars" style="color: white;"></i>
            </button>
            <img src="Img/aibvc-logo.png" style="width: 94px;">
            <div class="collapse navbar-collapse row" id="navcol-1">
                <div class="col-1">
                    <asp:PlaceHolder runat="server" ID="AccediBtn"></asp:PlaceHolder>
                </div>
            </div>
        </div>
    </nav>

    <!--FORM-->
    <div class="container-fluid conCenter">
            <div class="boxlogin mx-auto mb-3">
                <form id="form1" runat="server">
                <div class="row mt-3 mb-3 p-3">
                    <h1 class=" col-12 text-center my-auto banner">Accedi</h1>
                </div>
                <div class="row px-4 pt-2">
                    <div class="col-12">
                        <label for="Email" class="col-form-label">Email</label>
                    </div>
                </div>
                <div class="row px-4 py-1">
                    <div class="col-12">
                        <asp:TextBox runat="server" ID="email" CssClass="form-control" TextMode="Email" placeholder="Email" required="true"></asp:TextBox>
                    </div>
                </div>
                <div class="row mt-2 px-4 py-1">
                    <div class="col-12">
                        <label for="PWD" class="col-form-label">Password</label>
                    </div>
                </div>
                <div class="row px-4 pb-2">
                    <div class="col-12">
                        <asp:TextBox runat="server" ID="PWD" CssClass="form-control" TextMode="Password" placeholder="Password" required="true"></asp:TextBox>
                    </div>
                </div>
                <div class="row px-4 pb-2">
                    <div class="col-12">
                        <input class="mr-2" type="checkbox" onclick="showPassword()">Mostra password
                    </div>
                </div>
                <div class="row mt-2 py-1">
                    <asp:Button runat="server" ID="Accedi" CssClass="btnLogin mx-auto" OnClick="btn_accedi_Click" Text="Accedi" />
                </div>
                <div class="row px-4 py-1">
                    <div class="col-12 text-center">
                        <asp:LinkButton runat="server" ID="pswdimenticata" OnClick="LabelRecovery_Click" Text="Password Dimenticata? Recupera la password"></asp:LinkButton>
                    </div>
                </div>
                <div class="row py-1">
                    <p class="mx-auto my-auto">oppure</p>
                </div>
                </form>
                <div class="row pb-3 pt-1">
                    <a href="Register.aspx?ruolo=Atleta" class="btnRegister mx-auto">Registrati</a>
                </div>
            </div>
    </div>

    <script src="Scripts/jquery-3.4.1.min.js "></script>
    <script src="Scripts/bootstrap.min.js "></script>
</body>
</html>
