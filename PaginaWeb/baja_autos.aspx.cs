using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;
using System.Data.SqlClient;

public partial class baja_autost : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void CustomValidator1_ServerValidate(object source, ServerValidateEventArgs args)
    {
        if(this.TextBox1.Text.All(char.IsDigit))
        {
            args.IsValid=true;
        } else{
            args.IsValid=false;
        }
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        if(this.IsValid){
            //primero tengo que hacer la busqueda del registro
            this.SqlDataAutos.SelectParameters["id"].DefaultValue = this.TextBox1.Text;
            //le paso a la consulta el valor ingresado
            this.SqlDataAutos.DataSourceMode = SqlDataSourceMode.DataReader;
            SqlDataReader registro;
            registro = (SqlDataReader)this.SqlDataAutos.Select(DataSourceSelectArguments.Empty);
            //traigo los datos del registro y los almaceno en la variable registro


            this.SqlDataAutos.DeleteParameters["id"].DefaultValue=this.TextBox1.Text;
            //luego de la busqueda, le paso el dato cargado a la consulta Delete
            int flag= this.SqlDataAutos.Delete();
            //ejecuto el Delete, y almaceno en la variable la cantidad de filas afectadas
            if (flag != 0) //si la cantidad de filas afectadas es diferente de 0
            {
                this.Label2.Text = "Los dato se eliminaron con exito!";
                if(registro.Read()){//si el registro almacenado contiene datos para leer
                    File.Delete(Server.MapPath(".") + "/cars/" + registro["archivo"]);
                    //elimino el registto con la ubicacion relativa "./cars/" y 
                    //cuyo nombre fue almacenado en el elemento "archivo" de la variable registro                    
                }
            }
            else
            {
                this.Label2.Text = "No existe el registro nro "+this.TextBox1.Text;
            }
        }
    }
}
