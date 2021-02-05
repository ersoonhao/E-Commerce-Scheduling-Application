<%@ Page Title="" Language="C#" MasterPageFile="~/AdminMasterpage.master" EnableEventValidation="false" AutoEventWireup="true" CodeFile="AddProjectImage.aspx.cs" Inherits="AddProjectImage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
  
            <!-- DataTables -->
            <link href="assets/plugins/datatables/dataTables.bootstrap4.min.css" rel="stylesheet" type="text/css" />
            <link href="assets/plugins/datatables/buttons.bootstrap4.min.css" rel="stylesheet" type="text/css" />

            <!-- Sweet Alert css -->
            <link href="assets/plugins/bootstrap-sweetalert/sweet-alert.css" rel="stylesheet" type="text/css" />
            <div class="container">


                <!-- Notification css (Toastr) -->
                <link href="assets/plugins/toastr/toastr.min.css" rel="stylesheet" type="text/css" />

                <!-- Switchery css -->
                <link href="assets/plugins/switchery/switchery.min.css" rel="stylesheet" />

                <div class="row">
                    <div class="col-xs-12">
                        <div class="page-title-box">
                            <h4 class="page-title">Datatable</h4>
                            <ol class="breadcrumb p-0">
                                <li>
                                    <a href="#">Uplon</a>
                                </li>
                                <li>
                                    <a href="#">Tables</a>
                                </li>
                                <li class="active">Datatable
                                </li>
                            </ol>
                            <div class="clearfix"></div>
                        </div>
                    </div>
                </div>
                <!-- end row -->
                <div class="row">
                    <div class="col-sm-4">
                        <div class="card-box table-responsive">
                            <h4 class="m-t-0 header-title"><b>Create Project</b></h4>
                            <br />
                            <fieldset class="form-group">
                                <label for="exampleSelect1">Add Task</label>
                                <asp:FileUpload ID="FileUpload1" runat="server" />
                            </fieldset>
                            <fieldset class="form-group">
                                <label for="exampleSelect1">Task Description</label>
                                <asp:TextBox ID="DescriptionTB" TextMode="MultiLine" placeholder="Input here" CssClass="form-control" runat="server"></asp:TextBox>
                            </fieldset>
                            <fieldset class="form-group">
                                <asp:Button CssClass="btn btn-dark" OnClick="UploadBTN_OnClick"  ID="UploadBTN" runat="server" Text="Upload Image" />
                                   <asp:Button OnClick="Button1_OnClick" CssClass="btn btn-dark" ID="Button1" runat="server" Text="Back" />
                            </fieldset>
                        </div>
                    </div>

                    <div class="col-sm-8">
                        <div class="card-box table-responsive">
                            <h4 class="m-t-0 header-title"><b>Add Recipient</b></h4>
                            <br />
                            <img runat="server" id="Image1" alt="" style="max-height: 450px " class="img-responsive center-block" src="" />
                        </div>
                    </div>
                </div>
                <!-- end row -->
            </div>


            <!-- jQuery  -->
            <script src="assets/js/jquery.min.js"></script>
            <script src="assets/js/tether.min.js"></script>
            <!-- Tether for Bootstrap -->
            <script src="assets/js/bootstrap.min.js"></script>
            <script src="assets/js/detect.js"></script>
            <script src="assets/js/fastclick.js"></script>
            <script src="assets/js/jquery.blockUI.js"></script>
            <script src="assets/js/waves.js"></script>
            <script src="assets/js/jquery.nicescroll.js"></script>
            <script src="assets/js/jquery.scrollTo.min.js"></script>
            <script src="assets/js/jquery.slimscroll.js"></script>
            <script src="assets/plugins/switchery/switchery.min.js"></script>

            <!--Morris Chart-->
            <script src="assets/plugins/morris/morris.min.js"></script>
            <script src="assets/plugins/raphael/raphael-min.js"></script>

            <!-- Counter Up  -->
            <script src="assets/plugins/waypoints/lib/jquery.waypoints.js"></script>
            <script src="assets/plugins/counterup/jquery.counterup.min.js"></script>

            <!-- App js -->
            <script src="assets/js/jquery.core.js"></script>
            <script src="assets/js/jquery.app.js"></script>

            <!-- Page specific js -->
            <script src="assets/pages/jquery.dashboard.js"></script>

            <!-- Required datatable js -->
            <script src="assets/plugins/datatables/jquery.dataTables.min.js"></script>
            <script src="assets/plugins/datatables/dataTables.bootstrap4.min.js"></script>

            <!-- Sweet Alert js -->
            <script src="assets/plugins/bootstrap-sweetalert/sweet-alert.min.js"></script>
            <script src="assets/pages/jquery.sweet-alert.init.js"></script>

            <!--wizard initialization-->
            <script src="assets/pages/jquery.wizard-init.js" type="text/javascript"></script>

            <!-- Toastr js -->
            <script src="assets/plugins/toastr/toastr.min.js"></script>

            <script type="text/javascript" charset="utf-8">
                $(document).ready(function () {
                    $(".table").dataTable();
                });
            </script>

    
  
</asp:Content>



