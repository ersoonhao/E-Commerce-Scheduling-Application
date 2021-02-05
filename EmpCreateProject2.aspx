<%@ Page Title="" Language="C#" EnableEventValidation="false" MasterPageFile="~/AdminMasterpage.master" AutoEventWireup="true" CodeFile="EmpCreateProject2.aspx.cs" Inherits="EmpCreateProject2" %>

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


                <!-- Notification css (Toastr) -->
                <link href="assets/plugins/toastr/toastr.min.css" rel="stylesheet" type="text/css" />

                <!-- Switchery css -->
                <link href="assets/plugins/switchery/switchery.min.css" rel="stylesheet" />

                <div class="row">
                    <div class="col-xs-12">
                        <div class="page-title-box">
                            <h4 class="page-title">Create Project Scedule</h4>
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
                                <asp:TextBox ID="TaskTB" placeholder="Input here" CssClass="form-control" runat="server"></asp:TextBox>
                            </fieldset>
                             <fieldset class="form-group">
                                <label for="exampleSelect1">Date</label>
                                <asp:TextBox ID="DateTB" TextMode="Date" placeholder="Input here" CssClass="form-control" runat="server"></asp:TextBox>
                            </fieldset>
                             <fieldset class="form-group">
                                <label for="exampleSelect1">Time</label>
                                <asp:TextBox ID="TimeTB" placeholder="Input here" CssClass="form-control" runat="server"></asp:TextBox>
                            </fieldset>
                            <fieldset class="form-group">
                                <label for="exampleSelect1">Task Description</label>
                                <asp:TextBox ID="DescriptionTB" TextMode="MultiLine" placeholder="Input here" CssClass="form-control" runat="server"></asp:TextBox>
                            </fieldset>
                            <fieldset class="form-group">
                                <asp:Button CssClass="btn btn-dark" OnClientClick="taskbtn()" OnClick="Button1_OnClick" ID="Button1" runat="server" Text="Add Task" />
                                <asp:Button CssClass="btn btn-success" OnClick="Button2_OnClick" ID="Button2" runat="server" Text="Done" />
                            </fieldset>
                        </div>
                    </div>

                    <div class="col-sm-8">
                        <div class="card-box table-responsive">
                            <h4 class="m-t-0 header-title"><b>Add Recipient</b></h4>
                            <br />
                            <asp:GridView ID="GridView1" runat="server" CssClass="table table-hover" GridLines="None" OnPreRender="GridView1_OnPreRender" AutoGenerateColumns="False" DataKeyNames="ProjectDetailsID" DataSourceID="SqlDataSource1">
                                <Columns>
                                    <asp:BoundField DataField="pdTask" HeaderText="Task" SortExpression="pdTask" />
                                    <asp:BoundField DataField="pdDescription" HeaderText="Description" SortExpression="pdDescription" />
                                    <asp:BoundField DataField="pdStatus" HeaderText="Status" SortExpression="pdStatus" />
                                    <asp:BoundField Visible="False" DataField="ProjectDetailsID" HeaderText="ProjectDetailsID" InsertVisible="False" ReadOnly="True" SortExpression="ProjectDetailsID" />
                                    <asp:TemplateField HeaderText="Delete">
                                        <ItemTemplate>
                                            <asp:Button ID="DeleteBTN" CommandName="Delete" CssClass="btn btn-danger" runat="server" Text="Delete" />
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                </Columns>
                            </asp:GridView>
                            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:impressiondesign_dbConnectionString %>" DeleteCommand="DELETE FROM [myProjectDetails] WHERE [ProjectDetailsID] = @original_ProjectDetailsID" InsertCommand="INSERT INTO [myProjectDetails] ([pdProjectID], [pdTask], [pdDescription], [pdStatus]) VALUES (@pdProjectID, @pdTask, @pdDescription, @pdStatus)" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT * FROM [myProjectDetails] WHERE ([pdProjectID] = @pdProjectID)" UpdateCommand="UPDATE [myProjectDetails] SET [pdProjectID] = @pdProjectID, [pdTask] = @pdTask, [pdDescription] = @pdDescription, [pdStatus] = @pdStatus WHERE [ProjectDetailsID] = @original_ProjectDetailsID">
                                <DeleteParameters>
                                    <asp:Parameter Name="original_ProjectDetailsID" Type="Int32" />
                                </DeleteParameters>
                                <InsertParameters>
                                    <asp:Parameter Name="pdProjectID" Type="String" />
                                    <asp:Parameter Name="pdTask" Type="String" />
                                    <asp:Parameter Name="pdDescription" Type="String" />
                                    <asp:Parameter Name="pdStatus" Type="String" />
                                </InsertParameters>
                                <SelectParameters>
                                    <asp:SessionParameter Name="pdProjectID" SessionField="sBookingID" Type="String" />
                                </SelectParameters>
                                <UpdateParameters>
                                    <asp:Parameter Name="pdProjectID" Type="String" />
                                    <asp:Parameter Name="pdTask" Type="String" />
                                    <asp:Parameter Name="pdDescription" Type="String" />
                                    <asp:Parameter Name="pdStatus" Type="String" />
                                    <asp:Parameter Name="original_ProjectDetailsID" Type="Int32" />
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

            <!-- Toastr js -->
            <script src="assets/plugins/toastr/toastr.min.js"></script>

            <script type="text/javascript" charset="utf-8">
                $(document).ready(function () {
                    $(".table").dataTable();
                });
            </script>

        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>

