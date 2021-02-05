<%@ Page Title="" Language="C#" MasterPageFile="~/AdminMasterpage.master" AutoEventWireup="true" CodeFile="Reminder.aspx.cs" Inherits="Reminder" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <!-- Custom box css -->
    <link href="assets/plugins/custombox/css/custombox.min.css" rel="stylesheet">

    <style>
        .button-width {
            width: 120px;
        }
    </style>
    <div class="container">

        <div ng-app="">
            <%--  <div class="row">--%>
            <div runat="server" id="try" class="row">
                <div class="col-xs-12">
                    <h4 runat="server" id="testLB"></h4>
                    <div class="page-title-box">
                        <h4 class="page-title">Reminder</h4>
                        <div class="clearfix"></div>
                    </div>
                </div>
            </div>
            <div class="row">

                <asp:ListView ID="ListView1" OnItemDataBound="ListView1_OnItemDataBound" runat="server" DataSourceID="SqlDataSource1" DataKeyNames="ReminderID">

                    <EditItemTemplate>
                        <td runat="server" style="">ReminderID:
                        <asp:Label ID="ReminderIDLabel1" runat="server" Text='<%# Eval("ReminderID") %>' />
                            <br />
                            rDate:
                        <asp:TextBox ID="rDateTextBox" runat="server" Text='<%# Bind("rDate") %>' />
                            <br />
                            rEvent:
                        <asp:TextBox ID="rEventTextBox" runat="server" Text='<%# Bind("rEvent") %>' />
                            <br />
                            rProject:
                                <asp:TextBox ID="rProjectTextBox" runat="server" Text='<%# Bind("rProject") %>' />
                            <br />
                            rTime:
                                <asp:TextBox ID="rTimeTextBox" runat="server" Text='<%# Bind("rTime") %>' />
                            <br />
                            rStatus:
                                <asp:TextBox ID="rStatusTextBox" runat="server" Text='<%# Bind("rStatus") %>' />
                            <br />
                            rEmployee:
                        <asp:TextBox ID="rEmployeeTextBox" runat="server" Text='<%# Bind("rEmployee") %>' />
                            <br />
                            <asp:Button ID="UpdateButton" runat="server" CommandName="Update" Text="Update" />
                            <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Cancel" />
                        </td>
                    </EditItemTemplate>
                    <EmptyDataTemplate>
                        <table style="">
                            <tr>
                                <td>No data was returned.</td>
                            </tr>
                        </table>
                    </EmptyDataTemplate>
                    <InsertItemTemplate>
                        <td runat="server" style="">rDate:
                        <asp:TextBox ID="rDateTextBox" runat="server" Text='<%# Bind("rDate") %>' />
                            <br />
                            rEvent:
                        <asp:TextBox ID="rEventTextBox" runat="server" Text='<%# Bind("rEvent") %>' />
                            <br />
                            rProject:
                                <asp:TextBox ID="rProjectTextBox" runat="server" Text='<%# Bind("rProject") %>' />
                            <br />
                            rTime:
                                <asp:TextBox ID="rTimeTextBox" runat="server" Text='<%# Bind("rTime") %>' />
                            <br />
                            rStatus:
                                <asp:TextBox ID="rStatusTextBox" runat="server" Text='<%# Bind("rStatus") %>' />
                            <br />
                            rEmployee:
                        <asp:TextBox ID="rEmployeeTextBox" runat="server" Text='<%# Bind("rEmployee") %>' />
                            <br />
                            <asp:Button ID="InsertButton" runat="server" CommandName="Insert" Text="Insert" />
                            <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Clear" />
                        </td>
                    </InsertItemTemplate>
                    <ItemTemplate>
                        <div class="col-sm-3 col-xs-12">
                            <div runat="server" id="divColor" class="card card-inverse">
                                <div class="card-block">
                                    <h3 class="card-title"><%# Eval("rProject") %></h3>
                                  
                                        <h6 class="card-title">
                                       <%# Eval("rEvent") %>
                                    </h6>
                                    <p class="card-text">
                                       <%# Eval("rDate") %>
                                    </p>
                                     <p class="card-text">
                                       <%# Eval("rTime") %>
                                    </p>
                                  <asp:Button ID="DeleteButton" CssClass="btn btn-warning" runat="server" CommandName="Delete" Text="Delete" />
                                </div>
                            </div>
                        </div>
                      
                        <asp:Label Visible="False" ID="ReminderIDLabel" runat="server" Text='<%# Eval("ReminderID") %>' />
                          
                        <asp:Label Visible="False" ID="rDateLabel" runat="server" Text='<%# Eval("rDate") %>' />
                          
                        <asp:Label Visible="False" ID="rEventLabel" runat="server" Text='<%# Eval("rEvent") %>' />
                         
                        <asp:Label Visible="False" ID="rProjectLabel" runat="server" Text='<%# Eval("rProject") %>' />
                         
                        <asp:Label Visible="False" ID="rTimeLabel" runat="server" Text='<%# Eval("rTime") %>' />
                         
                        <asp:Label Visible="False" ID="rStatusLabel" runat="server" Text='<%# Eval("rStatus") %>' />
                          
                        <asp:Label Visible="False" ID="rEmployeeLabel" runat="server" Text='<%# Eval("rEmployee") %>' />
                          
                    </ItemTemplate>
                    <LayoutTemplate>
                        <table runat="server" border="0" style="">
                            <tr id="itemPlaceholderContainer" runat="server">
                                <td id="itemPlaceholder" runat="server"></td>
                            </tr>
                        </table>
                        <div style="">
                        </div>
                    </LayoutTemplate>
                    <SelectedItemTemplate>
                        <td runat="server" style="">ReminderID:
                        <asp:Label ID="ReminderIDLabel" runat="server" Text='<%# Eval("ReminderID") %>' />
                            <br />
                            rDate:
                        <asp:Label ID="rDateLabel" runat="server" Text='<%# Eval("rDate") %>' />
                            <br />
                            rEvent:
                        <asp:Label ID="rEventLabel" runat="server" Text='<%# Eval("rEvent") %>' />
                            <br />
                            rProject:
                                <asp:Label ID="rProjectLabel" runat="server" Text='<%# Eval("rProject") %>' />
                            <br />
                            rTime:
                                <asp:Label ID="rTimeLabel" runat="server" Text='<%# Eval("rTime") %>' />
                            <br />
                            rStatus:
                                <asp:Label ID="rStatusLabel" runat="server" Text='<%# Eval("rStatus") %>' />
                            <br />
                            rEmployee:
                        <asp:Label ID="rEmployeeLabel" runat="server" Text='<%# Eval("rEmployee") %>' />
                            <br />
                            <asp:Button ID="DeleteButton" runat="server" CommandName="Delete" Text="Delete" />
                        </td>
                    </SelectedItemTemplate>
                </asp:ListView>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:impressiondesign_dbConnectionString %>" SelectCommand="SELECT * FROM [myReminders] WHERE ([rEmployee] = @rEmployee)" DeleteCommand="DELETE FROM [myReminders] WHERE [ReminderID] = @original_ReminderID" InsertCommand="INSERT INTO [myReminders] ([rDate], [rEvent], [rProject], [rTime], [rStatus], [rEmployee]) VALUES (@rDate, @rEvent, @rProject, @rTime, @rStatus, @rEmployee)" OldValuesParameterFormatString="original_{0}" UpdateCommand="UPDATE [myReminders] SET [rDate] = @rDate, [rEvent] = @rEvent, [rProject] = @rProject, [rTime] = @rTime, [rStatus] = @rStatus, [rEmployee] = @rEmployee WHERE [ReminderID] = @original_ReminderID">
                    <DeleteParameters>
                        <asp:Parameter Name="original_ReminderID" Type="Int32" />
                    </DeleteParameters>
                    <InsertParameters>
                        <asp:Parameter Name="rDate" Type="String" />
                        <asp:Parameter Name="rEvent" Type="String" />
                        <asp:Parameter Name="rProject" Type="String" />
                        <asp:Parameter Name="rTime" Type="String" />
                        <asp:Parameter Name="rStatus" Type="String" />
                        <asp:Parameter Name="rEmployee" Type="String" />
                    </InsertParameters>
                    <SelectParameters>
                        <asp:SessionParameter Name="rEmployee" SessionField="sName" Type="String" />
                    </SelectParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="rDate" Type="String" />
                        <asp:Parameter Name="rEvent" Type="String" />
                        <asp:Parameter Name="rProject" Type="String" />
                        <asp:Parameter Name="rTime" Type="String" />
                        <asp:Parameter Name="rStatus" Type="String" />
                        <asp:Parameter Name="rEmployee" Type="String" />
                        <asp:Parameter Name="original_ReminderID" Type="Int32" />
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

