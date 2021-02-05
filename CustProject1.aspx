<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="CustProject1.aspx.cs" Inherits="CustProject1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
     <div class="container">


        <%--  <div class="row">--%>
        <div class="row">
            <div class="col-xs-12">
                <h4 runat="server" id="testLB"></h4>
                <div class="page-title-box">
                    <h4 class="page-title">Project Management</h4>
                    <div class="clearfix"></div>
                </div>
            </div>
        </div>

        <asp:ListView ID="ListView1" runat="server" DataSourceID="SqlDataSource1" DataKeyNames="ProjectID">
            
        
            
            <EditItemTemplate>
                <span style="">ProjectID:
                    <asp:Label ID="ProjectIDLabel1" runat="server" Text='<%# Eval("ProjectID") %>' />
                    <br />
                    pProjectName:
                    <asp:TextBox ID="pProjectNameTextBox" runat="server" Text='<%# Bind("pProjectName") %>' />
                    <br />
                    pEmployee:
                    <asp:TextBox ID="pEmployeeTextBox" runat="server" Text='<%# Bind("pEmployee") %>' />
                    <br />
                    pCustName:
                    <asp:TextBox ID="pCustNameTextBox" runat="server" Text='<%# Bind("pCustName") %>' />
                    <br />
                    pProjectStatus:
                    <asp:TextBox ID="pProjectStatusTextBox" runat="server" Text='<%# Bind("pProjectStatus") %>' />
                    <br />
                    pCustUsername:
                    <asp:TextBox ID="pCustUsernameTextBox" runat="server" Text='<%# Bind("pCustUsername") %>' />
                    <br />
                    pCustEmail:
                <asp:TextBox ID="pCustEmailTextBox" runat="server" Text='<%# Bind("pCustEmail") %>' />
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
                <span style="">pProjectName:
                    <asp:TextBox ID="pProjectNameTextBox" runat="server" Text='<%# Bind("pProjectName") %>' />
                    <br />
                    pEmployee:
                    <asp:TextBox ID="pEmployeeTextBox" runat="server" Text='<%# Bind("pEmployee") %>' />
                    <br />
                    pCustName:
                    <asp:TextBox ID="pCustNameTextBox" runat="server" Text='<%# Bind("pCustName") %>' />
                    <br />
                    pProjectStatus:
                    <asp:TextBox ID="pProjectStatusTextBox" runat="server" Text='<%# Bind("pProjectStatus") %>' />
                    <br />
                    pCustUsername:
                    <asp:TextBox ID="pCustUsernameTextBox" runat="server" Text='<%# Bind("pCustUsername") %>' />
                    <br />
                    pCustEmail:
                <asp:TextBox ID="pCustEmailTextBox" runat="server" Text='<%# Bind("pCustEmail") %>' />
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
                            <h4 class="card-title" runat="server" id="nameTB"><%# Eval("pProjectName") %></h4>
                            <h6 class="card-subtitle text-muted">Project</h6>
                        </div>
                        <div class="card-block">
                            <p class="card-text" runat="server" id="employeeTB">Project Manager: <%# Eval("pEmployee") %>
                                
                            </p>
                            <asp:Button CssClass="card-link btn btn-success-outline" OnClick="ApproveBTN_OnClick" ID="ApproveBTN" runat="server" Text="Manage Project" />
                            <%--  <a href="#" class="card-link">Card link</a>
                            <a href="#" class="card-link">Another link</a>--%>
                        </div>
                    </div>
                </div>
                <asp:Label Visible="False" ID="ProjectIDLabel" runat="server" Text='<%# Eval("ProjectID") %>' />
                <asp:Label Visible="False" ID="pProjectNameLabel" runat="server" Text='<%# Eval("pProjectName") %>' />
                <asp:Label Visible="False" ID="pEmployeeLabel" runat="server" Text='<%# Eval("pEmployee") %>' />
                <asp:Label Visible="False" ID="pCustNameLabel" runat="server" Text='<%# Eval("pCustName") %>' />
                <asp:Label Visible="False" ID="pProjectStatusLabel" runat="server" Text='<%# Eval("pProjectStatus") %>' />
                <asp:Label Visible="False" ID="pCustUsernameLabel" runat="server" Text='<%# Eval("pCustUsername") %>' />
                <asp:Label Visible="False" ID="pCustEmailLabel" runat="server" Text='<%# Eval("pCustEmail") %>' />
              

            </ItemTemplate>
            <LayoutTemplate>
                <div style="" id="itemPlaceholderContainer" runat="server">
                    <span runat="server" id="itemPlaceholder" />
                </div>
                <div style="">
                </div>
            </LayoutTemplate>
            <SelectedItemTemplate>
                <span style="">ProjectID:
                    <asp:Label ID="ProjectIDLabel" runat="server" Text='<%# Eval("ProjectID") %>' />
                    <br />
                    pProjectName:
                    <asp:Label ID="pProjectNameLabel" runat="server" Text='<%# Eval("pProjectName") %>' />
                    <br />
                    pEmployee:
                    <asp:Label ID="pEmployeeLabel" runat="server" Text='<%# Eval("pEmployee") %>' />
                    <br />
                    pCustName:
                    <asp:Label ID="pCustNameLabel" runat="server" Text='<%# Eval("pCustName") %>' />
                    <br />
                    pProjectStatus:
                    <asp:Label ID="pProjectStatusLabel" runat="server" Text='<%# Eval("pProjectStatus") %>' />
                    <br />
                    pCustUsername:
                    <asp:Label ID="pCustUsernameLabel" runat="server" Text='<%# Eval("pCustUsername") %>' />
                    <br />
                    pCustEmail:
                <asp:Label ID="pCustEmailLabel" runat="server" Text='<%# Eval("pCustEmail") %>' />
                    <br />
                <br />
                </span>
            </SelectedItemTemplate>
        </asp:ListView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:impressiondesign_dbConnectionString %>" SelectCommand="SELECT * FROM [myProjects] WHERE (([pCustName] = @pCustName) AND ([pProjectStatus] = @pProjectStatus))">
            <SelectParameters>
                <asp:SessionParameter Name="pCustName" SessionField="sName" Type="String" />
                <asp:Parameter DefaultValue="Ongoing" Name="pProjectStatus" Type="String" />
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

