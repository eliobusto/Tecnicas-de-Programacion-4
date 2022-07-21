using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class alta_marca : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        
    }
    protected void CustomValidator1_ServerValidate(object source, ServerValidateEventArgs args)
    {
        bool flag = true;
        string cadena = this.TextBox1.Text;
        string caracteres = "!·$%&/()=¿¡?'_:;,|@#€*+.0123456789";
        foreach(char c in caracteres){
            if(cadena.Contains(c)){
                flag = false;
            }    
        }
        args.IsValid = flag;
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        this.Label2.Text = "";
        if (this.IsValid)
        {
            this.SqlDataSource1.InsertParameters["desc_marca"].DefaultValue = this.TextBox1.Text;
            this.SqlDataSource1.Insert();
            this.TextBox1.Text = "";
            this.Label2.Text = "Se agreg&oacute; una nueva marca con &eacute;xito";
        }
    }
}
