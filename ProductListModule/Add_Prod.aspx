<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Add_Prod.aspx.cs" Inherits="ProductListModule.Add_Prod" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <h3>Add Product</h3>

            <table style="float: left; width: 55%;">
                <tr>
                    <th style="vertical-align: top;">
                        <asp:Label ID="Label7" runat="server" Text="Product ID"></asp:Label>
                    </th>
                    <td style="padding-bottom: 10px; padding-left: 10px;">
                        <asp:Label ID="res_addProd_id" runat="server"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <th style="vertical-align: top;">
                        <asp:Label ID="Label1" runat="server" Text="Name"></asp:Label>

                    </th>
                    <td style="padding-bottom: 10px; padding-left: 10px;">
                        <asp:TextBox ID="tbx_addProd_name" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" ValidationGroup="add" ControlToValidate="tbx_addProd_name" runat="server" ErrorMessage="Please enter product name" ForeColor="Red"></asp:RequiredFieldValidator>

                    </td>
                </tr>
                <tr>
                    <th style="vertical-align: top;">
                        <asp:Label ID="Label2" runat="server" Text="Price"></asp:Label>

                    </th>
                    <td style="padding-bottom: 10px; padding-left: 10px;">
                        <asp:TextBox ID="tbx_addProd_price" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" ValidationGroup="add" ControlToValidate="tbx_addProd_price" runat="server" ErrorMessage="Please enter product price" ForeColor="Red"></asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="tbx_addProd_price" ValidationExpression="^\d{0,8}(\.\d{1,4})?$" ErrorMessage="Invalid input"></asp:RegularExpressionValidator>

                    </td>
                </tr>
                <tr>
                    <th style="vertical-align: top;">
                        <asp:Label ID="Label3" runat="server" Text="Description"></asp:Label>

                    </th>
                    <td style="padding-bottom: 10px; padding-left: 10px;">
                        <textarea id="tbx_addProd_desc" runat="server" cols="30" rows="5"></textarea>
                    </td>
                </tr>
                <tr>
                    <th style="vertical-align: top;">
                        <asp:Label ID="Label4" runat="server" Text="Image"></asp:Label>

                    </th>
                    <td style="padding-bottom: 10px; padding-left: 10px;">
                        <asp:FileUpload ID="addProd_img" runat="server" /></td>
                </tr>
                <tr>
                    <th style="vertical-align: top;">
                        <asp:Label ID="Label5" runat="server" Text="Category"></asp:Label>

                    </th>
                    <td style="padding-bottom: 10px; padding-left: 10px;">
                        <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="SqlDataSource1" DataTextField="cat_type" DataValueField="cat_id"></asp:DropDownList>
                        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ProductListConnectionString %>" SelectCommand="SELECT * FROM [Category]"></asp:SqlDataSource>
                    </td>
                </tr>
                <tr>
                    <th style="vertical-align: top;">
                        <asp:Label ID="Label6" runat="server" Text="Quantity"></asp:Label>

                    </th>
                    <td style="padding-bottom: 10px; padding-left: 10px;">
                        <asp:TextBox ID="tbx_addProd_qty" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" ValidationGroup="add" ControlToValidate="tbx_addProd_qty" runat="server" ErrorMessage="Please enter quantity" ForeColor="Red"></asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ControlToValidate="tbx_addProd_qty" ValidationExpression="^[1-9]\d*$" ErrorMessage="Invalid input"></asp:RegularExpressionValidator>
                    </td>
                </tr>
                <tr>
                    <th>
                        <asp:Label ID="Label8" runat="server" Text="Shipping Fee"></asp:Label>

                    </th>
                    <td>
                        <asp:TextBox ID="addProd_ship" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" ValidationGroup="add" ControlToValidate="addProd_ship" runat="server" ErrorMessage="Please enter shipping price" ForeColor="Red"></asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="addProd_ship" ValidationExpression="^\d{0,8}(\.\d{1,4})?$" ErrorMessage="Invalid input"></asp:RegularExpressionValidator>

                    </td>
                </tr>
                <%--<tr>
                    <th>
                        <asp:Label ID="Label9" runat="server" Text="Date"></asp:Label>

                    </th>
                    <td>
                        <asp:Label ID="addProd_date" runat="server"></asp:Label>
                    </td>
                </tr>--%>
            </table>
<%--            <asp:SqlDataSource ID="SqlDataSource2" runat="server"></asp:SqlDataSource>--%>

        </div>
        <asp:Button ID="Button1" runat="server" Text="Submit" OnClick="Button1_Click" />
        <asp:Button ID="Button2" runat="server" Text="Cancel" OnClick="Button2_Click" />
    </form>
</body>

</html>

