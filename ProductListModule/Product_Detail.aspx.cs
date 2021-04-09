using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;

namespace ProductListModule
{
    public partial class Product_Detail : System.Web.UI.Page
    {
        string conString = ConfigurationManager.ConnectionStrings["ProductListConnectionString"].ConnectionString;
        public static bool wish;
        public static int count, time = 0, stockleft;

        protected void Page_Load(object sender, EventArgs e)
        {
            Session["ReturnURL"] = "Product_Detail.aspx?prod_id=" + Request.QueryString["prod_id"];
        }
        
        protected void wishButton_Click(object sender, EventArgs e)
        {
            Button wishBtn = null;

            foreach (DataListItem item in DataList1.Items)
            {
                wishBtn = item.FindControl("wishButton") as Button;
            }

            SqlConnection conn = new SqlConnection(conString);
            string wish_id = "";
            string prod_id = Request.QueryString["prod_id"].ToString();
            wish_id = Request.Cookies["wish_id"].Value;
            conn.Open();

            if(wish == false)
            {
                SqlCommand cmd = new SqlCommand("INSERT INTO Wishlist_list (wish_id, prod_id) VALUES (@wish_id, @prod_id)", conn);
                cmd.Parameters.Add("@wish_id", SqlDbType.VarChar).Value = wish_id;
                cmd.Parameters.Add("@prod_id", SqlDbType.VarChar).Value = prod_id;

                cmd.Connection = conn;

                int result = Convert.ToInt32(cmd.ExecuteNonQuery());
                if(result == 1)
                {
                    Response.Write("<script language=javascript>alert('The item had been added to wishlist.')</script>");
                }
                wish = true;

                wishBtn.CssClass = "changewish";
            }
            else if (wish == true)
            {
                SqlCommand cmd = new SqlCommand(@"Delete from Wishlist_list Where prod_id=@prod_id and wish_id=@wish_id", conn);
                cmd.Parameters.Add("@prod_id", SqlDbType.VarChar).Value = prod_id;
                cmd.Parameters.Add("@wish_id", SqlDbType.VarChar).Value = wish_id;
                wishBtn.CssClass = "btn_wish";
                wish = false;
                int result = Convert.ToInt32(cmd.ExecuteNonQuery());
            }
            conn.Close();

        }

        protected void Image_Click(object sender, ImageClickEventArgs e)
        {
            ImageButton imageButton = sender as ImageButton;
            if (!imageButton.ImageUrl.Equals("~/image/white.jpg"))
            {
                foreach (DataListItem item in DataList1.Items)
                {
                    Image image = (Image)item.FindControl("Image1");
                    image.ImageUrl = imageButton.ImageUrl;
                }
            }
        }

        protected void minus_Click(object sender, ImageClickEventArgs e)
        {
            foreach (DataListItem item in DataList1.Items)
            {
                TextBox textBox = (TextBox)item.FindControl("txtQty");
                int quantity = Int32.Parse(textBox.Text);
                if (quantity > 0)
                    textBox.Text = (quantity - 1).ToString();
            }
        }

        protected void DataList1_ItemDataBound(object sender, DataListItemEventArgs e)
        {
            Button wishB = null;
            string wish_id = "";
            string prod_id = Request.QueryString["prod_id"].ToString();
            int stockcount = 0;
            Label stock_count = (Label)e.Item.FindControl("stock_count");
            //Label stock_count = e.Item.FindControl("stock_count") as Label;

            SqlConnection conn = new SqlConnection(conString);

            if(Request.Cookies["wish_id"] != null)
            {
            wish_id = Request.Cookies["wish_id"].Value;
            wishB = e.Item.FindControl("wishButton") as Button;

            //change wishlist icon
            SqlCommand selectCon = new SqlCommand("SELECT wish_id, prod_id from Wishlist_list where wish_id=@wish_id and prod_id=@prod_id", conn);
            selectCon.Parameters.Add("@wishid", SqlDbType.NVarChar).Value = wish_id;
            selectCon.Parameters.Add("@prod_ID", SqlDbType.NVarChar).Value = prod_id;

            conn.Open();
            SqlDataReader dr = selectCon.ExecuteReader();

            while (dr.Read())
            {
                string prod = dr["prod_id"].ToString();
                wishB.CssClass = "changewish";
                wish = true;

            }
            conn.Close();
            }

            SqlCommand addStock = new SqlCommand("SELECT stock_count from Product2 where prod_id=@prod_id", conn);
            addStock.Parameters.Add("@prod_id", SqlDbType.VarChar).Value = prod_id;
            conn.Open();
            SqlDataReader dr1 = addStock.ExecuteReader();

            while (dr1.Read())
            {
                string stockC = dr1["stock_count"].ToString();
                stockcount = Convert.ToInt32(stockC);
                if (stockcount == 0)
                {
                    //stock_count.Text = "Out of Stock";
                }
                else
                {
                    //stock_count.Text = "On Stock";
                }
            }
            conn.Close();
        }

