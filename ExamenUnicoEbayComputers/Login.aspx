<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="ExamenUnicoEbayComputers.Login" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <title>Login</title>

    <!-- Bootstrap core CSS -->
    <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
    <!-- Custom styles for this template -->
    <link href="css/login.css" rel="stylesheet" />
</head>
<body class="text-center">
    <form class="form-signin" runat="server">
        <img class="mb-4 rounded-circle" src="assets/img/logo4.png" alt="The Creator" width="180" height="120">
        <h1 class="h1 mb-3 font-weight-normal"><b>LOG IN</b></h1>
        <label for="inputEmail" class="sr-only">Usuario</label>
        <input type="text" id="Usuario" runat="server" class="form-control mb-2" placeholder="Usuario" required autofocus>
        <label for="inputPassword" class="sr-only">Contraseña</label>
        <input type="password" id="Contrasena" runat="server" class="form-control mb-2" placeholder="Contraseña" required>
        <div class="checkbox mb-3">
        </div>
        <div class="row">
            <div class="col-md-12">
                <asp:Button ID="LogInApp" runat="server" CssClass="btn btn-lg btn-primary btn-block mb-2" OnClick="LogInApp_Click" Text="Log In"  />
            </div>
        </div>
        
        
    </form>
</body>
</html>
