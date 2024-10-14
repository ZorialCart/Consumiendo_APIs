<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="frmUbicaciones.aspx.cs" Inherits="CRUD_Ubicaciones.frmUbocaciones" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <link rel="stylesheet" href="https://netdna.bootstrapcdn.com/bootstrap/3.0.3/css/bootstrap.min.css"/>
    <script src="https://code.jquery.com/jquery-1.10.2.min.js"></script>
    <script src="https://netdna.bootstrapcdn.com/bootstrap/3.0.3/js/bootstrap.min.js"></script>

    <script type="text/javascript" src='https://maps.google.com/maps/api/js?sensor=false&libraries=places&key=AIzaSyAG_nWOWa1hPooV-X_9Jo5WZehK2m_7B_s'></script>
    <script src="js/locationpicker.jquery.js"></script>
    <title>Control de Ubicaciones</title>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container">
            <div class="row">
                <div class="col-md-4">
                    <div class="form-group">
                        <label for="exampleInputEmail">Ubicación:</label>
                        <asp:HiddenField ID="txtID"  runat="server" />
                        <asp:TextBox ID="txtUbicacion" CssClass="form-control" runat="server"></asp:TextBox>
                    </div>
                    <!-- Seleccionar ubicación -->
                    <div class="form-group">
                        <div id="ModalMapPreview" style="width: 100%; height: 300px;"></div>
                    </div>
                    <!-- Latitud y longitud -->
                    <div class="form-group">
                        <label for="ExampleInputPassword1">Latitud:</label>
                        <asp:TextBox ID="txtLat" Text="27.365938954017043" CssClass="form-control" runat="server"></asp:TextBox>
                        <label for="ExampleInputPassword2">Longitud:</label>
                        <asp:TextBox ID="txtLong" Text="-109.93136356074504" CssClass="form-control" runat="server"></asp:TextBox>
                    </div>
                    <!-- Controles de altas, bajas y cambios -->
                    <div class="form-group">
                        <asp:Button ID="btnAgregar" CssClass="btn btn-success" runat="server" Text="Agregar" UseSubmitBehavior="false" OnClick="btnAgregar_Click"/>
                        <asp:Button ID="btnModificar" CssClass="btn btn-warning" runat="server" Text="Modificar" UseSubmitBehavior="false" Enabled="false" OnClick="btnModificar_Click"/>
                        <asp:Button ID="btnEliminar" CssClass="btn btn-danger" runat="server" Text="Eliminar" UseSubmitBehavior="false" Enabled="false" OnClick="btnEliminar_Click"/>
                        <asp:Button ID="btnLimpiar" CssClass="btn btn-default" runat="server" Text="Limpiar" UseSubmitBehavior="false" OnClick="btnLimpiar_Click"/> 
                    </div>
                    <asp:Button ID="Button2" runat="server" Text="Button" />
                </div>
                <div class="col-md-8">
                    <br />
                    <h1>Ubicaciones</h1>
                    <asp:GridView ID="gvUbicaciones" runat="server" CssClass="table responsive table table-bordered" 
                        OnSelectedIndexChanged="SeleccionarUbi" AutoGenerateColumns="False">
                        <Columns>
                            <asp:CommandField HeaderText="Seleccionar" ShowSelectButton="True" 
                                SelectText="Seleccionar">
                                <ControlStyle CssClass="btn btn-info" />
                            </asp:CommandField>
                            <asp:BoundField DataField="ID" HeaderText="ID" />
                            <asp:BoundField DataField="Ubicación" HeaderText="Ubicación" />
                            <asp:BoundField DataField="Latitud" HeaderText="Latitud" />
                            <asp:BoundField DataField="Longitud" HeaderText="Longitud" />
                        </Columns>
                    </asp:GridView>
                </div>
            </div>
        </div>
    <script>
        $('#ModalMapPreview').locationpicker({
            radius: 0,
            location: {
                latitude: $('#<%=txtLat.ClientID%>').val(),
                longitude: $('#<%=txtLong.ClientID%>').val(),
            },
            inputBinding: {
                latitudeInput: $('#<%=txtLat.ClientID%>'),
            longitudeInput: $('#<%=txtLong.ClientID%>'),
            locationNameInput: $('#<%=txtUbicacion.ClientID%>')
            },
            enableAutocomplete: true
        });
    </script>
        
    </form>
    </body>
</html>