        protected void add_Click(object sender, ImageClickEventArgs e)
        {
            foreach (DataListItem item in DataList1.Items)
            {
                TextBox textBox = (TextBox)item.FindControl("txtQty");
                int quantity = Int32.Parse(textBox.Text);
                if (quantity < stockleft)
                {
                    textBox.Text = (quantity + 1).ToString();
                }
            }
        }

        protected void Repeater2_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            int counter;
            Label label = (Label)e.Item.FindControl("starLabel");
            for (counter = 1; Int32.Parse(label.Text) >= counter; counter++)
            {
                string starLabel = "star" + counter.ToString();
                Label star = (Label)e.Item.FindControl(starLabel);
                star.CssClass = "fa fa-star checked";
            }
            for (; 5 >= counter; counter++)
            {
                string starLabel = "star" + counter.ToString();
                Label star = (Label)e.Item.FindControl(starLabel);
                star.CssClass = "fa fa-star not-checked";
            }

        }

        //protected void commentButton_Click(object sender, EventArgs e)
        //{
        //    string rate_id = null, comment = null;
        //    int rateValue = Int32.Parse(hiddenStar.Value);

        //    if (Request["TextArea1"] != null)
        //    {
        //        comment = Request["TextArea1"];
        //    }

        //    using (System.Data.SqlClient.SqlConnection con = new System.Data.SqlClient.SqlConnection(conString))
        //    {
        //        string stmt = "SELECT COUNT(*) FROM Rating";

        //        con.Open();
        //        SqlCommand cmdCount = new SqlCommand(stmt, con);
        //        int RecordCount = Convert.ToInt32(cmdCount.ExecuteScalar());

        //        if (RecordCount < 10)
        //        {
        //            rate_id = "E100" + Convert.ToString(RecordCount);
        //        }
        //        else if(RecordCount < 100)
        //        {
        //            rate_id = "E10" + Convert.ToString(RecordCount);
        //        }
        //        else
        //            rate_id = "E1" + Convert.ToString(RecordCount);

        //        string cust_id = null;
        //        string cust = Request.Cookies["customerName"].Value;
        //        SqlCommand cmdID = new SqlCommand("SELECT cust_id FROM Customer WHERE cust_userNm = @CustomerName", con);
        //        cmdID.Parameters.Add("@CustomerName", SqlDbType.VarChar).Value = cust;

        //        SqlDataReader dr = cmdID.ExecuteReader();
        //        while (dr.Read())
        //        {
        //            cust_id = dr["cust_id"].ToString();
        //        }

        //        SqlCommand comInsert = new SqlCommand("INSERT INTO Rating(rate_id,prod_id,rate_comment,rate_star,cust_id) VALUES(@RatingID,@ProductID,@RatingComment,@Rating,@CustomerID)", con);
        //        SqlDataAdapter adapter = new SqlDataAdapter();

        //        comInsert.Parameters.Add("@ProductID", SqlDbType.VarChar).Value = Request.QueryString["prod_id"].ToString();
        //        comInsert.Parameters.Add("@RatingID", SqlDbType.VarChar).Value = rate_id;
        //        comInsert.Parameters.Add("@RatingComment", SqlDbType.VarChar).Value = comment;
        //        comInsert.Parameters.Add("@CustomerID", SqlDbType.VarChar).Value = cust_id;
        //        comInsert.Parameters.Add("@Rating", SqlDbType.VarChar).Value = rateValue;

        //        comInsert.ExecuteNonQuery();
        //    }
        //    Repeater2.DataBind();
        //}

        //protected void LinkButton1_Click(object sender, EventArgs e)
        //{
        //    starButton2.CssClass = "star2 fa fa-star not-checked";
        //    starButton3.CssClass = "star3 fa fa-star not-checked";
        //    starButton4.CssClass = "star4 fa fa-star not-checked";
        //    starButton5.CssClass = "star5 fa fa-star not-checked";
        //    hiddenStar.Value = "1";
        //}

        //protected void LinkButton2_Click(object sender, EventArgs e)
        //{
        //    starButton3.CssClass = "star3 fa fa-star not-checked";
        //    starButton4.CssClass = "star4 fa fa-star not-checked";
        //    starButton5.CssClass = "star5 fa fa-star not-checked";
        //    hiddenStar.Value = "2";
        //}

        //protected void LinkButton3_Click(object sender, EventArgs e)
        //{
        //    starButton4.CssClass = "star4 fa fa-star not-checked";
        //    starButton5.CssClass = "star5 fa fa-star not-checked";
        //    hiddenStar.Value = "3";
        //}

        //protected void LinkButton4_Click(object sender, EventArgs e)
        //{
        //    starButton5.CssClass = "star5 fa fa-star not-checked";
        //    hiddenStar.Value = "4";
        //}

    }
}