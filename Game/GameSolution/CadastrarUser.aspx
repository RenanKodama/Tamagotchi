<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="CadastrarUser.aspx.vb" Inherits="GameSolution.CadastrarUser" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            Nome:<asp:TextBox ID="TextBox1" runat="server"></asp:TextBox><br />
            Login:<asp:TextBox ID="TextBox2" runat="server"></asp:TextBox><br />
            Senha:<asp:TextBox ID="TextBox3" runat="server"></asp:TextBox><br />
            <asp:Button ID="Button1" runat="server" Text="Cancelar" /><asp:Button ID="Button2" runat="server" Text="Cadastrar" />
        </div>
    </form>
</body>
    <script runat="server">
        Private Sub Button1_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Button1.Click
            Response.Redirect("Login.aspx")
        End Sub

        Private Sub Button2_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Button2.Click
            Using Conn As New System.Data.SQLite.SQLiteConnection("Data Source=C:\Users\Clodoaldo Basaglia\Documents\LinguagemDeProgramação\Tamagotchi\Game\GameSolution\BD_SQL_Lite.db")
                Conn.Open()
                Using Comm As New System.Data.SQLite.SQLiteCommand(Conn)
                    Comm.CommandText = "SELECT MAX(player_id) FROM Jogadores"
                    Dim maxID = Comm.ExecuteScalar()
                    Dim newID = maxID + 1
                    MsgBox("ID max=" + maxID.ToString, MsgBoxStyle.OkOnly, "Invalido")
                    Comm.CommandText = "INSERT INTO Jogadores(player_id,player_name,player_senha,player_login) VALUES(@id,@nome,@senha,@login)"
                    Comm.Parameters.AddWithValue("@id", newID.ToString)
                    Comm.Parameters.AddWithValue("@nome", TextBox1.Text)
                    Comm.Parameters.AddWithValue("@login", TextBox2.Text)
                    Comm.Parameters.AddWithValue("@senha", TextBox3.Text)
                    Comm.ExecuteScalar()
                    MsgBox("Cadastrado", MsgBoxStyle.OkOnly, "Feito!")
                    Response.Redirect("Login.aspx")
                End Using
            End Using
        End Sub
    </script>
</html>
