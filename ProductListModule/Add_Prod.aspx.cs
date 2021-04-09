using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace ProductListModule
{
    public partial class Add_Prod : System.Web.UI.Page
    {
        string conString = ConfigurationManager.ConnectionStrings["ProductListConnectionString"].ConnectionString;
        string b;
        //string strDate = DateTime.Now.ToString("yyyy-MM-dd");

        protected void Page_Load(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection(conString);
            //addProd_date.Text = strDate;
            string stmt = "SELECT COUNT(*) FROM Product2";

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

        protected void Button1_Click(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection(conString);

            addProd_img.SaveAs(Request.PhysicalApplicationPath + "./image/"+ addProd_img.FileName.ToString());
            b = "./image/" + addProd_img.FileName.ToString();

            string sql = "insert into Product2 (prod_id, prod_name, prod_price, prod_desc, prod_img, prod_cat, stock_count, shipping_fee, created_at)" +
                "values (@id, @name, @price, @desc, @img1, @cat, @count, @ship, @createAt)";
            con.Open();
            SqlCommand cmd = new SqlCommand(sql, con);

            cmd.Parameters.AddWithValue("@id", res_addProd_id.Text);
            cmd.Parameters.AddWithValue("@name", tbx_addProd_name.Text);
            cmd.Parameters.AddWithValue("@price", tbx_addProd_price.Text);
            cmd.Parameters.AddWithValue("@desc", tbx_addProd_desc.Value);
            cmd.Parameters.AddWithValue("@img1", b.ToString());
            cmd.Parameters.AddWithValue("@cat", DropDownList1.SelectedValue);
            cmd.Parameters.AddWithValue("@count", tbx_addProd_qty.Text);
            cmd.Parameters.AddWithValue("@ship", addProd_ship.Text);
            cmd.Parameters.AddWithValue("@createAt", DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss"));

            cmd.ExecuteNonQuery();
            Response.Write("<script> alert ('Produce has added successfully !'); </script>");
            con.Close();

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
            addProd_img.Attributes.Clear();
        }
    }
}