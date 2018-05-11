<script runat="server">
    Protected Sub ButtonFeed_Click(sender As Object, e As EventArgs)

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
</script>


<body style="height: 380px; width: 510px; text-align: center;">
    <form id="form1" runat="server">
         <asp:Button ID="Feed"      runat="server" Text="Feed" style="position:absolute; top: 348px; left: 011px;" OnClick = "ButtonFeed_Click"/>
         <asp:Button ID="Flush"     runat="server" Text="Flush" style="position:absolute; top: 348px; left: 074px;" OnClick = "ButtonFlush_Click"/>
         <asp:Button ID="Play"      runat="server" Text="Play" style="position:absolute; top: 348px; left: 137px;" OnClick = "ButtonPlay_Click"/>
         <asp:Button ID="Cure"      runat="server" Text="Cure" style="position:absolute; top: 348px; left: 137px;" OnClick = "ButtonCure_Click"/>
         <asp:Button ID="Lights"    runat="server" Text="Lights" style="position:absolute; top: 348px; left: 200px;" OnClick = "ButtonLights_Click"/>

    </form>
</body>



