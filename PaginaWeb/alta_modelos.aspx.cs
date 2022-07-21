using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class alta_modelos : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void CustomValidator1_ServerValidate(object source, ServerValidateEventArgs args)
    {
        bool flag = true;
        string cadena = this.TextBox1.Text;
        string caracteres = "!·$%&/()=¿¡?'_:;,|@#€*+.";
        foreach (char c in caracteres)
        {
            if (cadena.Contains(c))
            {
                flag = false;
            }
        }
        args.IsValid = flag;
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        this.Label3.Text = "";
        if (this.IsValid)
        {
            this.SqlDataSourceModelo.InsertParameters["id_marca"].DefaultValue=this.DropDownList1.SelectedValue;
            this.SqlDataSourceModelo.InsertParameters["desc_modelo"].DefaultValue=this.TextBox1.Text;
            this.SqlDataSourceModelo.Insert();
            this.TextBox1.Text = "";
            this.Label3.Text = "Se agreg&oacute; un nuevo modelo con &eacute;xito";
        }
    }
}
