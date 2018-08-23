<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="CadastrarPet.aspx.vb" Inherits="GameSolution.CadastrarPet" %>
<%@Import Namespace="GameSolution"%>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
        Digite o nome do Pet:<asp:TextBox ID="TextBox1" runat="server"></asp:TextBox><br />
            <asp:Button ID="Button1" runat="server" Text="Cancelar" /><asp:Button ID="Button2" runat="server" Text="Cadastrar" />
        </div>
    </form>
</body>
    <script runat="server">
        Private Sub Button1_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Button1.Click
            Response.Redirect("ListaDePets.aspx")
        End Sub
        Private Sub Button2_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Button2.Click
            Dim person As New Personagem()
            Using Conn As New System.Data.SQLite.SQLiteConnection("Data Source=C:\Users\Clodoaldo Basaglia\Documents\LinguagemDeProgramação\Tamagotchi\Game\GameSolution\BD_SQL_Lite.db")
                Conn.Open()
                Using Comm As New System.Data.SQLite.SQLiteCommand(Conn)
                    Comm.CommandText = "SELECT MAX(player_id) FROM Pet"
                    Dim maxID = Comm.ExecuteScalar()
                    Dim newID = maxID + 1
                    Comm.CommandText = "INSERT INTO Pet(pet_name,pet_health,pet_happy,pet_hunger,pet_toilet,pet_sleeping,pet_energy,player_id) VALUES(@nome,@health,@happy,@hunger,@toilet,@sleeping,@energy,@player_id)"

                    Comm.Parameters.AddWithValue("@nome", TextBox1.Text)
                    Comm.Parameters.AddWithValue("@energy", person.GetEnergy())
                    Comm.Parameters.AddWithValue("@happy", person.GetHappy())
                    Comm.Parameters.AddWithValue("@health", person.GetHealth())
                    Comm.Parameters.AddWithValue("@hunger", person.GetHunger())
                    Comm.Parameters.AddWithValue("@sleeping", person.GetSleeping())
                    Comm.Parameters.AddWithValue("@toilet", person.GetToilet())
                    Comm.Parameters.AddWithValue("@player_id", Request.QueryString("id").ToString)
                    Comm.ExecuteScalar()
                    MsgBox("Cadastrado", MsgBoxStyle.OkOnly, "Feito!")
                    Response.Redirect("ListaDePets.aspx")
                End Using
            End Using
        End Sub
    </script>
</html>
