<%@ Page Language="VB" AutoEventWireup="false" MasterPageFile="~/MasterPage.master" CodeFile="Index.aspx.vb" Inherits="Index" %>

<%@ Register Assembly="DevExpress.Web.Bootstrap.v19.2, Version=19.2.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.Bootstrap" TagPrefix="dx" %>

<%@ Register Assembly="DevExpress.Web.v19.2, Version=19.2.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <link href="Content/bootstrap.min.css" rel="stylesheet" />
    <style>
        .aligntext {
            text-align: left
        }
    </style>
    <div class="w-layout-grid dashboard-grid">
        <div id="w-node-339fecbc6fd0-66c5cdc4" class="menu-left">
            <a href="UploadFile.aspx" class="add-file-button w-button">
                <img src="Content/images/new file icon.png" class="margin-icon" style="padding-right: 5px" alt="icon" />
                Tạo tài liệu mới</a>
            <div
                class="state-dropdown"
                style="margin-top: 0px; margin-bottom: 0px; padding-left: 0px">
                <div id="flip" class="title-content" style="padding-left: 12px">
                    <div class="text-and-icon">
                        <img
                            src="Content/images/Path-30115_1.png"
                            loading="lazy"
                            alt=""
                            class="file-icon" />
                        <div class="text-block-4">Tài liệu của tôi</div>
                    </div>
                    <img
                        src="Content/images/Path-30116.png"
                        loading="lazy"
                        alt=""
                        class="image-9" />
                </div>
                <div id="panel" class="state-link w-hidden" style="margin-left: 30px">
                    <a
                        href="#"
                        class="link-state all-item w-inline-block"
                        data-filter="*">
                        <img
                            src="Content/images/All.png"
                            loading="lazy"
                            alt=""
                            class="image-10" />
                        <div class="all-text">Tất cả (05)</div>
                    </a>
                    <a
                        href="#"
                        class="link-state wait-item w-inline-block"
                        data-filter=".wait-filter">
                        <img
                            src="Content/images/Wait.png"
                            loading="lazy"
                            alt=""
                            class="image-10" />
                        <div class="all-text">Đang chờ (01)</div>
                    </a>
                    <a
                        href="#"
                        class="link-state done-item w-inline-block"
                        data-filter=".done-filter">
                        <img
                            src="Content/images/Done.png"
                            loading="lazy"
                            alt=""
                            class="image-10" />
                        <div class="all-text">Hoàn thành (01)</div>
                    </a>
                    <a
                        href="#"
                        class="link-state reject-item w-inline-block"
                        data-filter=".reject-filter">
                        <img
                            src="Content/images/Reject.png"
                            loading="lazy"
                            alt=""
                            class="image-10" />
                        <div class="all-text">Bị từ chối (01)</div>
                    </a>
                    <a
                        href="#"
                        class="link-state voided-item w-inline-block"
                        data-filter=".voided-filter">
                        <img
                            src="Content/images/Voided.png"
                            loading="lazy"
                            alt=""
                            class="image-10" />
                        <div class="all-text">Đã thu hồi (01)</div>
                    </a>
                    <a
                        href="#"
                        class="link-state draft-item w-inline-block"
                        data-filter=".draft-filter">
                        <img
                            src="Content/images/Draft.png"
                            loading="lazy"
                            alt=""
                            class="image-10" />
                        <div class="all-text">Bản nháp (01)</div>
                    </a>
                </div>
            </div>
            <a href="#" class="menu-link w-inline-block">
                <div class="item-menu-container">
                    <img src="Content/images/Group-15087.png" loading="lazy" alt="">
                    <div class="menu-text-link">Đã xóa</div>
                </div>
            </a>
            <a href="#" class="menu-link w-inline-block">
                <div class="item-menu-container space-between">
                    <div class="item-left">
                        <img src="Content/images/Group-15088.png" loading="lazy" alt="">
                        <div class="menu-text-link">Thư mục</div>
                    </div>
                    <div class="item-right">
                        <img src="Content/images/Group-15086_1.png" loading="lazy" alt="">
                    </div>
                </div>
            </a>
        </div>
        <div class="work-area">
            <div class="heading-container">
                <div class="heading-text">Tất cả tài liệu</div>
                <div class="div-block-16"></div>
            </div>
            <asp:Panel ID="pnDanhsach" runat="server">
                <dx:ASPxGridView ID="gridDanhsach" runat="server" Theme="Material" Width="100%" CssClass="text-left" OnCustomUnboundColumnData="gridDanhsach_CustomUnboundColumnData" OnCustomColumnDisplayText="gridDanhsach_CustomColumnDisplayText" ClientInstanceName="griddagui" AutoGenerateColumns="false">
                    <Columns>
                        <dx:GridViewDataColumn Caption="">
                            <DataItemTemplate>
                                <dx:ASPxCheckBox runat="server" CssClass="form-check-input"></dx:ASPxCheckBox>
                            </DataItemTemplate>
                        </dx:GridViewDataColumn>
                        <dx:GridViewDataColumn FieldName="TenVBGoc" Caption="Tiêu đề"></dx:GridViewDataColumn>
                        <dx:GridViewDataDateColumn FieldName="Ngaytao" Caption="Thời gian" PropertiesDateEdit-DisplayFormatString="{0:dd/MM/yyyy HH:mm}"></dx:GridViewDataDateColumn>
                        <dx:GridViewDataColumn FieldName="TrangthaiVB" Caption="Trạng thái" CellStyle-CssClass="aligntext">
                        </dx:GridViewDataColumn>
                        <dx:GridViewDataColumn Caption="">
                            <DataItemTemplate>
                                <dx:ASPxImage ID="ASPxImage1" runat="server" ShowLoadingImage="true"></dx:ASPxImage>
                                <%--     <dx:ASPxButton ID="btnXem" runat="server" Text="Xem" OnInit="btnXem_Init" RenderMode="Link" ClientEnabled="true" AutoPostBack="false">
                                                <ClientSideEvents Click="Viewfile" />
                                            </dx:ASPxButton>--%>
                            </DataItemTemplate>
                        </dx:GridViewDataColumn>
                    </Columns>
                    <SettingsPager PageSize="10" Mode="ShowPager" Position="Bottom" />
                    <Styles Footer-Font-Bold="true" Footer-ForeColor="Black">
                        <Footer Font-Bold="True" ForeColor="Black"></Footer>
                    </Styles>
                    <Settings ShowColumnHeaders="true" ShowFooter="true" />
                </dx:ASPxGridView>
            </asp:Panel>
        </div>
    </div>
    <script src="Scripts/jquery-3.0.0.min.js"></script>
    <script>
        $(document).ready(function () {
            $("#flip").click(function () {
                $("#panel").slideToggle("slow");
            });
        });
    </script>
</asp:Content>
