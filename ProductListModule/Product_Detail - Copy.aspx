<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Product_Detail.aspx.cs" Inherits="ProductListModule.Product_Detail" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>


    <style>
        .changeButton，.btnMinus, .btnAdd {
            border: 1px solid black;
            background-color: snow;
        }

            .changeButton:hover, .onChangeButton, .onMinusButton, .onAddButton, .btnAdd:hover, .btnMinus:hover {
                color: snow;
                border: 1px solid snow;
                background-color: black;
            }

        .changeButton, .changeButton:hover, .onChangeButton {
            padding: 1% 2%;
        }

        .customerImage {
            border-radius: 50%;
            border: 2px solid white;
        }

        .star1:hover ~ .star2, .star1:hover ~ .star3, .star1:hover ~ .star4,
        .star1:hover ~ .star5, .star2:hover ~ .star3, .star2:hover ~ .star4,
        .star2:hover ~ .star5, .star3:hover ~ .star4, .star3:hover ~ .star5,
        .star3:hover ~ .star4, .star3:hover ~ .star5, .star4:hover ~ .star5 {
            -webkit-text-stroke-width: 1px;
            -webkit-text-stroke-color: #FAE842;
            -webkit-text-fill-color: white;
        }

        .fa-star, .checked {
            -webkit-text-stroke-color: #F7DC10;
            -webkit-text-fill-color: #F7DC10;
        }

        .not-checked {
            -webkit-text-stroke-width: 1px;
            -webkit-text-stroke-color: #FAE842;
            -webkit-text-fill-color: white;
        }

        .btn {
            padding: 12px 25px 12px 25px;
            margin-right: 1%;
            margin-bottom: 2%;
            margin-top: 1%;
            background-color: white;
        }

        .addBtn:hover {
            transition-duration: 0.4s;
            background-color: #333;
            color: white;
        }

        .changewish {
            background: url(image/wish.svg);
            height: 25px;
            width: 25px;
            border: none;
        }

        .btn_wish {
            background: url(image/wish_blank.svg);
            height: 25px;
            width: 25px;
            border: none;
        }
    </style>

    
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ProductListConnectionString %>" SelectCommand="SELECT * FROM [Product2] WHERE ([prod_id] = @prod_id)">
        <SelectParameters>
            <asp:QueryStringParameter Name="prod_id" QueryStringField="prod_id" Type="String" />
        </SelectParameters>
    </asp:SqlDataSource>

    <div style="margin-top: 5%;">
        <asp:Label ID="Label5" runat="server" Text="TWSTING"></asp:Label>
        <asp:Label ID="Label4" runat="server" Text='<%# Eval("prod_name") %>'></asp:Label>
        <asp:DataList ID="DataList1" runat="server" DataKeyField="Prod_ID" DataSourceID="SqlDataSource1" Style="width: 80%; margin-top: -12%; margin-left: 20%;" OnItemDataBound="DataList1_ItemDataBound">
            <ItemTemplate>
                <td style="width: 160px; float: right; margin-top: 45%;">
                    <asp:ImageButton ID="Image2" runat="server" ImageUrl='<%#"~/image/" + DataBinder.Eval(Container.DataItem,"prod_img").ToString()%>' Width="150px" OnClick="Image_Click" />
                    <br />
                    <br />
                    <%--<asp:ImageButton ID="Image3" runat="server" ImageUrl='<%#"~/image/" + DataBinder.Eval(Container.DataItem,"Prod_Image2").ToString()%>' Width="150px" OnClick="Image_Click"/>
                    <br /><br />
                    <asp:ImageButton ID="Image4" runat="server" ImageUrl='<%#"~/image/" + DataBinder.Eval(Container.DataItem,"Prod_Image3").ToString()%>' Width="150px" OnClick="Image_Click"/>--%>
                </td>
                <td style="width: 320px; margin-top: 0;">
                    <asp:Image ID="Image1" runat="server" ImageUrl='<%#"~/image/" + DataBinder.Eval(Container.DataItem,"prod_img").ToString()%>' Width="80%" /><br />
                </td>
                <td>
                    <br />
                    <br />
                    <asp:Label ID="Label1" runat="server" Text='<%# Eval("prod_name") %>' /><br />
                    RM<asp:Label ID="Label2" runat="server" Text='<%# Eval("prod_price","{0:0.00}") %>' />
                    <br />
                    <br />
                    <u><strong>Details</strong></u><br />
                    -<asp:Label ID="Label3" runat="server" Text='<%# Eval("prod_desc") %>' /><br />
                    <b>
                        <asp:Label Text="" runat="server" ID="Prod_stock" /></b><br />
                    <asp:DataList ID="DataList3" runat="server" DataSourceID="SqlDataSource4">
                        <ItemTemplate>
                            <asp:Label Text='<%# Eval("stock_count") %>' runat="server" ID="Prod_CountLabel" />
                            Stock Left<br />
                            <br />
                        </ItemTemplate>
                    </asp:DataList>
                    <asp:SqlDataSource runat="server" ID="SqlDataSource4" ConnectionString='<%$ ConnectionStrings:ConnectionString %>' SelectCommand="SELECT [stock_count] FROM [Product2] WHERE ([prod_id] = @prod_id)">
                        <SelectParameters>
                            <asp:QueryStringParameter QueryStringField="prod_id" Name="prod_id" Type="String"></asp:QueryStringParameter>

                        </SelectParameters>
                    </asp:SqlDataSource>
                    <br />
                    <br />
                    <asp:Label ID="prodCount" runat="server"></asp:Label><br />
                    Quantity : 
                     <div style="display: inline;">
                         <asp:ImageButton CssClass="btnMinus" ID="minus" runat="server" ImageUrl="~/image/minus_black.png" OnClick="minus_Click" onmouseover="this.src='/image/minus_white.png'" onmouseout="this.src='/image/minus_black.png'" />
                     </div>
                    <asp:TextBox ID="txtQty" runat="server" Width="3.5%" Style="padding-top: 1%; padding-left: 1%; padding-right: 1%;" Text="1"></asp:TextBox>

                    <div style="display: inline;">
                        <asp:ImageButton CssClass="btnAdd" Style="border: none;" ID="add" runat="server" ImageUrl="~/image/add_black.png" OnClick="add_Click" onmouseover="this.src='/image/add_white.png'" onmouseout="this.src='/image/add_black.png'" />
                    </div>
                    <br />
