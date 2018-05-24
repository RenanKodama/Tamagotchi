<%@Import Namespace="GameSolution"%>
<%@Register Assembly="AjaxControlToolkit"  Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit"%>
<%@Import Namespace="System.Drawing" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
        <head id="Head1" runat="server">
            <title>Virtual Pet</title>
            <style type="text/css">
            </style>
        </head>

        <body style="height: 380px; width: 510px; text-align: center;">
  
            <form id="form1" runat="server">
                <asp:Panel ID="PanelActions" runat="server" style="position:absolute; top: 326px; left: 15px; width: 315px; height: 65px;">
                    <asp:Button ID="Play"       runat="server" OnClick="ButtonPlay_Click"   style="position:absolute; top: 35px; height: 22px; width: 46px; left: 126px;" Text="Play" />
                    <asp:Button ID="Cure"       runat="server" OnClick="ButtonCure_Click"   style="position:absolute; top: 35px; height: 22px; width: 46px; left: 63px;" Text="Cure" />
                    <asp:Button ID="Lights"     runat="server" OnClick="ButtonLights_Click" style="position:absolute; top: 35px; height: 22px; width: 46px; left: 190px;" Text="Lights" />
                    <asp:Button ID="Button1"    runat="server" OnClick="ButtonFeed_Click"   style="position:absolute; top: 35px; height: 22px; width: 46px; left: 252px;" Text="Feed" />
                    <asp:Button ID="Flush"      runat="server" OnClick="ButtonFlush_Click"  style="position:absolute; top: 35px; height: 22px; width: 46px; left: 5px ;" Text="Flush"  />
                </asp:Panel>
    
                <asp:ScriptManager ID="ScriptManager1" runat="server" EnableCdn="true">
                </asp:ScriptManager>

                <asp:ScriptManagerProxy ID="ScriptManagerProxy1" runat="server">
                </asp:ScriptManagerProxy>

                <asp:Panel ID="PanelImage" runat="server" style="position:absolute; top: 109px; left: 24px; height: 181px; width: 482px;">
                </asp:Panel>

                

                <asp:UpdatePanel ID="PanelStatus" runat="server" style="position:absolute; top: 320px; left: 334px; width: 179px;" UpdateMode="Conditional" >
                    <ContentTemplate>
                        <asp:Timer ID="Timer1" runat="server" Interval="5000" ></asp:Timer>
                    
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


        

            <script runat="server">
                Dim person As New Personagem()
                Dim aTimer As New System.Timers.Timer()

                Protected Sub ButtonFeed_Click(sender As Object, e As EventArgs)
                    If person.GetSleeping = False Then
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
                    End If
                End Sub

                Protected Sub ButtonFlush_Click(sender As Object, e As EventArgs)
                    If person.GetSleeping = False Then
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
                    End If
                End Sub

                Protected Sub ButtonPlay_Click(sender As Object, e As EventArgs)
                    If person.GetSleeping = False Then
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
                    End If
                End Sub

                Protected Sub ButtonCure_Click(sender As Object, e As EventArgs)
                    If person.GetSleeping = False Then
                        Dim aux_health As Integer = person.GetHealth()

                        aux_health += CInt(Math.Ceiling(Rnd() * 10)) + 1

                        If aux_health > 100 Then
                            aux_health = 100
                        End If

                        person.SetHealth(aux_health)
                        PanelStatus.Update()
                    End If
                End Sub

                Protected Sub ButtonLights_Click(sender As Object, e As EventArgs)
                    Dim aux_sleep As Boolean = person.GetSleeping()

                    If aux_sleep = True Then
                        aux_sleep = False
                        PanelImage.BackColor = System.Drawing.Color.Yellow
                    Else
                        aux_sleep = True
                        PanelImage.BackColor = System.Drawing.Color.Black
                    End If

                    person.SetSleeping(aux_sleep)
                    PanelStatus.Update()
                End Sub

                Protected Sub Page_Load(sender As Object, e As EventArgs)
                    If person.GetSleeping = False Then
                        PanelImage.BackColor = System.Drawing.Color.DarkGray
                    Else
                        PanelImage.BackColor = System.Drawing.Color.Black
                    End If
                End Sub

                Protected Sub TextBoxHappy_TextChanged(sender As Object, e As EventArgs)
                    BoxHappy.Text = person.GetHappy()
                End Sub

                Protected Sub TextBoxHunger_TextChanged(sender As Object, e As EventArgs)
                    BoxHunger.Text = person.GetHunger()
                End Sub

                Protected Sub TextBoxHealth_TextChanged(sender As Object, e As EventArgs)
                    BoxHealth.Text = person.GetHealth()
                End Sub

                Protected Sub TextBoxEnergy_TextChanged(sender As Object, e As EventArgs)
                    BoxEnergy.Text = person.GetEnergy()
                End Sub

                Protected Sub Timer_Tick(ByVal sender As Object, ByVal e As System.EventArgs) Handles Timer1.Tick
                    Dim aux_happy As Integer = person.GetHappy()
                    Dim aux_hunger As Integer = person.GetHunger()
                    Dim aux_health As Integer = person.GetHealth()
                    Dim aux_energy As Integer = person.GetEnergy()
                    Dim aux_sleeping As Boolean = person.GetSleeping()

                    aux_happy -= 1
                    aux_hunger += 1
                    aux_health -= 1

                    If aux_sleeping = True Then
                        aux_energy += CInt(Math.Ceiling(Rnd() * 2)) + 1
                        aux_happy -= CInt(Math.Ceiling(Rnd() * 2)) + 1
                    Else
                        aux_energy -= CInt(Math.Ceiling(Rnd() * 2)) + 1
                    End If

                    If aux_happy < 0 Then
                        aux_happy = 0
                    End If

                    If aux_hunger > 100 Then
                        aux_hunger = 100
                    End If

                    If aux_health < 0 Then
                        aux_health = 0
                    End If

                    If aux_energy < 0 Then
                        aux_energy = 0
                    End If

                    person.SetHappy(aux_happy)
                    person.SetHunger(aux_hunger)
                    person.SetHealth(aux_health)
                    person.SetEnergy(aux_energy)

                    PanelStatus.Update()
                End Sub
            </script>
        </form>
    </body>
</html>


