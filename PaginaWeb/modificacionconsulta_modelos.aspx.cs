using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class modificacionconsulta_modelos : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        this.SqlDataSource1.DeleteParameters["id_modelo"].DefaultValue = this.Label3.Text;
        try
        {
            int c = this.SqlDataSource1.Delete();
            if (c == 1)
            {
                this.Label5.ForeColor = System.Drawing.Color.Green;
                this.Label5.Text = "Se elimino con &eacute;xito el registro";
            }
        }
        catch
        {
            this.Label5.ForeColor = System.Drawing.Color.Red;
            this.Label5.Text = "No se pudo eliminar regitro, presente en AUTOS";
        }
    }
    protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
    {
        this.Label3.Text = this.GridView1.Rows[this.GridView1.SelectedIndex].Cells[1].Text;
        this.Label4.Text = this.GridView1.Rows[this.GridView1.SelectedIndex].Cells[2].Text;
        this.Button1.Enabled = true;
        this.Label5.Text = "";
    }
}
