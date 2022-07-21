using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

public partial class alta_alquiler : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void CustomValidator1_ServerValidate(object source, ServerValidateEventArgs args)
    {
        string txt_ingresado = this.TextBox1.Text;
        if (txt_ingresado.All(char.IsDigit))
            //All recorre cada uno de los caracteres del string, y al usar IsDigit,
            //verifica que cada uno de ellos sea o no un digito numerico; 
            //si IsDigit verifica un caracter y este resulta no ser 
            //numerico, retorna false.
            {
                args.IsValid = true;
            }
            else
            {
                args.IsValid = false;//alguno de los caracteres no es numerico
            }
        
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        this.Label2.Text = "";
        if(this.IsValid)
        {
            this.SqlDataSourceAutos.SelectParameters["id_auto"].DefaultValue = this.TextBox1.Text;
            this.SqlDataSourceAutos.DataSourceMode = SqlDataSourceMode.DataReader;
            SqlDataReader datos = (SqlDataReader)this.SqlDataSourceAutos.Select(DataSourceSelectArguments.Empty);
            if (datos.Read()) { 
                this.SqlDataSourceAlquileres.InsertParameters["id_auto"].DefaultValue = this.TextBox1.Text;
                string fecha = DateTime.Now.Date.ToString("d");
                this.SqlDataSourceAlquileres.InsertParameters["fecha_alquiler"].DefaultValue = fecha;
                this.SqlDataSourceAlquileres.Insert();
                this.Label2.ForeColor = System.Drawing.Color.Green;
                this.Label2.Text = "El alquiler a sido regitrado con &eacute;xito";
                this.TextBox1.Text = "";
            }
            else
            {
                this.Label2.ForeColor = System.Drawing.Color.Red;
                this.Label2.Text = "El nro de auto ingresado no existe";
            }
        }
    }
}
