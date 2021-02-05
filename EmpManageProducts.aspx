<%@ Page Title="" Language="C#" MasterPageFile="~/AdminMasterpage.master" EnableEventValidation="false" AutoEventWireup="true" CodeFile="EmpManageProducts.aspx.cs" Inherits="EmpManageProducts" %>

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
        <div class="row">
            <div class="col-xs-12">
                <h4 runat="server" id="testLB"></h4>
                <div class="page-title-box">
                    <h4 class="page-title">Manage Products</h4>
                    <div class="clearfix"></div>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-sm-3 col-xs-12">
                <div class="card card-inverse" style="background-color: #333; border-color: #333;">
                    <div class="card-block">
                        <h3 class="card-title">Add product</h3>
                        <br/>
                        <br/>
                        <p class="card-text">
                           Click the link below to start the product creation wizard.
                        </p>
                        <a href="CreateProducts.aspx" class="btn btn-primary">Create Products</a>
                    </div>
                </div>
            </div>
            <asp:ListView ID="ListView1" runat="server" DataSourceID="SqlDataSource1" DataKeyNames="ProductID">

                <EditItemTemplate>
                    <td runat="server" style="">ProductID:
                        <asp:Label ID="ProductIDLabel1" runat="server" Text='<%# Eval("ProductID") %>' />
                        <br />
                        pName:
                        <asp:TextBox ID="pNameTextBox" runat="server" Text='<%# Bind("pName") %>' />
                        <br />
                        pPrice:
                        <asp:TextBox ID="pPriceTextBox" runat="server" Text='<%# Bind("pPrice") %>' />
                        <br />
                        pDescription:
                                <asp:TextBox ID="pDescriptionTextBox" runat="server" Text='<%# Bind("pDescription") %>' />
                        <br />
                        pImage:
                                <asp:TextBox ID="pImageTextBox" runat="server" Text='<%# Bind("pImage") %>' />
                        <br />
                        pQty:
                                <asp:TextBox ID="pQtyTextBox" runat="server" Text='<%# Bind("pQty") %>' />
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
                    <td runat="server" style="">pName:
                        <asp:TextBox ID="pNameTextBox" runat="server" Text='<%# Bind("pName") %>' />
                        <br />
                        pPrice:
                        <asp:TextBox ID="pPriceTextBox" runat="server" Text='<%# Bind("pPrice") %>' />
                        <br />
                        pDescription:
                                <asp:TextBox ID="pDescriptionTextBox" runat="server" Text='<%# Bind("pDescription") %>' />
                        <br />
                        pImage:
                                <asp:TextBox ID="pImageTextBox" runat="server" Text='<%# Bind("pImage") %>' />
                        <br />
                        pQty:
                                <asp:TextBox ID="pQtyTextBox" runat="server" Text='<%# Bind("pQty") %>' />
                        <br />
                        <asp:Button ID="InsertButton" runat="server" CommandName="Insert" Text="Insert" />
                        <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Clear" />
                    </td>
                </InsertItemTemplate>
                <ItemTemplate>
                    <div class="col-sm-3 col-lg-3 col-xs-12">

                        <!-- Simple card -->
                        <div class="card">
                            <img class="card-img-top img-fluid" src="<%# Eval("pImage") %>" alt="Card image cap">
                            <div class="card-block">
                                <h4 class="card-title"><%# Eval("pName") %></h4>
                                <p class="card-text">
                                    <%# Eval("pDescription") %>
                                </p>
                                <asp:Button ID="Button1" CssClass="btn btn-danger" runat="server" CommandName="Delete" Text="Delete" />
                                 <asp:Button ID="EditBTN" OnClick="EditBTN_OnClick" CssClass="btn btn-primary" runat="server" Text="Edit" />
                            </div>
                        </div>

                    </div>
                           
                        <asp:Label Visible="False" ng-model="name" ID="ProductIDLabel" runat="server" Text='<%# Eval("ProductID") %>' />

                        <asp:Label Visible="False" ID="pNameLabel" runat="server" Text='<%# Eval("pName") %>' />
                     
                        <asp:Label Visible="False" ID="pPriceLabel" runat="server" Text='<%# Eval("pPrice") %>' />
                    
                        <asp:Label Visible="False" ID="pDescriptionLabel" runat="server" Text='<%# Eval("pDescription") %>' />
                   
                        <asp:Label Visible="False" ID="pImageLabel" runat="server" Text='<%# Eval("pImage") %>' />
                     
                        <asp:Label Visible="False" ID="pQtyLabel" runat="server" Text='<%# Eval("pQty") %>' />
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
                    <td runat="server" style="">ProductID:
                        <asp:Label ID="ProductIDLabel" runat="server" Text='<%# Eval("ProductID") %>' />
                        <br />
                        pName:
                        <asp:Label ID="pNameLabel" runat="server" Text='<%# Eval("pName") %>' />
                        <br />
                        pPrice:
                        <asp:Label ID="pPriceLabel" runat="server" Text='<%# Eval("pPrice") %>' />
                        <br />
                        pDescription:
                                <asp:Label ID="pDescriptionLabel" runat="server" Text='<%# Eval("pDescription") %>' />
                        <br />
                        pImage:
                                <asp:Label ID="pImageLabel" runat="server" Text='<%# Eval("pImage") %>' />
                        <br />
                        pQty:
                                <asp:Label ID="pQtyLabel" runat="server" Text='<%# Eval("pQty") %>' />
                        <br />
                        <asp:Button ID="DeleteButton" runat="server" CommandName="Delete" Text="Delete" />
                    </td>
                </SelectedItemTemplate>
            </asp:ListView>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:impressiondesign_dbConnectionString %>" SelectCommand="SELECT * FROM [myProducts]" DeleteCommand="DELETE FROM [myProducts] WHERE [ProductID] = @original_ProductID" InsertCommand="INSERT INTO [myProducts] ([pName], [pPrice], [pDescription], [pImage], [pQty]) VALUES (@pName, @pPrice, @pDescription, @pImage, @pQty)" OldValuesParameterFormatString="original_{0}" UpdateCommand="UPDATE [myProducts] SET [pName] = @pName, [pPrice] = @pPrice, [pDescription] = @pDescription, [pImage] = @pImage, [pQty] = @pQty WHERE [ProductID] = @original_ProductID">
                <DeleteParameters>
                    <asp:Parameter Name="original_ProductID" Type="Int32" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="pName" Type="String" />
                    <asp:Parameter Name="pPrice" Type="String" />
                    <asp:Parameter Name="pDescription" Type="String" />
                    <asp:Parameter Name="pImage" Type="String" />
                    <asp:Parameter Name="pQty" Type="Int32" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="pName" Type="String" />
                    <asp:Parameter Name="pPrice" Type="String" />
                    <asp:Parameter Name="pDescription" Type="String" />
                    <asp:Parameter Name="pImage" Type="String" />
                    <asp:Parameter Name="pQty" Type="Int32" />
                    <asp:Parameter Name="original_ProductID" Type="Int32" />
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





