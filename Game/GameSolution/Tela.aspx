<%@Import Namespace="GameSolution"%>

<script runat="server">
    Dim person As New Personagem()


    Protected Sub ButtonFeed_Click(sender As Object, e As EventArgs)
        Dim aux_hunger As Integer = person.GetHunger()
        Dim aux_energy As Integer = person.GetEnergy()

        aux_hunger -= CInt(Math.Ceiling(Rnd() * 10)) + 1
        aux_energy -= CInt(Math.Ceiling(Rnd() * 25)) + 1


        If aux_hunger < 0 Then
            aux_hunger = 0
        End If

        If aux_energy < 1 Then
            aux_energy = 0
        End If

        person.SetHunger(aux_hunger)
        person.SetEnergy(aux_energy)
        PanelStatus.Update()
    End Sub

    Protected Sub ButtonFlush_Click(sender As Object, e As EventArgs)
        Dim aux_health As Integer = person.GetHealth()
        Dim aux_energy As Integer = person.GetEnergy()

        aux_health += CInt(Math.Ceiling(Rnd() * 10)) + 1
        aux_energy -= CInt(Math.Ceiling(Rnd() * 25)) + 1

        If aux_health > 100 Then
            aux_health = 100
        End If

        If aux_energy < 1 Then
            aux_energy = 0
        End If

        person.SetEnergy(aux_energy)
        person.SetHealth(aux_health)
        PanelStatus.Update()
    End Sub

    Protected Sub ButtonPlay_Click(sender As Object, e As EventArgs)
        Dim aux_happy As Integer = person.GetHappy()
        Dim aux_energy As Integer = person.GetEnergy()
        Dim aux_hunger As Integer = person.GetHunger()

        aux_happy += CInt(Math.Ceiling(Rnd() * 10)) + 1
        aux_energy -= CInt(Math.Ceiling(Rnd() * 25)) + 1
        aux_hunger += CInt(Math.Ceiling(Rnd() * 10)) + 1

        If aux_happy > 100 Then
            aux_happy = 100
        End If

        If aux_energy < 0 Then
            aux_energy = 0
        End If

        If aux_hunger > 100 Then
            aux_hunger = 100
        End If

        person.SetHappy(aux_happy)
        person.SetEnergy(aux_energy)
        person.SetHunger(aux_hunger)
        PanelStatus.Update()
    End Sub

    Protected Sub ButtonCure_Click(sender As Object, e As EventArgs)
        Dim aux_health As Integer = person.GetHealth()

        aux_health += CInt(Math.Ceiling(Rnd() * 10)) + 1

        If aux_health > 100 Then
            aux_health = 100
        End If

        person.SetHealth(aux_health)
        PanelStatus.Update()
    End Sub

    Protected Sub ButtonLights_Click(sender As Object, e As EventArgs)
        Dim aux_sleep As Boolean = person.GetSleeping()

        If aux_sleep = True Then
            aux_sleep = False
        Else
            aux_sleep = True
        End If

        person.SetSleeping(aux_sleep)
        PanelStatus.Update()
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

    Protected Sub Timer_Tick(ByVal sender As Object, ByVal e As EventArgs)
        Dim aux_happy As Integer = person.GetHappy()
        Dim aux_hunger As Integer = person.GetHunger
        Dim aux_health As Integer = person.GetHealth()
        Dim aux_energy As Integer = person.GetEnergy()

        aux_happy -= CInt(Math.Ceiling(Rnd() * 2)) + 1
        aux_hunger += CInt(Math.Ceiling(Rnd() * 2)) + 1
        aux_health -= CInt(Math.Ceiling(Rnd() * 2)) + 1
        aux_energy -= CInt(Math.Ceiling(Rnd() * 2)) + 1

        person.SetHappy(aux_happy)
        person.SetHunger(aux_hunger)
        person.SetHealth(aux_health)
        person.SetEnergy(aux_energy)
        PanelStatus.Update()
    End Sub
</script>





<body style="height: 380px; width: 510px; text-align: center;">
    <form id="form1" runat="server">
        <asp:Timer ID="Timer1" OnTick="Timer_Tick" runat="server" Interval="2000"/>


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



