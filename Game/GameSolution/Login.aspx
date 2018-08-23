<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="Login.aspx.vb" Inherits="GameSolution.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:Label ID="Label1" runat="server" Text="Login"></asp:Label><asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
            <asp:Label ID="Label2" runat="server" Text="Senha"></asp:Label><asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
            <asp:Button ID="Button1" runat="server" Text="Entrar" />
        </div>
        <div>
            Ainda não é cadastrado? Clique Aqui!
            <asp:Button ID="Button2" runat="server" Text="Cadastrar" />
        </div>
    </form>
</body>
    <script runat="server">
        Private Sub Button1_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Button1.Click
            Dim aux As String = ""
            Using Conn As New System.Data.SQLite.SQLiteConnection("Data Source=C:\Users\Clodoaldo Basaglia\Documents\LinguagemDeProgramação\Tamagotchi\Game\GameSolution\BD_SQL_Lite.db")
                Conn.Open()
                Using Comm As New System.Data.SQLite.SQLiteCommand(Conn)
                    Comm.CommandText = "SELECT * FROM Jogadores"
                    Comm.ExecuteScalar()
                    Using Reader = Comm.ExecuteReader()
                        While Reader.Read()
                            If TextBox1.Text = Reader("player_login") And TextBox2.Text = Reader("player_senha") Then
                                Session.Add("user", Reader("player_name"))
                                Session.Add("id", Reader("player_id"))
                                Response.Redirect("ListaDePets.aspx")
                            Else
                                'nada
                            End If
                        End While
                        MsgBox("Desculpe, Seu login/senha pode estar incorreto", MsgBoxStyle.OkOnly, "Invalido")
                    End Using
                End Using
            End Using
        End Sub
        Private Sub Button2_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Button2.Click
            Response.Redirect("CadastrarUser.aspx")
        End Sub
    </script>
</html>
