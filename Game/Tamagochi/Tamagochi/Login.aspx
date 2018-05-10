<%@ Page Language="VB" %>

<!DOCTYPE html>
<html lang="en" xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta charset="utf-8" />
    <title>Login</title>    
</head>
<body>
    <h1>Faça seu login</h1>
    <form runat="server">
        <asp:Login 
        ID="Login" 
        runat="server" 
        DestinationPageUrl="~/Tela.aspx">
    </asp:Login>
    </form>
    
</body>
</html>
