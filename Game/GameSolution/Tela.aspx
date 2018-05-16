<%@Import Namespace="GameSolution"%>

<script runat="server">
    Dim person As New Personagem()

    Protected Sub ButtonFeed_Click(sender As Object, e As EventArgs)
        person.SetHunger(500)




        PanelStatus.Update()

    End Sub

    Protected Sub ButtonFlush_Click(sender As Object, e As EventArgs)

    End Sub

    Protected Sub ButtonPlay_Click(sender As Object, e As EventArgs)

    End Sub

    Protected Sub ButtonCure_Click(sender As Object, e As EventArgs)

    End Sub

    Protected Sub ButtonLights_Click(sender As Object, e As EventArgs)

    End Sub

    Protected Sub Page_Load(sender As Object, e As EventArgs)

    End Sub

    Protected Sub TextBoxHappy_TextChanged(sender As Object, e As EventArgs)
        BoxHappy.Text = person.GetHappy
    End Sub

    Protected Sub TextBoxHunger_TextChanged(sender As Object, e As EventArgs)
        BoxHunger.Text = person.GetHunger
    End Sub

    Protected Sub TextBoxHealth_TextChanged(sender As Object, e As EventArgs)
        BoxHealth.Text = person.GetHealth
    End Sub

    Protected Sub TextBoxEnergy_TextChanged(sender As Object, e As EventArgs)
        BoxEnergy.Text = person.GetEnergy
    End Sub


    'Protected Function ApenasParaTestar()
    'Dim auxiliar As String

    '   auxiliar = "Teste!"

    'Return auxiliar

    'End Function


</script>





<body style="height: 380px; width: 510px; text-align: center;">
    <form id="form1" runat="server">


        <asp:Panel ID="PanelActions" runat="server" style="position:absolute; top: 326px; left: 15px; width: 315px; height: 65px;">
            <asp:Button ID="Play"       runat="server" OnClick="ButtonPlay_Click"   style="position:absolute; top: 35px; height: 22px; width: 46px; left: 126px;" Text="Play" />
            <asp:Button ID="Cure"       runat="server" OnClick="ButtonCure_Click"   style="position:absolute; top: 35px; height: 22px; width: 46px; left: 63px;" Text="Cure" />
            <asp:Button ID="Lights"     runat="server" OnClick="ButtonLights_Click" style="position:absolute; top: 35px; height: 22px; width: 46px; left: 190px;" Text="Lights" />
            <asp:Button ID="Button1"    runat="server" OnClick="ButtonFeed_Click"   style="position:absolute; top: 35px; height: 22px; width: 46px; left: 252px;" Text="Feed" />
            <asp:Button ID="Flush"      runat="server" OnClick="ButtonFlush_Click"  style="position:absolute; top: 35px; height: 22px; width: 46px; left: 5px ;" Text="Flush"  />
        </asp:Panel>
    
        <asp:ScriptManager ID="ScriptManager1" runat="server">
        </asp:ScriptManager>
        <asp:UpdatePanel ID="PanelStatus" runat="server" style="position:absolute; top: 320px; left: 334px; width: 179px;" UpdateMode="Conditional">
            <ContentTemplate>
                <asp:Label ID="LabelHappy"      runat="server" Text="Happy" style="position:absolute; top: -9px; left: 5px; height: 2px; width: 1px;" Font-Size="Small"></asp:Label>
                <asp:TextBox ID="BoxHappy"      runat="server" style="position:absolute; top: -12px; left: 54px; width: 32px;" OnLoad="TextBoxHappy_TextChanged"></asp:TextBox>    
        
                <asp:Label ID="LabelHunger"     runat="server" Text="Hunger" style="position:absolute; top: 23px; left: 5px;" Font-Size="Small"></asp:Label>
                <asp:TextBox ID="BoxHunger"     runat="server" style="position:absolute; top: 18px; left: 54px; width: 32px;" OnLoad="TextBoxHunger_TextChanged"></asp:TextBox> 

                <asp:Label ID="LabelHealth"     runat="server" Text="Health" style="position:absolute; top: 54px; left: 5px;" Font-Size="Small"></asp:Label>
                <asp:TextBox ID="BoxHealth"     runat="server" style="position:absolute; top: 50px; left: 54px; width: 32px;" OnLoad="TextBoxHealth_TextChanged"></asp:TextBox>
            
                <asp:Label ID="LabelEnergy"     runat="server" Text="Energy" style="position:absolute; top: -9px; left: 100px; height: 2px; width: 1px;" Font-Size="Small"></asp:Label>
                <asp:TextBox ID="BoxEnergy"     runat="server" style="position:absolute; top: -12px; left: 148px; width: 32px;" OnLoad="TextBoxEnergy_TextChanged"></asp:TextBox>    
            </ContentTemplate>
        </asp:UpdatePanel>

        
        

        
    </form>
</body>



