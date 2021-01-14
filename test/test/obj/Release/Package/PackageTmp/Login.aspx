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
   </script>
</head>
<body class="bodylogin">
    <form id="form1" autocomplete="off" runat="server" class="loginform">
        <div class="row bg">
            <div class="container mr-auto pr-5 box centerContent">
                <div class="form-group row">
                    <label for="Email" class="col-sm-5 col-form-label loginformlabel">Email</label>
                    <div class="col-sm-7">
                        <asp:TextBox ID="email" CssClass="form-control" runat="server" TextMode="Email" required="true"></asp:TextBox>
                    </div>
                </div>
                <div class="form-group row">
                    <label for="PWD" class="col-sm-5 col-form-label loginformlabel">Password</label>
                    <div class="col-sm-7">
                        <div class="row">
                            <asp:TextBox ID="PWD" CssClass="form-control col-10" runat="server" TextMode="Password" required="true"></asp:TextBox>
                            <div class="col-2">
                                <i class="fas fa-eye" id="seepass" onclick="test();" style="color: white;"></i>
                            </div>
                        </div>
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