<%--                    <asp:Button ID="cartButton" runat="server" Text="Add to Cart" Style="border: 1.5px solid #333; font-size: 15px; font-family: 'Lucida Sans', 'Lucida Sans Regular', 'Lucida Grande', 'Lucida Sans Unicode', Geneva, Verdana, sans-serif;" class="btn addBtn" OnClick="cartButton_Click" />--%>
                    <asp:Button ID="wishButton" runat="server" CssClass="btn_wish" OnClick="wishButton_Click" />
                </td>
            </ItemTemplate>
        </asp:DataList>




        <%----rating---%>
       <%-- <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
            <ContentTemplate>
                <div style="margin-left: 10%; margin-right: 10%; padding-bottom: 2.5%;">
                    <h3>Rating</h3>
                    <hr />
                    <div class="star-rating">
                        <asp:HiddenField ID="hiddenStar" runat="server" Value="5" />
                        <asp:LinkButton ID="starButton1" CssClass="star1 fa fa-star checked" runat="server" Style="text-decoration: none;" OnClick="LinkButton1_Click"></asp:LinkButton>
                        <asp:LinkButton ID="starButton2" CssClass="star2 fa fa-star checked" runat="server" Style="text-decoration: none;" OnClick="LinkButton2_Click"></asp:LinkButton>
                        <asp:LinkButton ID="starButton3" CssClass="star3 fa fa-star checked" runat="server" Style="text-decoration: none;" OnClick="LinkButton3_Click"></asp:LinkButton>
                        <asp:LinkButton ID="starButton4" CssClass="star4 fa fa-star checked" runat="server" Style="text-decoration: none;" OnClick="LinkButton4_Click"></asp:LinkButton>
                        <asp:LinkButton ID="starButton5" CssClass="star5 fa fa-star checked" runat="server" Style="text-decoration: none;"></asp:LinkButton>
                    </div>
                    <textarea id="TextArea1" name="TextArea1" cols="150" rows="5"></textarea>
                    <asp:Button ID="commentButton" runat="server" Text="Comment" Style="float: right;" OnClick="commentButton_Click" />
                </div>

                <div style="margin-left: 10%; margin-right: 10%;">
                    <asp:Repeater ID="Repeater2" runat="server" DataSourceID="SqlDataSource3" OnItemDataBound="Repeater2_ItemDataBound">
                        <ItemTemplate>
                            <asp:Image ID="imageCust" CssClass="customerImage" runat="server" ImageUrl='<%# "~/image/" + DataBinder.Eval(Container.DataItem,"Cust_Image") %>' Style="float: left;" Width="10%" />
                            <div style="padding-left: 15%; padding-top: 4%; padding-bottom: 5%;">
                                Rated Star :
                                <asp:Label ID="starLabel" runat="server" Text='<%# Eval("Rate_Star") %>'></asp:Label>&emsp;
                                <asp:Label CssClass="fa fa-star" ID="star1" runat="server"></asp:Label>
                                <asp:Label CssClass="fa fa-star" ID="star2" runat="server"></asp:Label>
                                <asp:Label CssClass="fa fa-star" ID="star3" runat="server"></asp:Label>
                                <asp:Label CssClass="fa fa-star" ID="star4" runat="server"></asp:Label>
                                <asp:Label CssClass="fa fa-star" ID="star5" runat="server"></asp:Label>
                                <br />
                                <asp:Label ID="commentLabel" runat="server" Text='<%# Eval("Rate_Comment") %>'></asp:Label>
                            </div>
                            <hr />
                        </ItemTemplate>
                    </asp:Repeater>
                </div>
            </ContentTemplate>
        </asp:UpdatePanel>
    </div>
    <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString='<%$ ConnectionStrings:ProductListConnectionString %>' SelectCommand="SELECT * FROM [Rating] JOIN [Customer] ON [Customer].[cust_id] = [Rating].[cust_id] WHERE ([prod_id] = @prod_id)">
        <SelectParameters>
            <asp:QueryStringParameter QueryStringField="prod_id" Name="prod_id" Type="String"></asp:QueryStringParameter>
        </SelectParameters>
    </asp:SqlDataSource>--%>



   <%--  <asp:LinqDataSource ID="LinqDataSource1" runat="server" ContextTypeName="ProductListModule.ProductDataContext" EntityTypeName="" Select="new (prod_id, prod_name, prod_price, prod_desc, prod_img, prod_cat, stock_count, shipping_fee, created_at)" TableName="Product2s" Where="prod_id == @prod_id">
        <WhereParameters>
            <asp:QueryStringParameter Name="prod_id" QueryStringField="prod_id" Type="String" />
        </WhereParameters>
    </asp:LinqDataSource>
    <asp:DetailsView ID="DetailsView1" runat="server" Height="50px" Width="125px" DataSourceID="LinqDataSource1" OnDataBound="DetailsView1_DataBound"></asp:DetailsView>

     <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ProductListConnectionString %>" SelectCommand="SELECT * FROM [Product2] WHERE ([prod_id] = @prod_id)">
        <SelectParameters>
            <asp:QueryStringParameter Name="prod_id" QueryStringField="prod_id" Type="String" />
        </SelectParameters>
    </asp:SqlDataSource>
    <div class="container">
        <asp:Repeater ID="Repeater1" runat="server" DataSourceID="SqlDataSource1">
            <ItemTemplate>
                <td style="width: 320px; margin-top: 0;">
                    <asp:Image ID="Image1" runat="server" ImageUrl='<%#"~/image/" + DataBinder.Eval(Container.DataItem,"prod_img").ToString()%>' Width="50%" /><br />
                </td>
                <td>
                    <br />
                    <br />
                    <asp:Label ID="Label1" runat="server" Text='<%# Eval("prod_name") %>' /><br />
                    RM<asp:Label ID="Label2" runat="server" Text='<%# Eval("prod_price","{0:0.00}") %>' />
                    <br />
                    <br />
                    <u><strong>Details</strong></u><br />
                    -<asp:Label ID="Label3" runat="server" Text='<%# Eval("prod_desc") %>' /><br />
                    <b>
                        <asp:Label Text="" runat="server" ID="Prod_stock" /></b><br />
                    <asp:SqlDataSource ID="SqlDataSource2" runat="server"></asp:SqlDataSource>
                    <br />
                    <br />
                </td>
            </ItemTemplate>
        </asp:Repeater>
    </div>
    <div style="margin-top: 5%;">
        <asp:DataList ID="DataList1" runat="server" DataSourceID="SqlDataSource1">
            <ItemTemplate>
                <td style="width: 320px; margin-top: 0;">
                    <asp:Image ID="Image1" runat="server" ImageUrl='<%#"~/image/" + DataBinder.Eval(Container.DataItem,"prod_img").ToString()%>' Width="80%" /><br />
                </td>
                <td>
                    <br />
                    <br />
                    <asp:Label ID="Label1" runat="server" Text='<%# Eval("prod_name") %>' /><br />
                    RM<asp:Label ID="Label2" runat="server" Text='<%# Eval("prod_price","{0:0.00}") %>' />
                    <br />
                    <br />
                    <u><strong>Details</strong></u><br />
                    -<asp:Label ID="Label3" runat="server" Text='<%# Eval("prod_desc") %>' /><br />
                    <b>
                        <asp:Label Text="" runat="server" ID="Prod_stock" /></b><br />
                    <asp:SqlDataSource ID="SqlDataSource2" runat="server"></asp:SqlDataSource>
                    <br />
                    <br />
                </td>
            </ItemTemplate>
        </asp:DataList>--%>
    </div>
