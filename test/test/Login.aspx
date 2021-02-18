﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="test.Login" %>

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
    </script>
</head>
<body>
    <nav class="navbar navbar-dark navbar-expand-md my-navbar" id="my-navbar">
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

    <!--BANNER-->
    <div class="page-title row">
        <h1 class=" col-12 text-center my-auto">Login</h1>
    </div>

    <!--FORM-->
    <div class="container">
        <form id="form1" runat="server">
            <div class="row mt-lg-4">
                <div class="col-sm-12 col-lg-6">
                    <label for="Email" class="col-form-label">Email</label>
                </div>
                <div class="col-sm-12 col-lg-6">
                    <asp:TextBox runat="server" ID="email" CssClass="form-control" TextMode="Email" placeholder="Email" required="true"></asp:TextBox>
                </div>
            </div>
            <div class="row mt-lg-4">
                <div class="col-sm-12 col-lg-6">
                    <label for="PWD" class="col-form-label">Password</label>
                </div>
                <div class="col-sm-12 col-lg-6">
                    <asp:TextBox runat="server" ID="PWD" CssClass="form-control" TextMode="Password" placeholder="Password" required="true"></asp:TextBox>
                </div>
            </div>
            <div class="row my-lg-4 my-2 justify-content-center">
                <asp:LinkButton runat="server" ID="pswdimenticata" OnClick="LabelRecovery_Click" Text="Password Dimenticata? Recupera la password"></asp:LinkButton>
            </div>
            <div class="row">
                <asp:Button runat="server" ID="Accedi" CssClass="btnLogin mx-auto" OnClick="btn_accedi_Click" Text="Accedi" />
            </div>
            <div class="row">
                <p class="mx-auto my-auto p-3">oppure</p>
            </div>
        </form>
        <div class="row">
            <a href="Register.aspx?ruolo=Atleta" class="btnRegister mx-auto">Registrati</a>
        </div>
    </div>

    <script src="Scripts/jquery-3.4.1.min.js "></script>
    <script src="Scripts/bootstrap.min.js "></script>
</body>
</html>
