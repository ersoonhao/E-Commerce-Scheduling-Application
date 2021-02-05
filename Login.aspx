<%@ Page Language="C#" AutoEventWireup="true" EnableEventValidation ="false" CodeFile="Login.aspx.cs" Inherits="Login" %>

<!DOCTYPE html>

<html>

<!-- Mirrored from coderthemes.com/uplon_1.1/pages-login.html by HTTrack Website Copier/3.x [XR&CO'2014], Fri, 08 Jul 2016 13:33:29 GMT -->
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="A fully featured admin theme which can be used to build CRM, CMS, etc.">
    <meta name="author" content="Coderthemes">

    <!-- App Favicon -->
    <link rel="shortcut icon" href="assets/images/favicon.ico">

    <!-- App title -->
    <title>Impression Admin Portal</title>

    <!-- App CSS -->
    <link href="assets/css/style.css" rel="stylesheet" type="text/css" />

    <!-- HTML5 Shiv and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.3.0/respond.min.js"></script>
        <![endif]-->

    <script src="assets/js/modernizr.min.js"></script>

    <script>
        (function (i, s, o, g, r, a, m) {
            i['GoogleAnalyticsObject'] = r; i[r] = i[r] || function () {
                (i[r].q = i[r].q || []).push(arguments)
            }, i[r].l = 1 * new Date(); a = s.createElement(o),
            m = s.getElementsByTagName(o)[0]; a.async = 1; a.src = g; m.parentNode.insertBefore(a, m)
        })(window, document, 'script', '../../www.google-analytics.com/analytics.js', 'ga');

        ga('create', 'UA-79190402-1', 'auto');
        ga('send', 'pageview');

        </script>

</head>


<body>
    <form runat="server">
        <div class="account-pages"></div>
        <div class="clearfix"></div>
        <div class="wrapper-page">

            <div class="account-bg">
                <div class="card-box m-b-0">
                    <div class="text-xs-center m-t-20">
                        <asp:Image ID="Image1" runat="server" ImageUrl="~/Uploads/Impression.PNG" Class="img-responsive"/>
                    </div>
                    <div class="m-t-30 m-b-20">
                        <div class="col-xs-12 text-xs-center">
                            <h6 class="text-muted text-uppercase m-b-0 m-t-0">Sign In</h6>
                        </div>
                        <form class="form-horizontal m-t-20" action="http://coderthemes.com/uplon_1.1/index.html">

                            <div class="form-group ">
                                <div class="col-xs-12">
                                    <asp:TextBox CssClass="form-control" placeholder="Username" ID="usernameTB" runat="server"></asp:TextBox>
                                </div>
                            </div>

                            <div class="form-group">
                                <div class="col-xs-12">
                                    <asp:TextBox CssClass="form-control" TextMode="Password" placeholder="Password" ID="passwordTB" runat="server"></asp:TextBox>
                                    <span style="color: red;" id="ErrorLBL" runat="server"></span>
                                </div>
                            </div>

                            <div class="form-group text-center m-t-30">
                                <div class="col-xs-12">
                                    <asp:Button CssClass="btn btn-success" ID="loginBTN" runat="server" Text="Login" OnClick="loginBTN_Click" />
                                </div>
                            </div>

                        </form>

                    </div>
                </div>
            </div>
            <!-- end card-box-->
        </div>
        <!-- end wrapper page -->
        

        <script>
            var resizefunc = [];
        </script>

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

        <!-- App js -->
        <script src="assets/js/jquery.core.js"></script>
        <script src="assets/js/jquery.app.js"></script>
    </form>
</body>

<!-- Mirrored from coderthemes.com/uplon_1.1/pages-login.html by HTTrack Website Copier/3.x [XR&CO'2014], Fri, 08 Jul 2016 13:33:29 GMT -->
</html>
