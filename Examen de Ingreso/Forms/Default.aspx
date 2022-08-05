<%@ Page Async="true" Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="Examen_de_Ingreso._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
<link rel="stylesheet" href="//code.jquery.com/ui/1.13.2/themes/base/jquery-ui.css">
  <link rel="stylesheet" href="/resources/demos/style.css">
    <div class="contenedor col-xs-12" >
        <h2 class="centrar-texto">Domicilio</h2>
        <hr>
        <formview class="formulario">
            <div class="campo col-md-12">
                <label class="campo__label">
                    CÓDIGO POSTAL:
                </label>
                <asp:TextBox runat="server" ID="tbcp" AutoPostBack="true" CssClass="campo__field">
                </asp:TextBox>
                <asp:RegularExpressionValidator ID="tbcp_val"
                        ControlToValidate="tbcp" runat="server"
                        ErrorMessage="Solo se admiten números"
                        ValidationExpression="\d+">
                        </asp:RegularExpressionValidator>
              <%--  <asp:RangeValidator ID="tbcp_val_length" ControlToValidate="tbcp"
                    Type="Integer" MinimumValue="4" MaximumValue="5" Display="Dynamic"
                    ErrorMessage="El codigo postal debe ser 5 caracteres.<br />"
                    runat="server"/>--%>
            </div>
            <div class="campo col-md-4">
                <label class="campo__label">
                    ESTADO:
                </label>
                <asp:TextBox runat="server" ID="tbest" AutoPostBack="true" CssClass="campo__field" ReadOnly="true">

                </asp:TextBox>
            </div>
            <div class="campo col-md-4">
                <label class="campo__label">
                    MUNICIPIO:
                </label>
                <asp:TextBox runat="server" ID="tbmunicipio" CssClass="campo__field" ReadOnly="true">

                </asp:TextBox>
            </div>
            <div class="campo col-md-4">
                <label class="campo__label" ReadOnly="true">
                    COLONIA:
                </label>
                <asp:TextBox runat="server" ID="tbcolonia" ReadOnly="true" CssClass="campo__field">

                </asp:TextBox>
            </div>
        </formview>
        </div>
        <div class="col-md-12">
        <h2 class="centrar-texto">Persona</h2>
        <hr>
        <formview class="formulario">
            <div class="campo  col-md-6">
                <label class="campo__label">
                    Fecha de Nacimiento:
                </label>
                <input id="datepicker" name="datepicker"type="text" placeholder="dd/mm/aaaa" Class="form-control campo__field"/>
                </div>
            <div class="col-md-6">
                <label class="campo__label">
                    Genero:
                </label>
                <asp:DropDownList runat="server" ID="ddl_gen">
                    <asp:ListItem Selected ="true" text ="Selecciona un genero" Value="0">                      
                    </asp:ListItem>
                    <asp:ListItem Enabled ="true" Value="1">
                        Masculino
                    </asp:ListItem>
                    <asp:ListItem Enabled ="true" Value="2">
                        Femenino
                    </asp:ListItem>
                </asp:DropDownList>
            </div>
            <div class="col-md-12">
                <asp:Button runat="server" Text="Validar" OnClick="validar_datos">

                </asp:Button>
                <hr>
            </div>
            </formview>
            
        </div>
    
     
 <script src="https://code.jquery.com/jquery-3.6.0.js"></script>
  <script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
      <script>
          $(function () {
              $("#datepicker").datepicker();
          });
      </script>
</asp:Content>
