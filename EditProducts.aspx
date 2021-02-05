<%@ Page Title="" Language="C#" MasterPageFile="~/AdminMasterpage.master" AutoEventWireup="true" CodeFile="EditProducts.aspx.cs" Inherits="EditProducts" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="container">

        <div class="row">
            <div class="col-xs-12">
                <div class="page-title-box">
                    <h4 class="page-title">Manage Products</h4>
                    <div class="clearfix"></div>
                </div>
            </div>
        </div>
        <!-- end row -->

        <div ng-app="">
            <div class="row">
                <div class="col-sm-12">
                    <div class="card-box">
                        <div class="row">
                            <div class="col-lg-12 col-sm-12 col-xs-12 col-md-12 col-xl-6">
                                <fieldset class="form-group">
                                    <label for="exampleSelect1">Product Name</label>
                                    <asp:TextBox ID="NameTB" ng-model="name" CssClass="form-control" runat="server"></asp:TextBox>
                                </fieldset>
                                <fieldset class="form-group">
                                    <label for="exampleSelect1">Price</label>
                                    <asp:TextBox ID="PriceTB" CssClass="form-control" runat="server"></asp:TextBox>
                                </fieldset>
                                <fieldset class="form-group">
                                    <label for="exampleSelect1">Quantity</label>
                                    <asp:TextBox ID="QtyTB" CssClass="form-control" runat="server"></asp:TextBox>
                                </fieldset>
                                
                                <fieldset class="form-group">
                                    <label for="exampleTextarea">Description</label>
                                    <asp:TextBox ID="DescriptionTB" CssClass="form-control" TextMode="MultiLine" runat="server"></asp:TextBox>
                                </fieldset>
                                <fieldset class="form-group">
                                    <label for="exampleSelect1">Image</label>
                                    <br/>
                                    <asp:FileUpload ID="FileUpload1" runat="server" />
                                </fieldset>
                                <asp:Button ID="SubmitBTN" CssClass="btn btn-primary" runat="server" Text="Update Product" OnClick="SubmitBTN_OnClick" />
                                <asp:Button ID="Button1" CssClass="btn btn-primary" runat="server" Text="Back" OnClick="Button1_OnClick" />
                            </div>
                            <!-- end col -->

                            <div class="col-lg-12 col-sm-12 col-xs-12 col-md-12 col-xl-6 m-t-sm-40">
                                <div class="col-sm-12 col-lg-12 col-xs-12">

                                    <!-- Simple card -->
                                    <div class="card">
                                        <img class="card-img-top img-fluid" runat="server" id="img1" src="" alt="Card image cap">
                                        <div class="card-block">
                                            <h3 class="card-title" runat="server" id="nameLBL"></h3>
                                            <h5 class="card-title" runat="server" id="priceLBL">$12</h5>
                                            <span class="card-title" runat="server" id="qtyLBL">4</span>
                                            <p class="card-text" runat="server" id="descriptionLBL">
                                                Some quick example text to build on the card title and make
                                            up the bulk of the card's content.
                                            </p>
                                        </div>
                                    </div>

                                </div>


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
    </div>
    <asp:DetailsView Visible="False" ID="DetailsView1" runat="server" Height="50px" Width="125px" AutoGenerateRows="False" DataKeyNames="ProductID" DataSourceID="SqlDataSource1">
        <Fields>
            <asp:BoundField DataField="ProductID" HeaderText="ProductID" InsertVisible="False" ReadOnly="True" SortExpression="ProductID" />
            <asp:BoundField DataField="pName" HeaderText="pName" SortExpression="pName" />
            <asp:BoundField DataField="pPrice" HeaderText="pPrice" SortExpression="pPrice" />
            <asp:BoundField DataField="pDescription" HeaderText="pDescription" SortExpression="pDescription" />
            <asp:BoundField DataField="pImage" HeaderText="pImage" SortExpression="pImage" />
            <asp:BoundField DataField="pQty" HeaderText="pQty" SortExpression="pQty" />
        </Fields>
    </asp:DetailsView>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:impressiondesign_dbConnectionString %>" SelectCommand="SELECT * FROM [myProducts] WHERE ([ProductID] = @ProductID)">
        <SelectParameters>
            <asp:QueryStringParameter Name="ProductID" QueryStringField="ProductID" Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>
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

    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/angular.js/2.0.0-beta.17/Rx.js"></script>

</asp:Content>


