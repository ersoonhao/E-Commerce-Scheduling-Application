<%@ Page Title="" Language="C#" EnableEventValidation="false" MasterPageFile="~/AdminMasterpage.master" AutoEventWireup="true" CodeFile="Test.aspx.cs" Inherits="Test" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
                                 <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="ProjectDetailsID" DataSourceID="SqlDataSource1">
                                <Columns>
                                    <asp:CommandField ShowDeleteButton="True" />
                                    <asp:BoundField DataField="pdTask" HeaderText="pdTask" SortExpression="pdTask" />
                                    <asp:BoundField DataField="pdDescription" HeaderText="pdDescription" SortExpression="pdDescription" />
                                    <asp:BoundField DataField="pdStatus" HeaderText="pdStatus" SortExpression="pdStatus" />
                                    <asp:BoundField DataField="ProjectDetailsID" HeaderText="ProjectDetailsID" InsertVisible="False" ReadOnly="True" SortExpression="ProjectDetailsID" />
                                </Columns>
                            </asp:GridView>

                            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConflictDetection="CompareAllValues" ConnectionString="<%$ ConnectionStrings:impressiondesign_dbConnectionString %>" DeleteCommand="DELETE FROM [myProjectDetails] WHERE [ProjectDetailsID] = @original_ProjectDetailsID AND (([pdTask] = @original_pdTask) OR ([pdTask] IS NULL AND @original_pdTask IS NULL)) AND (([pdDescription] = @original_pdDescription) OR ([pdDescription] IS NULL AND @original_pdDescription IS NULL)) AND (([pdStatus] = @original_pdStatus) OR ([pdStatus] IS NULL AND @original_pdStatus IS NULL))" InsertCommand="INSERT INTO [myProjectDetails] ([pdTask], [pdDescription], [pdStatus]) VALUES (@pdTask, @pdDescription, @pdStatus)" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT [pdTask], [pdDescription], [pdStatus], [ProjectDetailsID] FROM [myProjectDetails]" UpdateCommand="UPDATE [myProjectDetails] SET [pdTask] = @pdTask, [pdDescription] = @pdDescription, [pdStatus] = @pdStatus WHERE [ProjectDetailsID] = @original_ProjectDetailsID AND (([pdTask] = @original_pdTask) OR ([pdTask] IS NULL AND @original_pdTask IS NULL)) AND (([pdDescription] = @original_pdDescription) OR ([pdDescription] IS NULL AND @original_pdDescription IS NULL)) AND (([pdStatus] = @original_pdStatus) OR ([pdStatus] IS NULL AND @original_pdStatus IS NULL))">
                                <DeleteParameters>
                                    <asp:Parameter Name="original_ProjectDetailsID" Type="Int32" />
                                    <asp:Parameter Name="original_pdTask" Type="String" />
                                    <asp:Parameter Name="original_pdDescription" Type="String" />
                                    <asp:Parameter Name="original_pdStatus" Type="String" />
                                </DeleteParameters>
                                <InsertParameters>
                                    <asp:Parameter Name="pdTask" Type="String" />
                                    <asp:Parameter Name="pdDescription" Type="String" />
                                    <asp:Parameter Name="pdStatus" Type="String" />
                                </InsertParameters>
                                <UpdateParameters>
                                    <asp:Parameter Name="pdTask" Type="String" />
                                    <asp:Parameter Name="pdDescription" Type="String" />
                                    <asp:Parameter Name="pdStatus" Type="String" />
                                    <asp:Parameter Name="original_ProjectDetailsID" Type="Int32" />
                                    <asp:Parameter Name="original_pdTask" Type="String" />
                                    <asp:Parameter Name="original_pdDescription" Type="String" />
                                    <asp:Parameter Name="original_pdStatus" Type="String" />
                                </UpdateParameters>
                            </asp:SqlDataSource>
</asp:Content>

