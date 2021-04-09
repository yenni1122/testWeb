using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ProductListModule
{
    public partial class Classify : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Control ctlClassify;

            if(Request.QueryString["catID"] != null)
            {
                ctlClassify = LoadControl("CategoryControl.ascx");
                Session["ReturnURL"] = ("Classify.aspx?catID=" + Request.QueryString["catID"]);
                Session.Timeout = 300;
            }
            else if (Request.QueryString["keyword"] != null)
            {
                ctlClassify = LoadControl("SearchControl.ascx");
                Session["ReturnURL"] = ("Classify.aspx?keyword=" + Request.QueryString["keyword"]);
                Session.Timeout = 300;
            }
            else
            {
                ctlClassify = LoadControl("ProductControl.ascx");
                Session["ReturnURL"] = "Classify.aspx";
                Session.Timeout = 300;
            }
            phdChange.Controls.Add(ctlClassify);
        }
    }
}