<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Inicio.aspx.cs" Inherits="WebApplication1.Index" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>Goolgle Maps Picker</title>

    <!-- Bootstrap y JQuery -->
    <link rel="stylesheet" href="https://netdna.bootstrapcdn.com/bootstrap/3.0.3/css/bootstrap.min.css"/>
    <link rel="stylesheet" href="https://netdna.bootstrapcdn.com/bootstrap/3.0.3/css/bootstrap-theme.min.css"/>
    <script src="https://code.jquery.com/jquery-1.10.2.min.js"></script>
    <script src="https://netdna.bootstrapcdn.com/bootstrap/3.0.3/js/bootstrap.min.js"></script>


    <!-- Complementos del Pluggin-->
    <script type="text/javascript" src='https://maps.google.com/maps/api/js?sensor=false&libraries=places&key=AIzaSyAG_nWOWa1hPooV-X_9Jo5WZehK2m_7B_s'></script>
    <script src="js/locationpicker.jquery.js"></script>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container">
            <!-- Botón -->
            <button type="button" data-toggle="modal" data-target="#ModalMap" class="btn btn-default">
                <span class="glyphicon glyphicon-map-marker" ></span><span id="ubicacion">Seleccionar ubicación</span>
            </button>
            <style>
                .pac-container {

                    z-index:99999;
                }
            </style>
            <!-- Modal -->
             <div class="modal fade" id="ModalMap" tabindex="-1" role="dialog">
                 <div class="modal-dialog" role="document">
                     <div class="modal-content">
                         <div class="modal-body">
                             <div class="form-horizontal"> 
                                 <div class="form-group">
                                     <label class="col-sm-2 control-label" >Ubicación:</label>
                                     <div class="col-sm-9">
                                         <asp:TextBox ID="ModalMapaddress" CssClass="form-control" runat="server"></asp:TextBox>
                                     </div>
                                     <!-- Botón para cerrar el modal -->
                                     <div class="col-sm-1">
                                         <button type="button" class="close" data-dismiss="modal" aria-label="Cerrar">
                                             <span aria-hidden="true">&times;</span>
                                         </button>
                                     </div>
                                 </div>  
                                 <div id="ModalMapPreview" style="width:100%; height:400px;"></div>
                                 <div class="clearfix">&nbsp;</div>
                                 <label class="p-r-small col-sm-1 control-label" runat="server">Latitud:</label>
                                 <div class="col-sm-3">
                                     <asp:TextBox ID="ModalMapLat" CssClass="form-control" runat="server"></asp:TextBox>
                                 </div>
                                 <label class="p-r-small col-sm-1 control-label" runat="server">Longitud:</label>
                                 <div class="col-sm-3">
                                     <asp:TextBox ID="ModalMapLong" CssClass="form-control" runat="server"></asp:TextBox>
                                 </div>
                                 <div class="col-sm-3">
                                     <button type="button" class="btn btn-primary btn-block" data-dismiss="modal">Aceptar</button>
                                 </div>
                                 <div class="clearfix"></div>

                                 <!-- Uso del script para añadir el mapa al modal-->
                                  <script>
                                      $('#ModalMapPreview').locationpicker({
                                          radius: 0,
                                          location: {
                                              latitude: 27.365938954017043,
                                              longitude: -109.93136356074504
                                          },
                                          enableAutocomplete: true,
                                          inputBinding: {
                                              latitudeInput: $('#<%=ModalMapLat.ClientID%>'),
                                              longitudeInput: $('#<%=ModalMapLong.ClientID%>'),
                                              locationNameInput: $('#<%=ModalMapaddress.ClientID%>')
                                          },
                                          onchanged: function (currentLocation, radius, isMarkerDropped) {
                                              $('#ubicacion').html($('#<%=ModalMapaddress.ClientID%>').val());


                                          }
                                      });
                                      $('ModalMap').on('show.bs.modal', function () {
                                          $('#ModalMapPreview').locationpicker('autosize');

                                      });
                                  </script>
                             </div>
                         </div>
                     </div>
                 </div>
             </div>
        </div>
    </form>
</body>
</html>
<!-- -->