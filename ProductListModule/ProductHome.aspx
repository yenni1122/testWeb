<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="ProductHome.aspx.cs" Inherits="ProductListModule.ProductHome" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
    <asp:LinqDataSource ID="dsProduct" runat="server" ContextTypeName="ProductListModule.ProductDataContext" EntityTypeName="" TableName="Product2s"></asp:LinqDataSource>
    <button type="button" id="addBtn" runat="server" data-toggle="modal" data-target="#modal_addProduct">Add Product</button>

    <!--display product-->

    <div style="padding-top:50px;">
        <h2>All Products</h2>
        <%--<asp:repeater ID="rptrProducts" runat="server" DataSourceID="SqlDataSource2">
           <ItemTemplate>
        <div class="col-sm-3 col-md-3">
            <a href="Product_Detail.aspx?prod_id=<%# Eval("prod_id") %>" style="text-decoration:none;">
          <div class="thumbnail">              
              <img src="image/<%# Eval("prod_img") %>"/>
              <div class="caption"> 
                   <div class="probrand"><%# Eval ("prod_name") %>  </div>
                   <div class="proName"> <%# Eval ("prod_desc") %> </div>
                   <div class="proPrice">  <%# Eval ("prod_price") %> </div> 
                   
              </div>
          </div>
                </a>
        </div>
               
               </ItemTemplate>
       </asp:repeater>--%>

        <table>
            <asp:Repeater ID="Repeater1" runat="server" DataSourceID="SqlDataSource2">
                <ItemTemplate>
                    <tr>
                        <td style="width: 25%;">
                            <asp:Image ID="prod_img" runat="server" CssClass="image1" Height="124px" Width="116px" ImageUrl='<%#"./image/" + DataBinder.Eval(Container.DataItem,"prod_img").ToString() %>' />
                        </td>
                        <asp:HiddenField ID="hdn_prod_cat" runat="server" Value='<%#DataBinder.Eval(Container.DataItem,"prod_cat") %>' />

                        <td style="width: 40%;">
                            <table style="width: 100%;">
                                <tr>
                                    <td style="border: none; width: 30%; vertical-align: top;">Product ID</td>
                                    <td style="border: none; width: 5%; vertical-align: top;">:</td>
                                    <td style="border: none; vertical-align: top;">
                                        <asp:Label ID="prod_id" runat="server" Text='<%#DataBinder.Eval(Container.DataItem,"prod_id") %>'></asp:Label></td>
                                </tr>
                                <tr>
                                    <td style="border: none; width: 30%; vertical-align: top;">Name</td>
                                    <td style="border: none; width: 5%; vertical-align: top;">:</td>
                                    <td style="border: none; vertical-align: top;">
                                        <asp:Label ID="prod_name" runat="server" Text='<%#DataBinder.Eval(Container.DataItem,"prod_name") %>'></asp:Label></td>
                                </tr>
                                <tr>
                                    <td style="border: none; width: 30%; vertical-align: top;">Description</td>
                                    <td style="border: none; width: 5%; vertical-align: top;">:</td>
                                    <td style="border: none; vertical-align: top;">
                                        <asp:Label ID="prod_desc" runat="server" Text='<%#DataBinder.Eval(Container.DataItem,"prod_desc") %>'></asp:Label></td>
                                </tr>
                                <tr>
                                    <td style="border: none; width: 30%; vertical-align: top;">Price</td>
                                    <td style="border: none; width: 5%; vertical-align: top;">:</td>
                                    <td style="border: none; vertical-align: top;">RM
                                        <asp:Label ID="prod_price" runat="server" Text='<%#DataBinder.Eval(Container.DataItem,"prod_price","{0:0.00}") %>'></asp:Label></td>
                                </tr>
                                <tr style="display: none;">
                                    <td style="border: none; width: 30%; vertical-align: top;">Stock Available</td>
                                    <td style="border: none; width: 5%; vertical-align: top;">:</td>
                                    <td style="border: none; vertical-align: top;">RM
                                        <asp:Label ID="stock_count" runat="server" Text='<%#DataBinder.Eval(Container.DataItem,"stock_count") %>'></asp:Label></td>
                                </tr>
                                <tr style="display: none;">
                                    <td style="border: none; width: 30%; vertical-align: top;">Price</td>
                                    <td style="border: none; width: 5%; vertical-align: top;">:</td>
                                    <td style="border: none; vertical-align: top;">RM
                                        <asp:Label ID="shipping_fee" runat="server" Text='<%#DataBinder.Eval(Container.DataItem,"shipping_fee","{0:0.00}") %>'></asp:Label></td>
                                </tr>
                            </table>
                        </td>

                        <%--<td class="middle" style="width: 15%;">
                            <asp:Repeater ID="Repeater2" runat="server" DataSourceID="SqlDataSource2">
                                <ItemTemplate>
                                    <asp:Label ID="Label14" runat="server" Text='<%#DataBinder.Eval(Container.DataItem,"stock_count") %>'></asp:Label><br />
                                </ItemTemplate>
                            </asp:Repeater>
                        </td>--%>
                        <%--
                        <td class="middle" style="width: 15%;">
                            <%#DataBinder.Eval(Container.DataItem,"Prod_Status") %><br />
                        </td>--%>

                        <td class="middle" style="width: 5%; padding-left: 1%;">
                            <asp:LinkButton ID="LinkButton2" Text="Edit"
                                runat="server" ToolTip="Edit" CausesValidation="false" CommandArgument='<%#Container.ItemIndex%>' OnCommand="LinkButton2_Command">
                            </asp:LinkButton>

