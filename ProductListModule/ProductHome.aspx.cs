using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace ProductListModule
{
    public partial class ProductHome : System.Web.UI.Page
    {
        string conString = ConfigurationManager.ConnectionStrings["ProductListConnectionString"].ConnectionString;
        //string b;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                SqlConnection con = new SqlConnection(conString);
                //addProd_date.Text = strDate;
                string stmt = "SELECT COUNT(*) FROM Product2";

                //auto generate product ID
                try
                {
                    con.Open();
                    SqlCommand cmdCount = new SqlCommand(stmt, con);
                    int RecordCount = Convert.ToInt32(cmdCount.ExecuteScalar());

                    if (RecordCount < 10)
                        res_addProd_id.Text = "P100" + Convert.ToString(RecordCount);

                    else if (RecordCount < 100)
                        res_addProd_id.Text = "P10" + Convert.ToString(RecordCount);

                    else
                        res_addProd_id.Text = "P1" + Convert.ToString(RecordCount);

                    con.Close();

                }
                catch (Exception ex)
                {
                    res_addProd_id.Text = "Error in execution " + ex.ToString();
                }
            }

            
        }
        
        //Add Product
        protected void Button1_Click(object sender, EventArgs e)
        {
            RequiredFieldValidator4.Enabled = true;
            SqlConnection con = new SqlConnection(conString);

            string imageName = "";

            if (FileUpload1.HasFile)
            {
                imageName = FileUpload1.FileName.ToString();
                FileUpload1.PostedFile.SaveAs(Server.MapPath("~/image/") + imageName);

                string sql = "insert into Product2 (prod_id, prod_name, prod_price, prod_desc, prod_img, prod_cat, stock_count, shipping_fee, created_at, prod_status)" +
                "values (@id, @name, @price, @desc, @img1, @cat, @count, @ship, @createAt, @status)";
                con.Open();
                SqlCommand cmd = new SqlCommand(sql, con);

                cmd.Parameters.AddWithValue("@id", res_addProd_id.Text);
                cmd.Parameters.AddWithValue("@name", tbx_addProd_name.Text);
                cmd.Parameters.AddWithValue("@price", tbx_addProd_price.Text);
                cmd.Parameters.AddWithValue("@desc", tbx_addProd_desc.Value);
                cmd.Parameters.AddWithValue("@img1", imageName);
                cmd.Parameters.AddWithValue("@cat", DropDownList1.SelectedValue);
                cmd.Parameters.AddWithValue("@count", tbx_addProd_qty.Text);
                cmd.Parameters.AddWithValue("@ship", addProd_ship.Text);
                cmd.Parameters.AddWithValue("@createAt", DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss"));
                cmd.Parameters.AddWithValue("@status", "On Stock");

                cmd.ExecuteNonQuery();
                string success = "Product has added successfully !";
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('" + success + "')", true);
                con.Close();
                Response.Redirect("ProductHome.aspx", false);
            }
            else
            {
                string err = "An error occured";
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('" + err +"')", true);
            }

            //addProd_img.SaveAs(Request.PhysicalApplicationPath + "./image/" + addProd_img.FileName.ToString());
            //b = "./image/" + addProd_img.FileName.ToString();

            

            //con.Open();
            //SqlCommand cmd = con.CreateCommand();
            //cmd.CommandType = CommandType.Text;
            //cmd.CommandText = "insert into Product values('" + res_addProd_id.Text + "','" + tbx_addProd_name.Text+"', '"+tbx_addProd_price.Text+"', '"+ tbx_addProd_desc.Value+"', '"+b.ToString()+ "', '" + DropDownList1.SelectedValue + "', '" + tbx_addProd_qty.Text + "', '" + addProd_ship.Text + "', '" + addProd_date.Text + "')";
            //cmd.ExecuteNonQuery();
            //con.Close();
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            tbx_addProd_name.Text = "";
            tbx_addProd_price.Text = "";
            tbx_addProd_desc.Value = "";
            DropDownList1.SelectedIndex = 0;
            tbx_addProd_qty.Text = "";
            addProd_ship.Text = "";
            FileUpload1.Attributes.Clear();
        }

        protected void LinkButton1_Click(object sender, EventArgs e)
        {
            LinkButton button = (LinkButton)sender;
            Repeater item = (Repeater)button.NamingContainer;
            HiddenField idLabel = (HiddenField)item.FindControl("hidden");

            Response.Redirect("~/Product_Detail.aspx?prod_id=" + idLabel.Value.ToString());
        }

        protected void LinkButton2_Command(object sender, CommandEventArgs e)
        {
            int index = Convert.ToInt32(e.CommandArgument);

            ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop", "openModal();", true);

            SqlConnection con = new SqlConnection(conString);
            string str = "select cat_type from Category where cat_id = '" + (Repeater1.Items[index].FindControl("hdn_prod_cat") as HiddenField).Value + "'";
            string cat;

            con.Open();
            SqlCommand sqlCat = new SqlCommand(str, con);
            cat = Convert.ToString(sqlCat.ExecuteScalar());
            con.Close();

            edit_prodID.Text = (Repeater1.Items[index].FindControl("prod_id") as Label).Text;
            edit_prodName.Text = (Repeater1.Items[index].FindControl("prod_name") as Label).Text;
            edit_prodPrice.Text = (Repeater1.Items[index].FindControl("prod_price") as Label).Text;
            edit_prodDesc.Value = (Repeater1.Items[index].FindControl("prod_desc") as Label).Text;
            edit_prodImg1.Src = (Repeater1.Items[index].FindControl("prod_img") as Image).ImageUrl;
            //edit_prodCat.Text = (Repeater1.Items[index].FindControl("prod_cat") as Label).Text; ;
            edit_stockCount.Text = (Repeater1.Items[index].FindControl("stock_count") as Label).Text;
            edit_shippingFee.Text = (Repeater1.Items[index].FindControl("shipping_fee") as Label).Text;

            edit_prodCat.Text = cat;
        }

        protected void Edit_Btn_Click(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection(conString);

            string img1Name;

            if (FileUpload2.HasFile)
            {
                img1Name = FileUpload2.FileName.ToString();
                FileUpload2.PostedFile.SaveAs(Server.MapPath("~/image/") + img1Name);
            }
            else
            {
                img1Name = edit_prodImg1.Src;
                img1Name = img1Name.Remove(0, 8);
            }

            SqlDataAdapter adapter = new SqlDataAdapter();
            string sql = "UPDATE Product2 SET prod_name = '" + edit_prodName.Text + "', prod_price = '" + edit_prodPrice.Text + "', prod_desc = '" + edit_prodDesc.Value +
                "', prod_img = '" + img1Name + "', stock_count = '" + edit_stockCount.Text + "', shipping_fee = '" + edit_shippingFee.Text + "', updated_at = '" + DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss") +
                "' WHERE prod_id = '"+ edit_prodID.Text +"'";

            con.Open();
            SqlCommand cmd1 = new SqlCommand(sql, con);
            adapter.UpdateCommand = cmd1;
            cmd1.ExecuteNonQuery();
            con.Close();

            Response.Redirect("ProductHome.aspx", false);
        }

        //protected void BtnDel_Click(object sender, EventArgs e)
        //{
        //    SqlConnection con = new SqlConnection(conString);
        //    SqlDataAdapter adapter = new SqlDataAdapter();
        //    string sql = "DELETE FROM Product2 WHERE prod_id = '"+ edit_prodID.Text +"'";

        //    con.Open();
        //    SqlCommand cmd = new SqlCommand(sql, con);
        //    adapter.DeleteCommand = cmd;
        //    cmd.ExecuteNonQuery();
        //    con.Close();
            
        //    Response.Redirect("ProductHome.aspx", false);
        //}

    }
}