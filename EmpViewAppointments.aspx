<%@ Page Title="" Language="C#" EnableEventValidation="false" MasterPageFile="~/AdminMasterpage.master" AutoEventWireup="true" CodeFile="EmpViewAppointments.aspx.cs" Inherits="EmpViewAppointments" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <div class="container">


        <%--  <div class="row">--%>
        <div class="row">
            <div class="col-xs-12">
                <h4 runat="server" id="testLB"></h4>
                <div class="page-title-box">
                    <h4 class="page-title">Appointments</h4>
                    <ol class="breadcrumb p-0">
                    </ol>
                    <div class="clearfix"></div>
                </div>
            </div>
        </div>

        <asp:ListView ID="ListView1" runat="server" DataSourceID="SqlDataSource1" DataKeyNames="myBookingID">
            <EditItemTemplate>
                <span style="">myBookingID:
                    <asp:Label ID="myBookingIDLabel1" runat="server" Text='<%# Eval("myBookingID") %>' />
                    <br />
                    bTime:
                    <asp:TextBox ID="bTimeTextBox" runat="server" Text='<%# Bind("bTime") %>' />
                    <br />
                    bMessage:
                    <asp:TextBox ID="bMessageTextBox" runat="server" Text='<%# Bind("bMessage") %>' />
                    <br />
                    bName:
                    <asp:TextBox ID="bNameTextBox" runat="server" Text='<%# Bind("bName") %>' />
                    <br />
                    bUsername:
                    <asp:TextBox ID="bUsernameTextBox" runat="server" Text='<%# Bind("bUsername") %>' />
                    <br />
                    bDate:
                    <asp:TextBox ID="bDateTextBox" runat="server" Text='<%# Bind("bDate") %>' />
                    <br />
                    <asp:Button ID="UpdateButton" runat="server" CommandName="Update" Text="Update" />
                    <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Cancel" />
                    <br />
                    <br />
                </span>
            </EditItemTemplate>
            <EmptyDataTemplate>
                <span>No data was returned.</span>
            </EmptyDataTemplate>
            <InsertItemTemplate>
                <span>bTime:
                    <asp:TextBox ID="bTimeTextBox" runat="server" Text='<%# Bind("bTime") %>' />
                    <br />
                    bMessage:
                    <asp:TextBox ID="bMessageTextBox" runat="server" Text='<%# Bind("bMessage") %>' />
                    <br />
                    bName:
                    <asp:TextBox ID="bNameTextBox" runat="server" Text='<%# Bind("bName") %>' />
                    <br />
                    bUsername:
                    <asp:TextBox ID="bUsernameTextBox" runat="server" Text='<%# Bind("bUsername") %>' />
                    <br />
                    bDate:
                    <asp:TextBox ID="bDateTextBox" runat="server" Text='<%# Bind("bDate") %>' />
                    <br />
                    <asp:Button ID="InsertButton" runat="server" CommandName="Insert" Text="Insert" />
                    <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Clear" />
                    <br />
                    <br />
                </span>
            </InsertItemTemplate>
            <ItemTemplate>
                <div class="col-sm-4 col-lg-3 col-xs-12">
                    <div class="card">
                        <div class="card-block">
                            <h4 class="card-title" runat="server" id="nameTB"><%# Eval("bName") %></h4>
                            <h6 class="card-subtitle text-muted">Appointment</h6>
                        </div>
                        <div class="card-block">
                            <p class="card-text" runat="server" id="timeTB"><%# Eval("bTime") %>
                                Design Consultation Slot
                            </p>
                            <asp:Button CssClass="card-link btn btn-success-outline" OnClick="ApproveBTN_OnClick" ID="ApproveBTN" runat="server" Text="Approve" />
                           <asp:Button CssClass="card-link btn btn-success-outline" OnClick="RejectBTN_OnClick" ID="RejectBTN" runat="server" Text="Reject" />
                            <%--  <a href="#" class="card-link">Card link</a>
                            <a href="#" class="card-link">Another link</a>--%>
                        </div>
                    </div>
                </div>
                <asp:Label Visible="False" ID="bEmailLabel" runat="server" Text='<%# Eval("bEmail") %>' />

                <asp:Label Visible="False" ID="myBookingIDLabel" runat="server" Text='<%# Eval("myBookingID") %>' />
                
                <asp:Label Visible="False" ID="bEmployeeLabel" runat="server" Text='<%# Eval("bEmployee") %>' />

                <asp:Label Visible="False" ID="bTimeLabel" runat="server" Text='<%# Eval("bTime") %>' />

                <asp:Label Visible="False" ID="bMessageLabel" runat="server" Text='<%# Eval("bMessage") %>' />

                <asp:Label Visible="False" ID="bNameLabel" runat="server" Text='<%# Eval("bName") %>' />

                <asp:Label Visible="False" ID="bUsernameLabel" runat="server" Text='<%# Eval("bUsername") %>' />

                <asp:Label Visible="False" ID="bDateLabel" runat="server" Text='<%# Eval("bDate") %>' />

            </ItemTemplate>
            <LayoutTemplate>
                <div id="itemPlaceholderContainer" runat="server" style="">
                    <span runat="server" id="itemPlaceholder" />
                </div>
                <div style="">
                </div>
            </LayoutTemplate>
            <SelectedItemTemplate>
                <span style="">myBookingID:
                    <asp:Label ID="myBookingIDLabel" runat="server" Text='<%# Eval("myBookingID") %>' />
                    <br />
                    bTime:
                    <asp:Label ID="bTimeLabel" runat="server" Text='<%# Eval("bTime") %>' />
                    <br />
                    bMessage:
                    <asp:Label ID="bMessageLabel" runat="server" Text='<%# Eval("bMessage") %>' />
                    <br />
                    bName:
                    <asp:Label ID="bNameLabel" runat="server" Text='<%# Eval("bName") %>' />
                    <br />
                    bUsername:
                    <asp:Label ID="bUsernameLabel" runat="server" Text='<%# Eval("bUsername") %>' />
                    <br />
                    bDate:
                    <asp:Label ID="bDateLabel" runat="server" Text='<%# Eval("bDate") %>' />
                    <br />
                    <br />
                </span>
            </SelectedItemTemplate>
        </asp:ListView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:impressiondesign_dbConnectionString %>" SelectCommand="SELECT * FROM [myBookings] WHERE (([bEmployee] = @bEmployee) AND ([bStatus] = @bStatus))">
            <SelectParameters>
                <asp:SessionParameter Name="bEmployee" SessionField="sName" Type="String" />
                <asp:Parameter DefaultValue="Available" Name="bStatus" Type="String" />
            </SelectParameters>
        </asp:SqlDataSource>
        <%--</div>--%>
    </div>
          <!-- jQuery  -->
        <script src="assets/js/jquery.min.js"></script>
        <script src="assets/js/tether.min.js"></script><!-- Tether for Bootstrap -->
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

        <!--wizard initialization-->
        <script src="assets/pages/jquery.wizard-init.js" type="text/javascript"></script>
</asp:Content>

