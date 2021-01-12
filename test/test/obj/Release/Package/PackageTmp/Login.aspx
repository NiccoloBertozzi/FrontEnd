<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="test.Login" %>

<!DOCTYPE html>
<html>

<head runat="server">
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
    <title>Login</title>
    <link rel="stylesheet" href="Content/bootstrap.min.css">
    <link rel="stylesheet" href="Content/styles.css">
</head>
<body>
    <form id="form1" autocomplete="off" runat="server" class="loginform">
        <div class="row bg">
            <div class="container mr-auto pr-5 box centerContent">
                    <div class="form-group row">
                        <label for="Email" class="col-sm-5 col-form-label loginformlabel">Email</label>
                        <div class="col-sm-7">
                            <asp:TextBox ID="email" CssClass="form-control" runat="server"></asp:TextBox>
                        </div>
                    </div>
                    <div class="form-group row">
                        <label for="PWD" class="col-sm-5 col-form-label loginformlabel">Password</label>
                        <div class="col-sm-7">
                            <asp:TextBox ID="PWD" CssClass="form-control" runat="server"></asp:TextBox>
                        </div>
                    </div>
                <asp:LinkButton ID="LabelRecovery" runat="server" Text="Recupera password" OnClick="LabelRecovery_Click"></asp:LinkButton>
                <div class="row">
                    <asp:Button ID="login" runat="server" CssClass="btnLogin mx-auto" Text="Accedi" OnClick="btn_accedi_Click" />
                </div>
                <div class="row">
                    <p class="mx-auto my-auto p-3">oppure</p>
                </div>
                <div class="row">
                    <asp:Button ID="register" runat="server" CssClass="btnRegister mx-auto" Text="Registrati" OnClick="register_Click" />
                </div>
            </div>
        </div>
        <script src="Scripts/jquery-3.4.1.min.js "></script>
        <script src="Scripts/bootstrap.min.js "></script>
    </form>
</body>
</html>