</asp:Content>


<%--
<asp:Label ID="prodCount" runat="server"></asp:Label><br />
                    Quantity : 
                     <div style="display:inline;">
                        <asp:ImageButton CssClass="btnMinus" ID="minus" runat="server" ImageUrl="~/image/minus_black.png" OnClick="minus_Click"  onmouseover="this.src='/image/minus_white.png'" onmouseout="this.src='/image/minus_black.png'"/>
                    </div>
                    <asp:TextBox ID="txtQty" runat="server" Width="3.5%"  style="padding-top:1%; padding-left:1%; padding-right:1%;" Text="1"></asp:TextBox>
               
                    <div style="display:inline;"><asp:ImageButton CssClass="btnAdd" style="border:none;" ID="add" runat="server" ImageUrl="~/image/add_black.png" OnClick="add_Click" onmouseover="this.src='/image/add_white.png'" onmouseout="this.src='/image/add_black.png'"/>
                    </div><br />
                     <asp:Button ID="cartButton" runat="server" Text="Add to Cart"  style="border: 1.5px solid #333;font-size:15px; font-family: 'Lucida Sans', 'Lucida Sans Regular', 'Lucida Grande', 'Lucida Sans Unicode', Geneva, Verdana, sans-serif;" class="btn addBtn" OnClick="cartButton_Click" />
                     <asp:Button ID="wishButton" runat="server" CssClass="btn_wish" OnClick="wishButton_Click"/>--%>