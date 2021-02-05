<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" EnableEventValidation="false" CodeFile="CustAppointment.aspx.cs" Inherits="CustAppointment" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="container">

        <%--<div class="row">
            <div class="col-xs-12">
                <div class="page-title-box">
                    <h4 class="page-title">Form elements</h4>
                    <ol class="breadcrumb p-0">
                        <li>
                            <a href="#">Uplon</a>
                        </li>
                        <li>
                            <a href="#">Forms</a>
                        </li>
                        <li class="active">Form elements</li>
                    </ol>
                    <div class="clearfix"></div>
                </div>
            </div>
        </div>--%>
        <div class="row">
            <div class="col-xs-12">
                <div class="page-title-box">
                    <h4 class="page-title">&nbsp;Appointment</h4>
                    <div class="clearfix"></div>
                </div>
            </div>
        </div>
        <!-- end row -->


        <div class="row">
            <div class="col-sm-12">
                <div class="card-box">

                    <h4 class="header-title m-t-0 m-b-30">Book an appointment</h4>

                    <div class="row">
                        <div class="col-lg-12 col-sm-12 col-xs-12 col-md-12 col-xl-6">
                            <fieldset class="form-group">
                                <label for="exampleSelect1">Select Date</label>
                                 <asp:TextBox ID="DateTB" CssClass="form-control" TextMode="Date" runat="server"></asp:TextBox>
                            </fieldset>
                             <asp:Button ID="CheckDateBTN" CssClass="btn btn-primary" runat="server" Text="Check Availability" OnClick="CheckDateBTN_Click" />
                            <br/>
                            <br/>
                            <fieldset class="form-group">
                                <label for="exampleSelect1">Select Timeslot</label>
                                <asp:DropDownList ID="TimeDDL" CssClass="form-control" runat="server"></asp:DropDownList>
                            </fieldset>
                            <fieldset class="form-group">
                                <label for="exampleSelect1">Select Designer</label>
                                <asp:DropDownList ID="EmployeeDDL" AppendDataBoundItems="True" CssClass="form-control" runat="server" DataSourceID="SqlDataSource1" DataTextField="eName" DataValueField="eName">
                                    <asp:ListItem Text="No Preferred Designer" Selected="True" Value="0"></asp:ListItem>
                                </asp:DropDownList>
                                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:impressiondesign_dbConnectionString %>" SelectCommand="SELECT [eName] FROM [myEmployees]"></asp:SqlDataSource>
                            </fieldset>
                            <fieldset class="form-group">
                                <label for="exampleTextarea">Additional Message</label>
                                <asp:TextBox ID="MessageTB" CssClass="form-control" TextMode="MultiLine" runat="server"></asp:TextBox>
                            </fieldset>
                            <asp:Button ID="SubmitBTN" CssClass="btn btn-primary" runat="server" Text="Book Appointment" OnClick="SubmitBTN_Click" />
                        </div>
                        <!-- end col -->

                        <div class="col-lg-12 col-sm-12 col-xs-12 col-md-12 col-xl-6 m-t-sm-40">

                            <fieldset>
                                <div class="form-group">
                                    <asp:GridView ID="GridView1" GridLines="none" CssClass="table table-hover" runat="server" OnRowDataBound="GridView1_RowDataBound"></asp:GridView>
                                   
                                </div>

                            </fieldset>

                        </div>

                        <!-- end col -->

                    </div>
                    <!-- end row -->
                </div>
            </div>
            <!-- end col -->
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

