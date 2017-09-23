<%@ Page Title="Categories" Language="C#" MasterPageFile="~/Pages/Settings.master" AutoEventWireup="true" CodeBehind="Categories.aspx.cs" Inherits="JustLoginWebsiteBoilerplate.Pages.Categories" %>

<asp:Content ID="Content1" ContentPlaceHolderID="SettingsHeadContent" runat="server">
    <link rel="stylesheet" href="../fonts/pe-icon-7-stroke/css/pe-icon-7-stroke.css" />
    <link rel="stylesheet" href="../fonts/pe-icon-7-stroke/css/helper.css" />
    <link rel="stylesheet" href="../Content/categories.css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="SettingsBodyContent" runat="server">
    <div class="row">
        <div class="col-lg-12">
            <div class="hpanel">
                <div class="panel-body tabContentBody">
                    <div>
                        <div class="dropdown pull-left">
                            <asp:DropDownList ID="CategoriesDropDownList" runat="server" CssClass="form-control" Width="100%" AutoPostBack="True"
                                OnSelectedIndexChanged="CategoriesDropDownList_SelectedIndexChanged">
                            </asp:DropDownList>
                        </div>
                    </div>
                    <a href="#" class="btn btn-success btn-sm pull-right" data-toggle="modal" data-target="#newCategory" style="margin: 0 5px;">+ New Category</a>
                    <br class="clear" />
                    <br class="clear" />
                    <asp:HiddenField ID="SelectedCategoryId" runat="server" />
                    <asp:HiddenField ID="SelectedCategoryName" runat="server" />
                    <asp:GridView ID="CategoryGridView" runat="server" CssClass="table table-responsive table-striped eclaim-currency"
                        AutoGenerateColumns="False" ItemType="EClaims.Core.BO.Category" GridLines="None" DataKeyNames="Id"
                        EmptyDataText="No categories available.">
                        <Columns>
                            <asp:TemplateField>
                                <HeaderTemplate>
                                    <asp:CheckBox ID="cbHeader" runat="server" onclick="checkAll(this);" />
                                </HeaderTemplate>
                                <ItemTemplate>
                                    <asp:CheckBox ID="cbCheck" runat="server" onclick="Check_Click(this)" data-id="<%#: Item.Id %>" data-code="<%#: Item.Name %>"></asp:CheckBox>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Category Name">
                                <ItemStyle CssClass="col-sm-5"></ItemStyle>
                                <ItemTemplate>
                                    <asp:Label ID="lblCategoryNameDisplay" runat="server" Text='<%# Bind("Name") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Account Code">
                                <ItemStyle CssClass="col-sm-5"></ItemStyle>                                
                                <ItemTemplate>
                                    <asp:Label ID="lblAccountCodeDisplay" runat="server" Text='<%# Bind("AccountCode") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="" Visible="false">
                                <ItemTemplate>
                                    <asp:Label ID="lblCategoryId" runat="server" Text='<%# Bind("Id") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="" Visible="false">
                                <ItemTemplate>
                                    <asp:Label ID="lblLogo" runat="server" Text='<%# Bind("Logo") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="" Visible="false">
                                <ItemTemplate>
                                    <asp:Label ID="lblIsActive" runat="server" Text='<%# Bind("IsActive") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField ItemStyle-HorizontalAlign="Center">
                                <ItemStyle CssClass="col-sm-2"></ItemStyle>                                
                                <ItemTemplate>
                                    <a href="#" class="btn btn-xs btn-default" data-id="<%# Item.Id %>" data-name="<%# Item.Name %>"
                                        data-accountcode="<%# Item.AccountCode %>" data-logo="<%# Item.Logo %>" data-isactive="<%# Item.IsActive %>"
                                        data-toggle="modal" data-target="#editCategory" onclick="EditCategory(this);">
                                        <i class="fa fa-pencil" aria-hidden="true"></i>Edit
                                    </a>
                                    <%--<asp:LinkButton ID="btnDeleteCategory" CssClass="btn btn-xs btn-danger" runat="server" 
                                                data-id="<%#: Item.Id %>" data-name="<%#: Item.Name %>" OnClick="DeleteCategory_OnClick"
                                                OnClientClick="return ConfirmCategorySelection(this, 'delete');">
                                            <i class="fa fa-times" aria-hidden="true"></i>Delete
                                        </asp:LinkButton>--%>
                                    <asp:LinkButton ID="btnEnableCategory" CssClass="btn btn-xs btn-success" runat="server"
                                        Visible="<%# !Item.IsActive %>" data-id="<%#: Item.Id %>" data-name="<%#: Item.Name %>"
                                        OnClientClick="return ConfirmCategorySelection(this, 'enable');"
                                        OnClick="EnableCategory_Click">
                                            <i class="fa" aria-hidden="true"></i>Enable
                                    </asp:LinkButton>
                                    <asp:LinkButton ID="btnDisableCategory" CssClass="btn btn-xs btn-disable" runat="server"
                                        Visible="<%# Item.IsActive %>" data-id="<%#: Item.Id %>" data-name="<%#: Item.Name %>"
                                        OnClientClick="return ConfirmCategorySelection(this, 'disable');"
                                        OnClick="DisableCategory_Click">
                                            <i class="fa" aria-hidden="true"></i>Disable
                                    </asp:LinkButton>
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                    </asp:GridView>
                    <hr />
                    <div>
                        <asp:LinkButton ID="btnDeleteCategories" CssClass="btn btn-danger" runat="server"
                            OnClick="DeleteCategories_OnClick" Text="Delete Category"
                            OnClientClick="return ConfirmCategoriesDeletion(this);"></asp:LinkButton>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- edit category modal -->
    <div class="modal fade" id="editCategory" tabindex="-1" role="dialog" aria-labelledby="myModalLabelEdit" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-body">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span></button><h4 id="myModalLabelEdit">Edit Category</h4>
                    <hr>
                    <asp:ValidationSummary ID="ValidationSummaryEdit" runat="server" DisplayMode="BulletList" ValidationGroup="EditCategory" />
                    <div class="form-group">
                        <label for="">Logo</label>
                        <asp:TextBox CssClass="form-control" ID="EditCategoryLogo" runat="server" TextMode="Number"></asp:TextBox>
                    </div>
                    <div class="form-group">
                        <label for="">Category Name</label>
                        <asp:TextBox CssClass="form-control" ID="EditCategoryName" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="EditRequiredCategoryNameFieldValidator" runat="server" SetFocusOnError="True" ControlToValidate="EditCategoryName"
                            ErrorMessage="Category Name cannot be empty." Display="None" ValidationGroup="EditCategory">
                        </asp:RequiredFieldValidator>
                    </div>
                    <div class="form-group">
                        <label for="">Account Code</label>
                        <asp:TextBox CssClass="form-control" ID="EditAccountCode" runat="server" placeholder="Enter account code"></asp:TextBox>
                        <small>A unique reference code for this category that is limited to 20 characters and can comprise of letters, digits, hyphen and underscore</small>
                        <asp:RegularExpressionValidator ID="EditRegularExpressionValidator" runat="server" ValidationExpression="[A-Za-z0-9_-]{0,20}"
                            ErrorMessage="Category code is limited to 20 characters and can comprise of letters, digits, hyphen and underscore"
                            ControlToValidate="EditAccountCode" ValidationGroup="EditCategory">
                        </asp:RegularExpressionValidator>
                    </div>
                    <hr>
                    <asp:Button ID="btnUpdateCategory" CssClass="btn btn-success btn-sm" runat="server" Text="Save changes" OnClick="UpdateCategory_OnClick" ValidationGroup="EditCategory" />
                    <button type="button" class="btn btn-default btn-sm" data-dismiss="modal">Close</button>
                </div>
            </div>
        </div>
    </div>
    <asp:HiddenField ID="EditIsActive" runat="server" />
    <asp:HiddenField ID="EditedCategoryId" runat="server" />
    <!-- new category modal -->
    <div class="modal fade" id="newCategory" tabindex="-1" role="dialog" aria-labelledby="myModalLabelNew" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-body">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span></button><h4 id="myModalLabelNew">New Category</h4>
                    <hr>
                    <div>
                        <asp:ValidationSummary ID="ValidationSummaryNew" runat="server" DisplayMode="BulletList" ValidationGroup="NewCategory" />
                        <div class="form-group">
                            <label for="">Logo</label>
                            <asp:TextBox CssClass="form-control" ID="NewCategoryLogo" runat="server" TextMode="Number"></asp:TextBox>
                        </div>
                        <div class="form-group">
                            <label for="">Category Name</label>
                            <asp:TextBox CssClass="form-control" ID="NewCategoryName" runat="server" placeholder="Enter category name"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="NewRequiredCategoryNameFieldValidator" runat="server" SetFocusOnError="True" ControlToValidate="NewCategoryName"
                                ErrorMessage="Category Name cannot be empty." Display="None" ValidationGroup="NewCategory">
                            </asp:RequiredFieldValidator>
                        </div>
                        <div class="form-group">
                            <label for="">Account Code</label>
                            <asp:TextBox CssClass="form-control" ID="NewAccountCode" runat="server" placeholder="Enter account code"></asp:TextBox>
                            <small>A unique reference code for this category that is limited to 20 characters and can comprise of letters, digits, hyphen and underscore</small>
                            <asp:RegularExpressionValidator ID="NewRegularExpressionValidator" runat="server" ValidationExpression="[A-Za-z0-9_-]{0,20}"
                                ErrorMessage="Category code is limited to 20 characters and can comprise of letters, digits, hyphen and underscore"
                                ControlToValidate="NewAccountCode" ValidationGroup="NewCategory">
                            </asp:RegularExpressionValidator>
                        </div>
                        <hr>
                        <asp:Button ID="btnSave_New" runat="server" Text="Save" class="btn btn-success btn-sm" OnClick="NewCategory_OnClick" ValidationGroup="NewCategory" />
                        <button type="button" class="btn btn-default btn-sm" data-dismiss="modal">Close</button>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <script src="../Scripts/GridViewCheckbox.js"></script>
    <script src="../Scripts/categories.js"></script>
    <script>
        $(document).ready(function () {
            $("#settingsNavTab #categories").addClass("active");
        });
    </script>
</asp:Content>
