<%@ Page Title="" Language="C#" MasterPageFile="~/AdminMasterpage.master" AutoEventWireup="true" CodeFile="SuperAdmin.aspx.cs" Inherits="SuperAdmin" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
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
        <div class="col-sm-12">
            <div class="card-box table-responsive">
    <asp:GridView ID="GridView1" CssClass="table table-hover" runat="server" AutoGenerateColumns="False" DataKeyNames="ProjectID" DataSourceID="SqlDataSource1" OnPreRender="GridView1_PreRender1" BorderColor="White">
        <Columns>
            <asp:BoundField DataField="ProjectID" HeaderText="ProjectID" InsertVisible="False" ReadOnly="True" SortExpression="ProjectID" />
            <asp:BoundField DataField="pProjectName" HeaderText="pProjectName" SortExpression="pProjectName" />
            <asp:BoundField DataField="pEmployee" HeaderText="pEmployee" SortExpression="pEmployee" />
            <asp:BoundField DataField="pCustName" HeaderText="pCustName" SortExpression="pCustName" />
            <asp:BoundField DataField="pProjectStatus" HeaderText="pProjectStatus" SortExpression="pProjectStatus" />
            <asp:TemplateField HeaderText="Delete">
                                        <ItemTemplate>
                                            <asp:Button ID="DeleteBTN" CommandName="Delete" OnClientClick="deleteClick()" CssClass="btn btn-danger" runat="server" Text="Delete" />
                                        </ItemTemplate>

            </asp:TemplateField>
        </Columns>
    </asp:GridView>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConflictDetection="CompareAllValues" ConnectionString="<%$ ConnectionStrings:impressiondesign_dbConnectionString %>" DeleteCommand="DELETE FROM [myProjects] WHERE [ProjectID] = @original_ProjectID AND (([pProjectName] = @original_pProjectName) OR ([pProjectName] IS NULL AND @original_pProjectName IS NULL)) AND (([pEmployee] = @original_pEmployee) OR ([pEmployee] IS NULL AND @original_pEmployee IS NULL)) AND (([pCustName] = @original_pCustName) OR ([pCustName] IS NULL AND @original_pCustName IS NULL)) AND (([pProjectStatus] = @original_pProjectStatus) OR ([pProjectStatus] IS NULL AND @original_pProjectStatus IS NULL))" InsertCommand="INSERT INTO [myProjects] ([pProjectName], [pEmployee], [pCustName], [pProjectStatus]) VALUES (@pProjectName, @pEmployee, @pCustName, @pProjectStatus)" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT [ProjectID], [pProjectName], [pEmployee], [pCustName], [pProjectStatus] FROM [myProjects]" UpdateCommand="UPDATE [myProjects] SET [pProjectName] = @pProjectName, [pEmployee] = @pEmployee, [pCustName] = @pCustName, [pProjectStatus] = @pProjectStatus WHERE [ProjectID] = @original_ProjectID AND (([pProjectName] = @original_pProjectName) OR ([pProjectName] IS NULL AND @original_pProjectName IS NULL)) AND (([pEmployee] = @original_pEmployee) OR ([pEmployee] IS NULL AND @original_pEmployee IS NULL)) AND (([pCustName] = @original_pCustName) OR ([pCustName] IS NULL AND @original_pCustName IS NULL)) AND (([pProjectStatus] = @original_pProjectStatus) OR ([pProjectStatus] IS NULL AND @original_pProjectStatus IS NULL))">
        <DeleteParameters>
            <asp:Parameter Name="original_ProjectID" Type="Int32" />
            <asp:Parameter Name="original_pProjectName" Type="String" />
            <asp:Parameter Name="original_pEmployee" Type="String" />
            <asp:Parameter Name="original_pCustName" Type="String" />
            <asp:Parameter Name="original_pProjectStatus" Type="String" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="pProjectName" Type="String" />
            <asp:Parameter Name="pEmployee" Type="String" />
            <asp:Parameter Name="pCustName" Type="String" />
            <asp:Parameter Name="pProjectStatus" Type="String" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="pProjectName" Type="String" />
            <asp:Parameter Name="pEmployee" Type="String" />
            <asp:Parameter Name="pCustName" Type="String" />
            <asp:Parameter Name="pProjectStatus" Type="String" />
            <asp:Parameter Name="original_ProjectID" Type="Int32" />
            <asp:Parameter Name="original_pProjectName" Type="String" />
            <asp:Parameter Name="original_pEmployee" Type="String" />
            <asp:Parameter Name="original_pCustName" Type="String" />
            <asp:Parameter Name="original_pProjectStatus" Type="String" />
        </UpdateParameters>
    </asp:SqlDataSource>

            </div>
        </div>
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

