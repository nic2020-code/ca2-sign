﻿<%@ Page Language="VB" MasterPageFile="~/main.master" AutoEventWireup="false" CodeFile="Taoyeucauky.aspx.vb" Inherits="Taoyeucauky" %>


<%@ Register Assembly="DevExpress.Web.v19.2, Version=19.2.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>



<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

       <link href="style.css" rel="stylesheet" />
  <%--  <link rel="stylesheet" href="../../style.css" />--%>
    <%--  <script src="../lib/webviewer.min.js"></script>--%>
    <script src="lib/webviewer.min.js"></script>
    <script src="modernizr.custom.min.js"></script>
     <%--  <script src="../modernizr.custom.min.js"></script>--%>
   <%--   <script src="../old-browser-checker.js"></script>
      <script src="../global.js"></script>--%>
    <script src="old-browser-checker.js"></script>
    <script src="global.js"></script>

    <script type="text/javascript">
        $(document).ready(function () {

            var user = localStorage.getItem("user");
            if (user == null) {
                window.location = 'login.aspx';
            }
            else {
                hduser.Set('value', user);
                //alert(hduser.Get('value'));

            }
        });

        function SaveData(s, e) {
            cpsavedata.PerformCallback();
        }

        function EndSaveData(s, e) {
            var kq = e.result;
            if (kq != null) {
                if (kq == 1) alert('Lưu và gửi yêu cầu thành công.');
                else if (kq == -1) alert('Lỗi hệ thống');
                else if (kq == 0) alert('Lưu thông tin không thành công');
            }
        }

  //      function UploadCompleted(s, e) {
  //          var a = e.callbackData;      
  //          var temp = a.split('|');
            
  //          hdidfile.Set('value', temp[0]);
           
  //         // $("#ContentPlaceHolder1_pnViewVB_pdfview").attr('src', temp[1]);
          
  //      }

  //      WebViewer(
  //  {
  //      //path: '../../../lib',
  //      path: 'http://localhost:8001/lib/',
  //      pdftronServer: 'https://demo.pdftron.com/',
  //      initialDoc: 'https://pdftron.s3.amazonaws.com/downloads/pl/demo-annotated.pdf',
  //  },
  //  document.getElementById('viewer')
  //).then(instance => {
  //    samplesSetup(instance);
  //    document.getElementById('select').onchange = e => {
  //        instance.loadDocument(e.target.value);
  //    };

  //    document.getElementById('file-picker').onchange = e => {
  //        const file = e.target.files[0];
  //        if (file) {
  //            instance.loadDocument(file);
  //        }
  //    };

  //    document.getElementById('url-form').onsubmit = e => {
  //        e.preventDefault();
  //        instance.loadDocument(document.getElementById('url').value);
  //    };
  //});


    </script>

    <div style="padding: 20px">

         <dx:ASPxHiddenField ID="hdIDfile" runat="server" ClientInstanceName="hdidfile"></dx:ASPxHiddenField>
        <dx:ASPxHiddenField ID="hdUser" runat="server" ClientInstanceName="hduser"></dx:ASPxHiddenField>
        <h2>SOẠN YÊU CẦU KÝ TÀI LIỆU</h2>
        <hr />
        <div class="row">
            <div class="col-md-4">
                <dx:ASPxPanel ID="pnTaomoi" runat="server" Width="100%">
                    <PanelCollection>
                        <dx:PanelContent>
                            <h3><span style="font-family: Courier New; font-size: 13pt; font-weight: bold">TẢI LÊN TÀI LIỆU MỚI</span> </h3>
                            <hr />
                             <%--   <input id="file-picker" type="file" accept=".pdf,.jpg,.jpeg,.png,.doc,.docx,.xls,.xlsx,.ppt,.pptx,.md,.dwg,.dxf,.dgn,.rtf,.odt,.ods,.odp,.bmp,.wmf,.emf,.gif,.jpc,.tif,.html,.txt" />--%>
                            <dx:ASPxUploadControl ID="aspxUpload" runat="server"
                                BrowseButton-Text="Chọn file" UploadMode="Auto"
                                Width="100%" Theme="Material" OnFileUploadComplete="aspxUpload_FileUploadComplete"
                                ShowUploadButton="True" ShowProgressPanel="True"
                                AdvancedModeSettings-EnableFileList="True" AdvancedModeSettings-FileListPosition="Bottom">
                                <ValidationSettings MaxFileSize="4194304" AllowedFileExtensions=".doc,.docx,.pdf,.xls,.xlsx" />
                              <%--  <ClientSideEvents  FileUploadComplete="UploadCompleted" />--%>
                            </dx:ASPxUploadControl>
                            <div style="padding-top: 50px"></div>
                            <h3><span style="font-family: Courier New; font-size: 13pt; font-weight: bold">CHỈ ĐỊNH NGƯỜI NHẬN TÀI LIỆU</span> </h3>
                            <hr />
                            <dx:ASPxTokenBox ID="cmbNguoinhan" Font-Names="Roboto, sans-serif" Font-Size="16px" NullText="Chọn người nhận..." runat="server" Border-BorderStyle="None" AllowMouseWheel="True" TextField="Hoten" ValueField="Taikhoan" ClientInstanceName="cmbnguoinhan" Border-BorderWidth="1px" DataSourceID="dsNguoinhan" IncrementalFilteringMode="Contains" Theme="Moderno" Tokens="" Width="100%"></dx:ASPxTokenBox>

                            <asp:SqlDataSource ID="dsNguoinhan" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="select Taikhoan, Hoten from canbo"></asp:SqlDataSource>

                            <div style="padding-top: 30px">
                                <dx:ASPxButton ID="btnGuiyeucau" runat="server" Text="Gửi yêu cầu ký" Theme="Material" Width="100%" AutoPostBack="false">
                                    <ClientSideEvents Click="SaveData" />
                                </dx:ASPxButton>
                            </div>
                        </dx:PanelContent>
                    </PanelCollection>

                </dx:ASPxPanel>

            </div>
            <div class="col-md-8">
                <dx:ASPxPanel ID="pnViewVB" runat="server" Width="100%">
                    <PanelCollection>
                        <dx:PanelContent>
                            View pdf
                            <div id="viewer"></div>
                                <%--   <iframe id="pdfview" runat="server" width="100%" height="1000px"></iframe>--%>
                        </dx:PanelContent>
                    </PanelCollection>
                </dx:ASPxPanel>
            </div>
        </div>



        <dx:ASPxCallback ID="cpSave" runat="server" ClientInstanceName="cpsavedata" OnCallback="cpSave_Callback">
            <ClientSideEvents CallbackComplete="EndSaveData" />
        </dx:ASPxCallback>






    </div>

    <script src="menu-button.js"></script>
    <!--ga-tag-->

    <script type="text/javascript">
  
    </script>
</asp:Content>

