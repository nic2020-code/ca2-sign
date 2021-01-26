﻿<%@ Page Language="VB" AutoEventWireup="false" CodeFile="Dangky.aspx.vb" Inherits="Dangky" %>

<%@ Register Assembly="DevExpress.Web.v19.2, Version=19.2.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <meta content="width=device-width, initial-scale=1" name="viewport" />
   

    <script type="text/javascript">
        function Dangky(s, e) {
            if (ASPxClientEdit.ValidateGroup('Dangky') == true) {
                cpdangky.PerformCallback();
            }
        }
        function RegDone(s, e) {
            
            if (e.result != null) {
               
                if (e.result == 1) {
                    alert('Đăng ký thành công. Mật khẩu mặc định: 123456.');
                    window.location = 'login.aspx';
                } else if (e.result ==-3) {
                    alert('Email đã tồn tại trên hệ thống.');
                } else {
                    alert('Lỗi đăng ký');
                }
            }
        }
    </script>
</head>
<body>
    <form id="form1" runat="server">
        <div style="margin: auto; width: 50%; padding-top: 50px">
            <h2 style="font-family: Courier New">ĐĂNG KÝ TÀI KHOẢN EDOC</h2>
            <div>
              
                    <div style="padding-bottom:10px">
                        Họ và tên: 
                        <span style="color: red">(*)</span>
                        <dx:ASPxTextBox ID="txtHoten" runat="server" Width="100%" ClientInstanceName="txtHoten" Theme="Material" Font-Names="Courier New" Font-Size="11pt">
                            <ValidationSettings RequiredField-IsRequired="true" Display="Dynamic"
                                ErrorDisplayMode="ImageWithTooltip" RequiredField-ErrorText="Chưa có giá trị" ValidationGroup="Dangky">
                            </ValidationSettings>
                        </dx:ASPxTextBox>

                    </div>
                    <div style="padding-bottom:10px">
                        Email:  <span style="color: red">(*)</span>
                        <dx:ASPxTextBox ID="txtEmail" runat="server" Width="100%" ClientInstanceName="txtEmail" Theme="Material" Font-Names="Courier New" Font-Size="11pt">
                            <ValidationSettings RequiredField-IsRequired="true" Display="Dynamic"
                                ErrorDisplayMode="ImageWithTooltip" RequiredField-ErrorText="Chưa có giá trị" ValidationGroup="Dangky">
                            </ValidationSettings>
                        </dx:ASPxTextBox>
                    </div>
                    <div style="padding-bottom:10px">
                        Số điện thoại: <span style="color: red">(*)</span>
                        <dx:ASPxTextBox ID="txtDienthoai" runat="server" Width="100%" ClientInstanceName="txtdienthoai" Theme="Material" Font-Names="Courier New" Font-Size="11pt">
                            <ValidationSettings RequiredField-IsRequired="true" Display="Dynamic"
                                ErrorDisplayMode="ImageWithTooltip" RequiredField-ErrorText="Chưa có giá trị" ValidationGroup="Dangky">
                            </ValidationSettings>
                        </dx:ASPxTextBox>
                    </div>
                    <div style="padding-bottom:10px">
                        Tên tổ chức:
                           <dx:ASPxTextBox ID="txtTentochuc" runat="server" Width="100%" ClientInstanceName="txttochuc" Theme="Material" Font-Names="Courier New" Font-Size="11pt"></dx:ASPxTextBox>
                    </div>
                    <div style="padding-bottom:10px">
                        Mã số thuế:
                           <dx:ASPxTextBox ID="txtMasothue" runat="server" Width="100%" ClientInstanceName="txtmasothue" Theme="Material" Font-Names="Courier New" Font-Size="11pt"></dx:ASPxTextBox>
                    </div>

                    <div style="text-align: center; padding-top: 20px">
                        <dx:ASPxButton ID="btnDangky" runat="server" Text="Đăng ký" Theme="Material" Width="250px" ValidationGroup="Dangky" AutoPostBack="false">
                            <ClientSideEvents Click="Dangky" />
                        </dx:ASPxButton>
                    </div>
                
                
            </div>
        </div>
        <dx:ASPxCallback ID="cpDangky" ClientInstanceName="cpdangky" OnCallback="cpDangky_Callback" runat="server">
            <ClientSideEvents CallbackComplete="RegDone" />
        </dx:ASPxCallback>
    </form>
</body>
</html>
