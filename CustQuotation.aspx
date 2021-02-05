<%@ Page Title="" Language="C#" EnableEventValidation="false" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="CustQuotation.aspx.cs" Inherits="CustQuotation" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="container">

        <div class="row">
            <div class="col-xs-12">
                <div class="page-title-box">
                    <h4 class="page-title">&nbsp;Quotation</h4>
                    <div class="clearfix"></div>
                </div>
            </div>
        </div>
        <!-- end row -->


        <div class="row">
            <div class="col-sm-8 col-sm-push-2">
                <div class="card-box">

                    <h4 class="header-title m-t-0 m-b-30">Send Quotation</h4>

                    <div class="row">
                        <div class="col-lg-12 col-sm-12 col-xs-12 col-md-12 col-xl-12">
                            <div class="form-group">
                                <label for="exampleSelect1">Building type</label>
                                <asp:TextBox ID="BuildingTB" CssClass="form-control" runat="server"></asp:TextBox>
                            </div>
                            <div class="form-group">
                                <label for="exampleSelect1">Rooms</label>
                                <asp:TextBox ID="RoomTB" CssClass="form-control" runat="server"></asp:TextBox>
                            </div>
                            <div class="form-group">
                                <label for="exampleTextarea">Description</label>
                                <asp:TextBox ID="DescriptionTB" CssClass="form-control" TextMode="MultiLine" runat="server"></asp:TextBox>
                            </div>
                            <div class="form-group">
                                <asp:FileUpload ID="fileuploader" runat="server" />
                            </div>
                            <asp:Button ID="SubmitBTN" CssClass="btn btn-primary" runat="server" Text="Submit" OnClick="SubmitBTN_OnClick" />
                        </div>


                    </div>
                    <!-- end col -->

                    <%--<div class="col-lg-12 col-sm-12 col-xs-12 col-md-12 col-xl-6 m-t-sm-40">

                            <fieldset>
                                <div class="form-group">
                                    <asp:GridView ID="GridView1" GridLines="none" CssClass="table table-hover" runat="server" OnRowDataBound="GridView1_RowDataBound"></asp:GridView>

                                </div>

                            </fieldset>

                        </div>--%>

                    <!-- end col -->

                </div>
                <!-- end row -->
            </div>
        </div>
        <!-- end col -->
    </div>
    <!-- end row -->

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

    <!-- Modal-Effect -->
    <script src="assets/plugins/custombox/js/custombox.min.js"></script>
    <script src="assets/plugins/custombox/js/legacy.min.js"></script>

    <!-- App js -->
    <script src="assets/js/jquery.core.js"></script>
    <script src="assets/js/jquery.app.js"></script>

    <!-- Page specific js -->
    <script src="assets/pages/jquery.dashboard.js"></script>

    <!-- Required datatable js -->
    <script src="assets/plugins/datatables/jquery.dataTables.min.js"></script>
    <script src="assets/plugins/datatables/dataTables.bootstrap4.min.js"></script>

    <!--wizard initialization-->
    <script src="assets/pages/jquery.wizard-init.js" type="text/javascript"></script>

</asp:Content>

