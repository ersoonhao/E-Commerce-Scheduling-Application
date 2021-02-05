<%@ Page Title="" Language="C#" MasterPageFile="~/AdminMasterpage.master" EnableEventValidation="false" AutoEventWireup="true" CodeFile="CreateProducts.aspx.cs" Inherits="CreateProducts" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="container">

        <div class="row">
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
                        <li class="active">Form elements
                        </li>
                    </ol>
                    <div class="clearfix"></div>
                </div>
            </div>
        </div>
        <!-- end row -->


        <div class="row">
            <div class="col-sm-8 col-sm-push-2">
                <div class="card-box">

                    <h4 class="header-title m-t-0 m-b-30">Add a product</h4>

                    <div class="row">
                        <div class="col-lg-12 col-sm-12 col-xs-12 col-md-12 col-xl-12">
                            <div class="form-group">
                                <label for="exampleSelect1">Product Name</label>
                                <asp:TextBox ID="NameTB" CssClass="form-control" runat="server"></asp:TextBox>
                            </div>
                            <div class="form-group">
                                <label for="exampleSelect1">Price</label>
                                <asp:TextBox ID="PriceTB" CssClass="form-control" runat="server"></asp:TextBox>
                            </div>
                            <div class="form-group">
                                <label for="exampleSelect1">Quantity</label>
                                <asp:TextBox ID="QtyTB" CssClass="form-control" runat="server"></asp:TextBox>
                            </div>
                            <div class="form-group">
                                <label for="exampleTextarea">Description</label>
                                <asp:TextBox ID="DescriptionTB" CssClass="form-control" TextMode="MultiLine" runat="server"></asp:TextBox>
                            </div>
                            <div class="form-group">
                                <label for="exampleSelect1">Upload Image</label>
                                <br />
                                <asp:FileUpload ID="FileUpload1" runat="server" />
                            </div>
                             <asp:Button ID="SubmitBTN" CssClass="btn btn-primary" runat="server" Text="Add Product" OnClick="SubmitBTN_OnClick" />
                        </div>

                       
                    </div>
                    <!-- end col -->

                    <%--<div class="col-lg-12 col-sm-12 col-xs-12 col-md-12 col-xl-6 m-t-sm-40">

                            <fieldset>
                                <div class="form-group">
                                    <asp:GridView ID="GridView1" GridLines="none" CssClass="table table-hover" runat="server" OnRowDataBound="GridView1_RowDataBound"></asp:GridView>

                                </div>

                            </fieldset>

                        </div>--%>

                    <!-- end col -->

                </div>
                <!-- end row -->
            </div>
        </div>
        <!-- end col -->
    </div>
    <!-- end row -->
    </div>
</asp:Content>



