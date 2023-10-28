﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Views/DashBoard/Admin_Homepage/Admin_Master.Master" AutoEventWireup="true" CodeBehind="Manage_FAQ.aspx.cs" Inherits="Gabay_Final_V2.Views.Modules.Admin_Modules.Manage_FAQ" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <h1>Frequently Asked Questions</h1>
            </div>
        </div>
        <div class="row">
            <div class="col-md-12">
                <h3>Add a New FAQ</h3>
                <div class="input-group">
                    <asp:TextBox ID="txtNewQuestion" runat="server" CssClass="form-control" placeholder="New Question"></asp:TextBox>
                    <asp:TextBox ID="txtNewAnswer" runat="server" CssClass="form-control" placeholder="New Answer"></asp:TextBox>
                    <div class="input-group-append">
                        <asp:Button ID="btnInsertFAQ" runat="server" CssClass="btn btn-primary" Text="Insert" OnClick="btnAddFAQ_Click" />
                    </div>
                </div>
            </div>
        </div>
        <br>
        <div class="row">
            <div class="col-md-12">
                <asp:Repeater ID="FAQRepeater" runat="server" OnItemCommand="FAQRepeater_ItemCommand">
                    <HeaderTemplate>
                        <table class="table table-striped">
                            <thead>
                                <tr>
                                    <th>FAQ ID</th>
                                    <th>Question</th>
                                    <th>Answer</th>
                                    <th>Actions</th>
                                </tr>
                            </thead>
                            <tbody>
                    </HeaderTemplate>
                    <ItemTemplate>
                        <tr>
                            <td><%# Eval("FAQID") %></td>
                            <td><%# Eval("Question") %></td>
                            <td><%# Eval("Answer") %></td>
                            <td>
                                <asp:LinkButton ID="LinkButton1" runat="server" CommandName="Edit" CommandArgument='<%# Eval("FAQID") %>' Text="Edit"
                                    OnClientClick='<%# "return showFAQ(" + Eval("FAQID") + ", \"" + Eval("Question") + "\", \"" + Eval("Answer") + "\");" %>' />
                               <%-- <asp:LinkButton ID="lnkDelete" runat="server" CommandName="Delete" CommandArgument='<%# Eval("FAQID") %>' Text="Delete" OnClientClick="return confirm('Are you sure you want to delete this FAQ?');" />--%>
                                <asp:LinkButton ID="lnkDelete" runat="server"  OnClientClick='<%# "return showConfirmationModal(" + Eval("FAQID") + ");" %>'>Delete</asp:LinkButton>
                            </td>
                        </tr>
                    </ItemTemplate>
                    <FooterTemplate>
                        </tbody>
                </table>
                    </FooterTemplate>
                </asp:Repeater>
            </div>
        </div>
    </div>
    <asp:HiddenField ID="hdEditFAQID" runat="server" />
    <!-- Modal for editing FAQ -->
    <div id="editModal" class="modal fade" role="dialog">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h4 class="modal-title">Edit FAQ</h4>
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                </div>
                <div class="modal-body">
                    <!-- Form for editing FAQ -->
                    <asp:TextBox ID="txtEditQuestion" runat="server" CssClass="form-control" placeholder="Edit Question"></asp:TextBox>
                    <asp:TextBox ID="txtEditAnswer" runat="server" CssClass="form-control" placeholder="Edit Answer"></asp:TextBox>
                </div>
                <div class="modal-footer">
                    <asp:Button ID="btnUpdateFAQ" runat="server" CssClass="btn btn-primary" Text="Update" OnClick="btnUpdateFAQ_Click" />
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                </div>
            </div>
        </div>
    </div>

    <%-- Delete Modal FAQ --%>
     <div class="modal fade" id="toDeleteModal" tabindex="-1" aria-labelledby="toDeleteModal" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    Delete this Question?
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancel</button>
                    <asp:Button ID="dltAnnouceBtn" CssClass="btn btn-primary" runat="server" Text="Proceed" OnClick="dltAnnouceBtn_Click" />
                </div>
            </div>
        </div>
    </div>
    

     <%-- Success modal --%>
    <div class="modal fade" id="successModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered">
            <div class="modal-content">
                <div class="modal-body bg-success text-center text-light">
                    <i class="bi bi-info-circle-fill"></i>
                    <p id="successMessage"></p>
                </div>
            </div>
        </div>
    </div>
     <%-- Error modal --%>
    <div class="modal fade" id="errorModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered">
            <div class="modal-content">
                <div class="modal-body bg-danger text-center text-light">
                    <i class="bi bi-exclamation-circle-fill"></i>
                    <p id="errorMessage"></p>
                </div>
            </div>
        </div>
    </div>
    <script>
        function showConfirmationModal(id) {
            // Store the ID in a hidden field or JavaScript variable to access it later in btnConfirmDelete_Click
            document.getElementById('<%= hdEditFAQID.ClientID %>').value = id;
            // Show the Bootstrap modal
            $('#toDeleteModal').modal('show');
            // Prevent the postback
            return false;
        }
        function getAnnouncementID(id) {
            document.getElementById('<%= hdEditFAQID.ClientID %>').value = id;
        }
    </script>
</asp:Content>
