using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;

public partial class alta_autos : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        
    }
    protected void CustomValidator1_ServerValidate(object source, ServerValidateEventArgs args)
    {
        string txt_ingresado= this.TextBox1.Text;
        if (txt_ingresado.Length == 4)//se ingresadon 4 caracteres?
        {
            if(txt_ingresado.All(char.IsDigit))
                //All recorre cada uno de los caracteres del string, y al usar IsDigit,
                //verifica que cada uno de ellos sea o no un digito numerico; 
                //si IsDigit verifica un caracter y este resulta no ser 
                //numerico, retorna false.
            {
                int anio_actual = DateTime.Today.Year; //anio de la fecha del servidor
                int anio_ingresado= int.Parse(txt_ingresado);
                if(anio_ingresado<=anio_actual && anio_ingresado>=2000)
                {
                    args.IsValid = true;
                }
                else 
                {
                    args.IsValid = false;//la fecha esta fuera de los parametros
                }
            }
            else 
            {
                args.IsValid = false;//alguno de los caracteres no es numerico
            }
        }
        else {
            args.IsValid = false;//no se ingresaron 4 caracteres
        }
    }


    protected void CustomValidator2_ServerValidate(object source, ServerValidateEventArgs args)
    {
        if (File.Exists(this.Server.MapPath(".") + "/cars/" + this.FileUpload1.FileName))
        {
            args.IsValid = false;
        }
        else {
            args.IsValid = true;
        }
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        if(this.IsValid){
            this.FileUpload1.SaveAs(Server.MapPath(".") + "/cars/" + this.FileUpload1.FileName);
            this.SqlDataAutos.InsertParameters["anio"].DefaultValue = this.TextBox1.Text;
            this.SqlDataAutos.InsertParameters["marca"].DefaultValue = this.DropDownList1.SelectedValue;
            this.SqlDataAutos.InsertParameters["modelo"].DefaultValue = this.DropDownList2.SelectedValue;
            this.SqlDataAutos.InsertParameters["web"].DefaultValue = this.TextBox2.Text;
            this.SqlDataAutos.InsertParameters["archivo"].DefaultValue = this.FileUpload1.FileName;
            this.SqlDataAutos.Insert();
            this.Label6.Text = "Alta completada!";
            this.TextBox1.Text = "";
            this.TextBox2.Text = "";
        }
    }
}
