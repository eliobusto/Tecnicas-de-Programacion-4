using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

public partial class consultaautos_pormarca : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        this.SqlDataSourceAutos.SelectParameters["marca"].DefaultValue = this.DropDownList1.SelectedValue;
        this.SqlDataSourceAutos.DataSourceMode = SqlDataSourceMode.DataReader;
        SqlDataReader registros = (SqlDataReader)this.SqlDataSourceAutos.Select(DataSourceSelectArguments.Empty);
        this.Label2.Text = "";
        while(registros.Read()==true){
            this.Label2.Text = this.Label2.Text + "Auto nro:" + registros["id_auto"] + "<br>" + "<img width='300px' src=\"cars/" + registros["archivo"] + "\"><br><br>";
        }
    }
}
