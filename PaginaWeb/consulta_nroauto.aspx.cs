using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

public partial class consulta_autos : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        this.ImagenDetalle.Visible = false;
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        if(this.IsValid){
            this.SqlDataAutos.SelectParameters["id"].DefaultValue = this.TextBox1.Text;
            this.SqlDataAutos.DataSourceMode = SqlDataSourceMode.DataReader;
            SqlDataReader registro = (SqlDataReader)this.SqlDataAutos.Select(DataSourceSelectArguments.Empty);
            if (registro.Read())
            {
                this.TextBox1.Text = "";
                this.ImagenDetalle.Visible = true;
                this.ImagenDetalle.ImageUrl = "cars/" + registro["archivo"].ToString();
                this.Label2.Text = "Nro de auto: "+registro["id_auto"]+ "</br>" +
                    "A&ntilde;o: " + registro["anio_auto"] + "</br>" +
                    "Marca: " + registro["desc_marca"] + "</br>" +
                    "Modelo: " + registro["desc_modelo"] + "</br>" +
                    "Pagina web: " + registro["web_auto"] + "</br>";
            }
            else {
                this.Label2.Text = "No exite auto nro"+this.TextBox1.Text;
            }

        }
    }
    protected void CustomValidator1_ServerValidate(object source, ServerValidateEventArgs args)
    {
        if (TextBox1.Text.All(char.IsDigit))
        {
            args.IsValid = true;
        }
        else {
            args.IsValid = false;
        }
    }
}
