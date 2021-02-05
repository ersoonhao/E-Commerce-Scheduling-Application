<%@ Page Title="" Language="C#" EnableEventValidation="false" MasterPageFile="~/AdminMasterpage.master" AutoEventWireup="true" CodeFile="EmpCreateProject.aspx.cs" Inherits="EmpCreateProject" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <!-- DataTables -->
            <link href="assets/plugins/datatables/dataTables.bootstrap4.min.css" rel="stylesheet" type="text/css" />
            <link href="assets/plugins/datatables/buttons.bootstrap4.min.css" rel="stylesheet" type="text/css" />

            <!-- Sweet Alert css -->
            <link href="assets/plugins/bootstrap-sweetalert/sweet-alert.css" rel="stylesheet" type="text/css" />
            <div class="container">

                <div class="row">
                    <div class="col-xs-12">
                        <div class="page-title-box">
                            <h4 class="page-title">CREATE PROJECT</h4>
                            <div class="clearfix"></div>
                        </div>
                    </div>
                </div>
                <!-- end row -->
                <div class="row">
                    <div class="col-sm-12">
                        <div class="card-box table-responsive">
                            <h4 class="m-t-0 header-title">SEARCH UNCONFIRMED CLIENT</h4>
                            <br />
                            <fieldset class="form-group">
                                <label for="exampleSelect1">Project Name</label>
                                <asp:TextBox ID="ProjectTB" placeholder="Input here" CssClass="form-control" runat="server" ToolTip="Enter customer name in order to search."></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Project Name is required" ControlToValidate="ProjectTB"></asp:RequiredFieldValidator>
                            </fieldset>
                        </div>
                    </div>
                </div>

                <div class="row">
                    <div class="col-sm-12">
                        <div class="card-box table-responsive">
                            <h4 class="m-t-0 header-title"><b>Add Recipient</b></h4>
                            <br />
                            <asp:GridView ID="GridView1" CssClass="table table-hover" runat="server" GridLines="None" AutoGenerateColumns="False" DataKeyNames="myBookingID" DataSourceID="SqlDataSource1" OnPreRender="GridView1_PreRender1">
                                <Columns>
                                    <asp:BoundField DataField="bName" HeaderText="Name" SortExpression="bName" />
                                    <asp:BoundField DataField="bUsername" HeaderText="Username" SortExpression="bUsername" />
                                    <asp:BoundField DataField="bEmail" HeaderText="Email" SortExpression="bEmail" />
                                    <asp:BoundField DataField="bStatus" HeaderText="Status" SortExpression="bStatus" />
                                    <asp:BoundField DataField="myBookingID" HeaderText="myBookingID" InsertVisible="False" ReadOnly="True" SortExpression="myBookingID" />
                                    <asp:TemplateField HeaderText="Delete">
                                        <ItemTemplate>
                                            <asp:Button ID="DeleteBTN" CommandName="Delete" OnClientClick="deleteClick()" CssClass="btn btn-danger" runat="server" Text="Delete" />
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Create">
                                        <ItemTemplate>
                                            <asp:Button ID="CreateBTN" OnClick="CreateBTN_OnClick" CssClass="btn btn-success" runat="server" Text="Create Project" />
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                </Columns>
                            </asp:GridView>
                            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConflictDetection="CompareAllValues" ConnectionString="<%$ ConnectionStrings:impressiondesign_dbConnectionString %>" DeleteCommand="DELETE FROM [myBookings] WHERE [myBookingID] = @original_myBookingID AND (([bStatus] = @original_bStatus) OR ([bStatus] IS NULL AND @original_bStatus IS NULL)) AND (([bName] = @original_bName) OR ([bName] IS NULL AND @original_bName IS NULL)) AND (([bUsername] = @original_bUsername) OR ([bUsername] IS NULL AND @original_bUsername IS NULL)) AND (([bEmail] = @original_bEmail) OR ([bEmail] IS NULL AND @original_bEmail IS NULL))" InsertCommand="INSERT INTO [myBookings] ([bStatus], [bName], [bUsername], [bEmail]) VALUES (@bStatus, @bName, @bUsername, @bEmail)" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT [bStatus], [bName], [bUsername], [bEmail], [myBookingID] FROM [myBookings] WHERE (([bStatus] = @bStatus) AND ([bEmployee] = @bEmployee))" UpdateCommand="UPDATE [myBookings] SET [bStatus] = @bStatus, [bName] = @bName, [bUsername] = @bUsername, [bEmail] = @bEmail WHERE [myBookingID] = @original_myBookingID AND (([bStatus] = @original_bStatus) OR ([bStatus] IS NULL AND @original_bStatus IS NULL)) AND (([bName] = @original_bName) OR ([bName] IS NULL AND @original_bName IS NULL)) AND (([bUsername] = @original_bUsername) OR ([bUsername] IS NULL AND @original_bUsername IS NULL)) AND (([bEmail] = @original_bEmail) OR ([bEmail] IS NULL AND @original_bEmail IS NULL))">
                                <DeleteParameters>
                                    <asp:Parameter Name="original_myBookingID" Type="Int32" />
                                    <asp:Parameter Name="original_bStatus" Type="String" />
                                    <asp:Parameter Name="original_bName" Type="String" />
                                    <asp:Parameter Name="original_bUsername" Type="String" />
                                    <asp:Parameter Name="original_bEmail" Type="String" />
                                </DeleteParameters>
                                <InsertParameters>
                                    <asp:Parameter Name="bStatus" Type="String" />
                                    <asp:Parameter Name="bName" Type="String" />
                                    <asp:Parameter Name="bUsername" Type="String" />
                                    <asp:Parameter Name="bEmail" Type="String" />
                                </InsertParameters>
                                <SelectParameters>
                                    <asp:Parameter DefaultValue="Pending" Name="bStatus" Type="String" />
                                    <asp:SessionParameter Name="bEmployee" SessionField="sName" Type="String" />
                                </SelectParameters>
                                <UpdateParameters>
                                    <asp:Parameter Name="bStatus" Type="String" />
                                    <asp:Parameter Name="bName" Type="String" />
                                    <asp:Parameter Name="bUsername" Type="String" />
                                    <asp:Parameter Name="bEmail" Type="String" />
                                    <asp:Parameter Name="original_myBookingID" Type="Int32" />
                                    <asp:Parameter Name="original_bStatus" Type="String" />
                                    <asp:Parameter Name="original_bName" Type="String" />
                                    <asp:Parameter Name="original_bUsername" Type="String" />
                                    <asp:Parameter Name="original_bEmail" Type="String" />
                                </UpdateParameters>
                            </asp:SqlDataSource>
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

            <script type="text/javascript" charset="utf-8">
                $(document).ready(function () {
                    $(".table").dataTable();
                });
            </script>

            <script>
                function deleteClick() {
                    swal("Complete", "Item deleted.", "danger");
                }
            </script>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>

