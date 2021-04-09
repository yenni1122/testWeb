using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ProductListModule
{
    public partial class ProductControl : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void sortButton_Click(object sender, EventArgs e)
        {
            LinkButton button = (LinkButton)sender;
            RepeaterItem repeater = (RepeaterItem)button.NamingContainer;
            HiddenField sortID = (HiddenField)repeater.FindControl("sortIDHidden");

            Response.Redirect("~/Classify.aspx?catID=" + sortID.Value.ToString());
        }

        protected void LinkButton1_Click(object sender, EventArgs e)
        {
            LinkButton button = (LinkButton)sender;
            DataListItem item = (DataListItem)button.NamingContainer;
            HiddenField idLabel = (HiddenField)item.FindControl("hidden");
            Label catLabel = (Label)item.FindControl("hiddenID");

            Session["prod_cat"] = catLabel.Text;
            Response.Redirect("~/Product_Detail.aspx?prod_id=" + idLabel.Value.ToString());
        }

        protected void btnCostumeShow_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Classify.aspx?keyword=%" + txtKeyword.Text.ToString() + "%");
        }
    }
}