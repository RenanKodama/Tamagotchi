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
    </form>
</body>
    <script runat="server">
        Private Sub Button1_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Button1.Click
            Dim aux As String = ""
            Using Conn As New System.Data.SQLite.SQLiteConnection("Data Source=C:\Users\Clodoaldo Basaglia\Documents\LinguagemDeProgramação\Tamagotchi\Game\GameSolution\BD_SQL_Lite.db")
                Conn.Open()
                MsgBox("Abriu conexão", MsgBoxStyle.OkOnly, "Valido")
                Using Comm As New System.Data.SQLite.SQLiteCommand(Conn)
                    Comm.CommandText = "select * from Jogadores"
                    'Comm.ExecuteNonQuery()
                    MsgBox("Chegou no reader", MsgBoxStyle.OkOnly, "Valido")
                    Using Reader = Comm.ExecuteReader
                        MsgBox("entrou no reader", MsgBoxStyle.OkOnly, "Valido")
                        While Reader.Read()
                            MsgBox("while", MsgBoxStyle.OkOnly, "Valido")
                            aux = ("Nome do Cliente: {0}" + Reader("player_name"))
                            MsgBox(aux, MsgBoxStyle.OkOnly, "oi")
                        End While

                    End Using
                End Using
            End Using

            If TextBox1.Text = "rfb" And TextBox2.Text = "reflection" Then
                MsgBox("Logado", MsgBoxStyle.OkOnly, "Valido")
            Else
                MsgBox("Sorry, username or password not found", MsgBoxStyle.OkOnly, "Invalid")
            End If
        End Sub
    </script>
</html>
