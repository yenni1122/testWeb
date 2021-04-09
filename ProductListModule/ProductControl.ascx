<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ProductControl.ascx.cs" Inherits="ProductListModule.ProductControl" %>

<div style="float:right; padding-top:2%;">
        <asp:Label ID="Label1" runat="server" Text="Keyword : "></asp:Label>
        &ensp;
        <asp:TextBox ID="txtKeyword" runat="server"></asp:TextBox>
        &emsp;
        <asp:Button ID="btnCostumeShow" runat="server" Text="Search" OnClick="btnCostumeShow_Click" />
    </div>

<div>
    <asp:Repeater ID="Repeater1" runat="server" DataSourceID="SqlDataSource1">
        <ItemTemplate>
            <asp:HiddenField ID="sortIDHidden" runat="server" Value='<%# Eval("cat_id") %>' />
            <asp:LinkButton ID="sortButton" runat="server" OnClick="sortButton_Click" Text='<%# DataBinder.Eval(Container.DataItem, "cat_type") %>'>LinkButton</asp:LinkButton>
        </ItemTemplate>
    </asp:Repeater>
</div>
<asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ProductListConnectionString %>" SelectCommand="SELECT * FROM [Category]"></asp:SqlDataSource>

<asp:DataList ID="DataList1" DataSourceID="SqlDataSource2" runat="server" CellPadding="4" ForeColor="#333333" RepeatColumns="4" RepeatDirection="Horizontal">
        <AlternatingItemStyle BackColor="White" ForeColor="#284775"></AlternatingItemStyle>

        <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White"></FooterStyle>

        <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White"></HeaderStyle>

        <ItemStyle BackColor="#F7F6F3" ForeColor="#333333"></ItemStyle>
        <ItemTemplate>
            <asp:Label ID="hiddenID" runat="server" Text='<%# Eval("prod_cat") %>' Visible="false" />
            <div style="text-align:center; margin:5%;">
                <asp:HiddenField ID="hidden" runat="server" Value='<%# Eval("prod_id") %>' />
                <asp:Image ID="Image1" runat="server" ImageUrl='<%#"~/image/" + DataBinder.Eval(Container.DataItem,"prod_img").ToString()%>' Width="50%"/><br />
                <asp:LinkButton ID="LinkButton1" runat="server" OnClick="LinkButton1_Click" Text='<%#DataBinder.Eval(Container.DataItem,"prod_name") %>'>
                </asp:LinkButton><br /> 
                RM 
                <asp:Label Text='<%# Eval("prod_price","{0:0.00}") %>' runat="server" ID="Prod_PriceLabel" /><br />
                <br />
            </div>
        </ItemTemplate>
        <SelectedItemStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333"></SelectedItemStyle>
    </asp:DataList>
<asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ProductListConnectionString %>" SelectCommand="SELECT [prod_id], [prod_name], [prod_price], [prod_img], [prod_cat] FROM [Product2]"></asp:SqlDataSource>
