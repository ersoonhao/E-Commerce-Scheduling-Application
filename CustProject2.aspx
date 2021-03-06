﻿<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="CustProject2.aspx.cs" Inherits="CustProject2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <!-- Custom box css -->
    <link href="assets/plugins/custombox/css/custombox.min.css" rel="stylesheet">

    <style>
        .button-width {
            width: 120px;
        }
    </style>
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
        <div class="row">
            <div class="col-md-6">
                <div class="row">
                    <asp:ListView ID="ListView1" runat="server" DataSourceID="SqlDataSource1" DataKeyNames="myProjectImageID">


                        


                        <EditItemTemplate>
                            <td runat="server" style="">pdImage:
                        <asp:TextBox ID="pdImageTextBox" runat="server" Text='<%# Bind("pdImage") %>' />
                                <br />
                                pdDescription:
                        <asp:TextBox ID="pdDescriptionTextBox" runat="server" Text='<%# Bind("pdDescription") %>' />
                                <br />
                                myProjectImageID:
                        <asp:Label ID="myProjectImageIDLabel1" runat="server" Text='<%# Eval("myProjectImageID") %>' />
                                <br />
                                <asp:Button ID="UpdateButton" runat="server" CommandName="Update" Text="Update" />
                                <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Cancel" />
                            </td>
                        </EditItemTemplate>
                        <EmptyDataTemplate>
                          <div class="col-sm-12 col-xs-12">
                                <div class="card card-inverse card-warning text-xs-center">
                                    <div class="card-block">
                                        <blockquote class="card-blockquote">
                                            <p>No post found. Add Posts to get started.</p>
                                        </blockquote>
                                    </div>
                                </div>
                            </div>
                        </EmptyDataTemplate>
                        <InsertItemTemplate>
                            <td runat="server" style="">pdImage:
                        <asp:TextBox ID="pdImageTextBox" runat="server" Text='<%# Bind("pdImage") %>' />
                                <br />
                                pdDescription:
                        <asp:TextBox ID="pdDescriptionTextBox" runat="server" Text='<%# Bind("pdDescription") %>' />
                                <br />
                                <asp:Button ID="InsertButton" runat="server" CommandName="Insert" Text="Insert" />
                                <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Clear" />
                            </td>
                        </InsertItemTemplate>
                        <ItemTemplate>
                            <div class="col-sm-12 col-lg-12 col-xs-12">

                                <!-- Simple card -->
                                <div class="card">
                                    <img class="card-img-top img-fluid" src="<%# Eval("pdImage") %>" alt="Card image cap">
                                    <div class="card-block">
                                        <p class="card-text">
                                           <%# Eval("pdDescription") %>
                                        </p>
                                    </div>
                                </div>

                            </div>
                            <%-- <td runat="server" style="">pdImage:
                                <asp:Label ID="pdImageLabel" runat="server" Text='<%# Eval("pdImage") %>' />
                                <br />
                                pdDescription:
                                <asp:Label ID="pdDescriptionLabel" runat="server" Text='<%# Eval("pdDescription") %>' />
                                <br />
                                myProjectImageID:
                                <asp:Label ID="myProjectImageIDLabel" runat="server" Text='<%# Eval("myProjectImageID") %>' />
                                <br />
                                <asp:Button ID="DeleteButton" runat="server" CommandName="Delete" Text="Delete" />
                            </td>--%>
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
                            <td runat="server" style="">pdImage:
                        <asp:Label ID="pdImageLabel" runat="server" Text='<%# Eval("pdImage") %>' />
                                <br />
                                pdDescription:
                        <asp:Label ID="pdDescriptionLabel" runat="server" Text='<%# Eval("pdDescription") %>' />
                                <br />
                                myProjectImageID:
                        <asp:Label ID="myProjectImageIDLabel" runat="server" Text='<%# Eval("myProjectImageID") %>' />
                                <br />
                                <asp:Button ID="DeleteButton" runat="server" CommandName="Delete" Text="Delete" />
                            </td>
                        </SelectedItemTemplate>
                    </asp:ListView>
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:impressiondesign_dbConnectionString %>" SelectCommand="SELECT [pdImage], [pdDescription], [myProjectImageID] FROM [myProjectImages] WHERE ([pdProjectID] = @pdProjectID)" ConflictDetection="CompareAllValues" DeleteCommand="DELETE FROM [myProjectImages] WHERE [myProjectImageID] = @original_myProjectImageID" InsertCommand="INSERT INTO [myProjectImages] ([pdImage], [pdDescription]) VALUES (@pdImage, @pdDescription)" OldValuesParameterFormatString="original_{0}" UpdateCommand="UPDATE [myProjectImages] SET [pdImage] = @pdImage, [pdDescription] = @pdDescription WHERE [myProjectImageID] = @original_myProjectImageID AND (([pdImage] = @original_pdImage) OR ([pdImage] IS NULL AND @original_pdImage IS NULL)) AND (([pdDescription] = @original_pdDescription) OR ([pdDescription] IS NULL AND @original_pdDescription IS NULL))">
                        <DeleteParameters>
                            <asp:Parameter Name="original_myProjectImageID" Type="Int32" />
                        </DeleteParameters>
                        <InsertParameters>
                            <asp:Parameter Name="pdImage" Type="String" />
                            <asp:Parameter Name="pdDescription" Type="String" />
                        </InsertParameters>
                        <SelectParameters>
                            <asp:QueryStringParameter Name="pdProjectID" QueryStringField="ProjectID" Type="String" />
                        </SelectParameters>
                        <UpdateParameters>
                            <asp:Parameter Name="pdImage" Type="String" />
                            <asp:Parameter Name="pdDescription" Type="String" />
                            <asp:Parameter Name="original_myProjectImageID" Type="Int32" />
                            <asp:Parameter Name="original_pdImage" Type="String" />
                            <asp:Parameter Name="original_pdDescription" Type="String" />
                        </UpdateParameters>
                    </asp:SqlDataSource>

                </div>
            </div>

            <div class="col-md-6">

                <div class="card-box table-responsive">
                    <h4 class="m-t-0 header-title"><b>Add Recipient</b></h4>
                    <br />
                    <asp:GridView CssClass="table table-hover" ID="GridView1" GridLines="None" runat="server" DataSourceID="SqlDataSource2" AutoGenerateColumns="False" DataKeyNames="ProjectDetailsID">
                        <Columns>
                            <asp:TemplateField ShowHeader="False">
                                <ItemTemplate>
                                    <asp:LinkButton ID="LinkButton1" CommandName="Delete" runat="server">Delete</asp:LinkButton>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:BoundField DataField="pdTask" HeaderText="Task" SortExpression="pdTask" />
                            <asp:BoundField DataField="pdStatus" HeaderText="Status" SortExpression="pdStatus" />
                            <asp:BoundField DataField="ProjectDetailsID" Visible="False" HeaderText="Product Details" InsertVisible="False" ReadOnly="True" SortExpression="ProjectDetailsID" />
                        </Columns>
                    </asp:GridView>
                    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:impressiondesign_dbConnectionString %>" DeleteCommand="DELETE FROM [myProjectDetails] WHERE [ProjectDetailsID] = @ProjectDetailsID" InsertCommand="INSERT INTO [myProjectDetails] ([pdTask], [pdStatus]) VALUES (@pdTask, @pdStatus)" SelectCommand="SELECT [pdTask], [pdStatus], [ProjectDetailsID] FROM [myProjectDetails] WHERE ([pdProjectID] = @pdProjectID)" UpdateCommand="UPDATE [myProjectDetails] SET [pdTask] = @pdTask, [pdStatus] = @pdStatus WHERE [ProjectDetailsID] = @ProjectDetailsID">
                        <DeleteParameters>
                            <asp:Parameter Name="ProjectDetailsID" Type="Int32" />
                        </DeleteParameters>
                        <InsertParameters>
                            <asp:Parameter Name="pdTask" Type="String" />
                            <asp:Parameter Name="pdStatus" Type="String" />
                        </InsertParameters>
                        <SelectParameters>
                            <asp:QueryStringParameter Name="pdProjectID" QueryStringField="ProjectID" Type="String" />
                        </SelectParameters>
                        <UpdateParameters>
                            <asp:Parameter Name="pdTask" Type="String" />
                            <asp:Parameter Name="pdStatus" Type="String" />
                            <asp:Parameter Name="ProjectDetailsID" Type="Int32" />
                        </UpdateParameters>
                    </asp:SqlDataSource>
                </div>

                <div class="card card-inverse" style="background-color: #333; border-color: #333;">
                    <div class="card-block">
                        <h3 class="card-title">Add Image</h3>
                        <p class="card-text">
                            Add Image and description to update customer about renovation progress
                        </p>
                        <a href="AddProjectImage2.aspx" class="btn btn-primary waves-effect waves-light m-r-5 m-b-10">Add Posts</a>

                        <%--<a href="#" class="btn btn-warning">Add Updates</a>--%>
                    </div>
                </div>
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


