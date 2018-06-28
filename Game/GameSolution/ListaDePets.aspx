<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="ListaDePets.aspx.vb" Inherits="GameSolution.ListaDePets" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>Lista de Pets</title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:Button ID="Button1" runat="server" Text="Listar" />
        </div>
        <asp:Table ID="Table1" runat="server" Width="293px">
            
        </asp:Table>
    </form>
</body>
    <script runat="server">
        Private Sub Button1_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Button1.Click
            Dim headerRow As New TableHeaderRow
            Dim headerTableCell1 As New TableHeaderCell
            Dim headerTableCell2 As New TableHeaderCell
            Dim headerTableCell3 As New TableHeaderCell
            headerTableCell1.Text = "Identificação"
            headerTableCell1.Scope = TableHeaderScope.Column
            headerTableCell1.AbbreviatedText = "ID"
            headerTableCell2.Text = "Nome do Pet"
            headerTableCell2.Scope = TableHeaderScope.Column
            headerTableCell2.AbbreviatedText = "pet"
            headerTableCell3.Text = "Ações"
            headerTableCell3.Scope = TableHeaderScope.Column
            headerTableCell3.AbbreviatedText = "jogar"
            headerRow.Cells.Add(headerTableCell1)
            headerRow.Cells.Add(headerTableCell2)
            headerRow.Cells.Add(headerTableCell3)
            Table1.Rows.AddAt(0, headerRow)

            Using Conn As New System.Data.SQLite.SQLiteConnection("Data Source=C:\Users\Clodoaldo Basaglia\Documents\LinguagemDeProgramação\Tamagotchi\Game\GameSolution\BD_SQL_Lite.db")
                Conn.Open()
                Using Comm As New System.Data.SQLite.SQLiteCommand(Conn)
                    Comm.CommandText = "SELECT * FROM Pet WHERE player_id=" + Session("id").ToString
                    Comm.ExecuteScalar()
                    Using Reader = Comm.ExecuteReader()
                        While Reader.Read()
                            Dim footerRow As New TableFooterRow
                            Dim footerTableCell1 As New TableCell
                            Dim footerTableCell2 As New TableCell
                            Dim footerTableCell3 As New TableCell
                            footerTableCell1.Text = Reader("pet_id").ToString
                            footerTableCell2.Text = Reader("pet_name")
                            Session.Add("pet_Id", Reader("pet_id").ToString)
                            footerTableCell3.Text = "<a href=Tela.aspx>Jogar</a>"
                            footerRow.Cells.Add(footerTableCell1)
                            footerRow.Cells.Add(footerTableCell2)
                            footerRow.Cells.Add(footerTableCell3)
                            Table1.Rows.Add(footerRow)
                            'MsgBox(Reader("pet_name"), MsgBoxStyle.OkOnly, "Invalido")
                        End While
                    End Using
                End Using
            End Using
        End Sub
    </script>
</html>