<%--                            <asp:Button CssClass="btn-default" OnClick="BtnDel_Click" CausesValidation="false" ID="BtnDel" runat="server" Text="Delete" />--%>
                        </td>
                    </tr>
                </ItemTemplate>
            </asp:Repeater>
        </table>

        <%--<asp:DataList ID="DataList1" runat="server" DataSourceID="SqlDataSource2" CellPadding="4" ForeColor="#333333" RepeatColumns="4" RepeatDirection="Horizontal">
            <AlternatingItemStyle BackColor="White" ForeColor="#284775"></AlternatingItemStyle>

            <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White"></FooterStyle>

            <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White"></HeaderStyle>

            <ItemStyle BackColor="#F7F6F3" ForeColor="#333333"></ItemStyle>
            <ItemTemplate>
                <asp:Label ID="hiddenID" runat="server" Text='<%# Eval("prod_cat") %>' Visible="false" />
                <div style="text-align: center; margin: 5%;">
                    <asp:HiddenField ID="hidden" runat="server" Value='<%# Eval("prod_id") %>' />
                    <asp:Image ID="Image1" runat="server" ImageUrl='<%#"~/image/" + DataBinder.Eval(Container.DataItem,"prod_img").ToString()%>' Width="50%" /><br />
                    <asp:LinkButton ID="LinkButton1" runat="server" OnClick="LinkButton1_Click" Text='<%#DataBinder.Eval(Container.DataItem,"prod_name") %>'>
                    </asp:LinkButton><br />
                    RM 
                <asp:Label Text='<%# Eval("Prod_Price","{0:0.00}") %>' runat="server" ID="Prod_PriceLabel" /><br />
                    <br />
                </div>
            </ItemTemplate>
            <SelectedItemStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333"></SelectedItemStyle>
        </asp:DataList>--%>

        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ProductListConnectionString %>" SelectCommand="SELECT * FROM [Product2]"></asp:SqlDataSource>

    </div>


    <!--Add Product -->
    <div class="container">
        <!-- Modal -->
        <div class="modal fade" id="modal_addProduct" role="dialog">
            <div class="modal-dialog" style="width: 77%;">

                <!-- Modal content-->
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                        <h4 class="modal-title">Add Product</h4>
                    </div>

                    <div id="form1" class="modal-body">
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
                                    <asp:FileUpload ID="FileUpload1" runat="server" onchange="realURL1(this)" /></td>
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
                                <th style="vertical-align: top;">
                                    <asp:Label ID="Label8" runat="server" Text="Shipping Fee"></asp:Label>

                                </th>
                                <td style="padding-bottom: 10px; padding-left: 10px;">
                                    <asp:TextBox ID="addProd_ship" runat="server"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" ValidationGroup="add" ControlToValidate="addProd_ship" runat="server" ErrorMessage="Please enter shipping price" ForeColor="Red"></asp:RequiredFieldValidator>
                                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="addProd_ship" ValidationExpression="^\d{0,8}(\.\d{1,4})?$" ErrorMessage="Invalid input"></asp:RegularExpressionValidator>
                                </td>
                            </tr>
                        </table>
                    </div>
                    <div class="modal-footer" style="clear: both;">
                        <asp:Button OnClick="Button2_Click" ID="Button2" CssClass="btn btn-default" UseSubmitBehavior="false" data-dismiss="modal" runat="server" Text="Cancel" />
                        <asp:Button OnClick="Button1_Click" ID="Button1" CssClass="btn btn-default" runat="server" Text="Submit" />
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- edit product -->
    <div class="container">
        <!--Modal-->
        <div class="modal fade" id="modal_editProduct" role="dialog">
            <!-- modal content -->
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                    <h4 class="modal-title">Edit Product</h4>
                </div>
                <div class="modal-dialog" style="width: 80%;">
                    <table>
                        <tr>
                            <th style="vertical-align: top;">
                                <asp:Label ID="Label9" runat="server" Text="Product ID"></asp:Label>
                            </th>
                            <td style="padding-bottom: 10px; padding-left: 10px;">
                                <asp:Label ID="edit_prodID" runat="server"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <th style="vertical-align: top;">
                                <asp:Label ID="Label10" runat="server" Text="Name"></asp:Label>
                            </th>
                            <td style="padding-bottom: 10px; padding-left: 10px;">
                                <asp:TextBox ID="edit_prodName" runat="server"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <th style="vertical-align: top;">
                                <asp:Label ID="Label11" runat="server" Text="Price"></asp:Label>

                            </th>
                            <td style="padding-bottom: 10px; padding-left: 10px;">
                                <asp:TextBox ID="edit_prodPrice" runat="server"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <th style="vertical-align: top;">
                                <asp:Label ID="Label12" runat="server" Text="Description"></asp:Label>

                            </th>
                            <td style="padding-bottom: 10px; padding-left: 10px;">
                                <textarea id="edit_prodDesc" runat="server" cols="30" rows="5"></textarea>
                            </td>
                        </tr>
                        <tr>
                            <th style="vertical-align: top;">
                                <asp:Label ID="Label13" runat="server" Text="Image"></asp:Label>
                            </th>
                            <td style="padding-bottom: 10px; padding-left: 10px;">
                                <asp:FileUpload ID="FileUpload2" runat="server" onchange="readURL4(this)" />
                            </td>
                        </tr>
                        <tr>
                            <th style="vertical-align: top;">
                                <asp:Label ID="Label15" runat="server" Text="Category"></asp:Label>
                            </th>
                            <td style="padding-bottom: 10px; padding-left: 10px;">
                                <asp:Label ID="edit_prodCat" runat="server"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <th style="vertical-align: top;">
                                <asp:Label ID="Label16" runat="server" Text="Quantity"></asp:Label>
                            </th>
                            <td style="padding-bottom: 10px; padding-left: 10px;">
                                <asp:TextBox ID="edit_stockCount" runat="server"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <th style="vertical-align: top;">
                                <asp:Label ID="Label17" runat="server" Text="Shipping Fee"></asp:Label>
                            </th>
                            <td style="padding-bottom: 10px; padding-left: 10px;">
                                <asp:Label ID="edit_shippingFee" runat="server"></asp:Label>
                            </td>
                        </tr>
                    </table>

                    <table style="width: 35%; float: left;">
                        <tr>
                            <td>Image 1:</td>
                            <td style="padding-left: 2%;">Image 2:</td>
                        </tr>
                        <tr>
                            <td style="padding-bottom: 2%;">
                                <div id="hdn_img1">
                                    <img id="edit_prodImg1" src="#" alt="Preview" height="300" width="225" runat="server" />
                                </div>
                                <img id="edit_preview_img1" alt="Preview" height="300" width="225" src="#" style="display: none" />
                            </td>
                        </tr>
                    </table>

                </div>
                <div class="modal-footer" style="height: 80px; clear: both">
                    <asp:Button ID="Button3" CssClass="btn btn-default" runat="server" UseSubmitBehavior="false" Text="Cancel" />
                    <asp:Button ID="Edit_Btn" OnClick="Edit_Btn_Click" runat="server" Text="Edit" CssClass="btn btn-default" CausesValidation="False" />
                </div>
            </div>
        </div>
    </div>

    <script>



        function openModal() {
            $('#modal_editProduct').modal('show');
        }

        function showEdit() {
            document.getElementById("btnEdit").hidden = false;
        }

        function readURL1(input) {
            if (input.files && input.files[0]) {
                var reader = new FileReader();

                reader.onload = function (e) {
                    $('#Image1').attr('src', e.target.result);
                }

                reader.readAsDataURL(input.files[0]);
            }
        }
    </script>
</asp:Content>
