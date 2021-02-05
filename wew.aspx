<%@ Page Language="C#" AutoEventWireup="true" CodeFile="wew.aspx.cs" Inherits="wew" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="BookingID" DataSourceID="SqlDataSource1">
            <Columns>
                <asp:BoundField DataField="BookingID" HeaderText="BookingID" InsertVisible="False" ReadOnly="True" SortExpression="BookingID" />
                <asp:BoundField DataField="bDate" HeaderText="bDate" SortExpression="bDate" />
                <asp:BoundField DataField="bStatus" HeaderText="bStatus" SortExpression="bStatus" />
                <asp:BoundField DataField="bTime" HeaderText="bTime" SortExpression="bTime" />
            </Columns>
        </asp:GridView> 
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:impressiondesign_dbConnectionString %>" SelectCommand="SELECT * FROM [myBookingDates]"></asp:SqlDataSource>
    </div>
    </form>
</body>
</html>
