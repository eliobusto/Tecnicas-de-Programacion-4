using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.IO;

public partial class modificacion_autos : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
       
    }

    protected void CustomValidator1_ServerValidate(object source, ServerValidateEventArgs args)
    {
        if (this.TextBox1.Text.All(char.IsDigit))
        {
            args.IsValid = true;
        }
        else {
            args.IsValid = false;
        }
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        this.Label7.Text = "";
        this.Label8.Text = "";
        
        this.SqlDatosAutos.SelectParameters["id_auto"].DefaultValue=this.TextBox1.Text;
        this.SqlDatosAutos.DataSourceMode = SqlDataSourceMode.DataReader;
        SqlDataReader registro = (SqlDataReader)this.SqlDatosAutos.Select(DataSourceSelectArguments.Empty);
        if(registro.Read()){
            this.TextBox2.Text=registro["anio_auto"].ToString();
            this.DropDownList1.SelectedValue = registro["id_marca"].ToString();
            this.DropDownList2.SelectedValue = registro["id_modelo"].ToString();
            this.TextBox3.Text = registro["web_auto"].ToString();
            this.Image.Visible = true;
            this.Image.AlternateText= registro["archivo"].ToString();
            this.Image.ImageUrl = "cars/" + registro["archivo"].ToString();

            this.TextBox1.Enabled = false;
            this.Button2.Enabled = true;
            this.Button4.Enabled = true;
            this.RequiredFieldValidator2.Enabled = true;
            this.RequiredFieldValidator3.Enabled = true;
            //muestra los modelos disponibles correspondientes a la marca seleccionada.
            //se hace luego de la busqueda y carga de datos desde la BD, 
            //porque si se hace antes y se intenta cargar un modelo diferente
            // al disponible (por la marca seleecionada), 
            //da error en tiempo de ejecucion.
            this.SqlDataSourceModelos.SelectCommand = "SELECT * FROM [MODELOS] WHERE (id_marca = @id_marca)";
            this.SqlDataSourceModelos.SelectParameters["id_marca"].DefaultValue=this.DropDownList1.SelectedValue;
            this.SqlDataSourceModelos.Select(DataSourceSelectArguments.Empty);
            this.DropDownList1.AutoPostBack = true;  
             
        } else {
            this.Label7.Text="No se encontr&oacute; ning&uacute;n auto nro "+this.TextBox1.Text;
        }
    }

    protected void ChangeValueDropDownList1(object sender, EventArgs e)
        //cada vez que cambie el valor de la maca seleccionada.
    {
        if (this.DropDownList1.AutoPostBack)
        {
            //luego de la busqueda y la carga de datos desde la BD,
            //cada vez que cambie el valor de la marca seleccionada, 
            //se mostraran los modelos disponibles segun la marca seleccionada.
            this.SqlDataSourceModelos.SelectCommand = "SELECT * FROM [MODELOS] WHERE (id_marca = @id_marca)";
            this.SqlDataSourceModelos.SelectParameters["id_marca"].DefaultValue = this.DropDownList1.SelectedValue;
            this.SqlDataSourceModelos.Select(DataSourceSelectArguments.Empty);
        }
    }

    protected void Button2_Click(object sender, EventArgs e)
    {
        this.Label11.Text = "";
        this.Label10.Text = "";
        if (this.IsValid)
            //solo se actualizaran los valores, si no hay errores en los campos a completar.
        {
            this.SqlDatosAutos.UpdateParameters["id_auto"].DefaultValue = this.TextBox1.Text;
            this.SqlDatosAutos.UpdateParameters["anio_auto"].DefaultValue = this.TextBox2.Text;
            this.SqlDatosAutos.UpdateParameters["id_marca"].DefaultValue = this.DropDownList1.SelectedValue;
            this.SqlDatosAutos.UpdateParameters["id_modelo"].DefaultValue = this.DropDownList2.SelectedValue;
            this.SqlDatosAutos.UpdateParameters["web_auto"].DefaultValue = this.TextBox3.Text;
            int cant = this.SqlDatosAutos.Update();
            if (cant == 1)
            {
                this.Label8.Text = "Los datos han sido actualizados!";
            }
            else
            {
                this.Label8.Text = "Hubo un error.";
                this.Label8.ForeColor = System.Drawing.Color.Red;//en teoria nunca ingresa a este if
            }
        }
    }

    protected void Button3_Click(object sender, EventArgs e)
    {
        //redirecciono a la misma pagina para que se limpien todos los campos,
        Response.Redirect("modificacion_autos.aspx");
    }

    protected void CustomValidator2_ServerValidate(object source, ServerValidateEventArgs args)
    {
        string txt_ingresado = this.TextBox2.Text;
        if (txt_ingresado.Length == 4)//se ingresadon 4 caracteres?
        {
            if (txt_ingresado.All(char.IsDigit))
            //All recorre cada uno de los caracteres del string, y al usar IsDigit,
            //verifica que cada uno de ellos sea o no un digito numerico; 
            //si IsDigit verifica un caracter y este resulta no ser 
            //numerico, retorna false.
            {
                int anio_actual = DateTime.Today.Year; //anio de la fecha del servidor
                int anio_ingresado = int.Parse(txt_ingresado);
                if (anio_ingresado <= anio_actual && anio_ingresado >= 2000)
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
        else
        {
            args.IsValid = false;//no se ingresaron 4 caracteres
        }
    }
    
    protected void Button4_Click(object sender, EventArgs e)
    {
        this.Label7.Text = "";
        this.Label10.Text = "";
        this.Label11.Text = "";
        this.Label8.Text = "";
        if (this.FileUpload1.FileName.Length != 0)
        {
            //si se cargo un nombre de archivo
            //creo que la mejor opcion es eliminar el archivo y luego comprobar si existe un archivo con el mismo nombre del que se intenta subir,
            //pero no pude implementar esta solcion por mi falta de conocimiento de los metodos del objeto File.
            //por el momento la solucion mas practica es subir un archivo con diferente nombre al que exite en la carpeta cars
            if (File.Exists(this.Server.MapPath(".") + "/cars/" + this.FileUpload1.FileName))//si existe ya un archivo con el mismo nombre del que se intenta subir
            {
                this.Label10.Text = "<ul><li>Ya existe un archivo con ese nombre</li></ul>";
                this.Label10.ForeColor = System.Drawing.Color.Red;
                this.Label11.Text = "*";

            }
            else // si no exite un archivo con el mismo nombre
            {
                File.Delete(this.Server.MapPath(".") + "/cars/" + this.Image.AlternateText);//borro la imagen actual
                this.Image.AlternateText = this.FileUpload1.FileName;
                this.Image.ImageUrl = "cars/" + this.FileUpload1.FileName;
                FileUpload1.SaveAs(Server.MapPath(".") + "/cars/" + this.FileUpload1.FileName);//guardo la nueva imagen
                this.SqlImagenAutos.UpdateParameters["id_auto"].DefaultValue = this.TextBox1.Text;
                this.SqlImagenAutos.UpdateParameters["archivo"].DefaultValue = this.FileUpload1.FileName;
                int c = this.SqlImagenAutos.Update();//actualizo el registro
                if (c == 1)//si se edito un fila
                {
                    this.Label10.Text = "La im&aacute;gen fue actualizada con &eacute;xito";
                    this.Label10.ForeColor = System.Drawing.Color.Green;
                }
                else
                {
                    this.Label10.Text = "Hubo un error, la im&aacute;gen no pudo ser actualizada";
                    //en teoria este mansaje no se muestra nunca
                    this.Label10.ForeColor = System.Drawing.Color.Red;
                }
            }
        }
        else {
            this.Label10.Text = "<ul><li>No se ha seleccionado ninguna imagen</li></ul>";
            this.Label10.ForeColor = System.Drawing.Color.Red;
            this.Label11.Text = "*";
        }         

    }
}
