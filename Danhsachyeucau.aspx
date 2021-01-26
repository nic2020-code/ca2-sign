﻿<%@ Page Language="VB" MasterPageFile="~/main.master" AutoEventWireup="false" CodeFile="Danhsachyeucau.aspx.vb" Inherits="Danhsachyeucau" %>

<%@ Register Assembly="DevExpress.Web.v19.2, Version=19.2.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <script src="FileSaver.min.js"></script>

    <script type="text/javascript">
        function Taomoiyeucau(s, e) {
            window.location.href = 'Taoyeucauky.aspx';
        }

        $(document).ready(function () {
            var user = localStorage.getItem("user");
            if (user == null) {
                window.location = 'login.aspx';
            }
            else {
                hduser.Set('value', user);
                //alert(hduser.Get('value'));
                ShowVBDi();
            }
        });
        function Viewfile(s, e) {
            var duongdan = s.cp_path;
            //  alert(duongdan);
            var doc = duongdan
            localStorage.setItem("path", doc);

            //alert(a);
            if (duongdan != null || duongdan != '') {

                WebViewer(
                    {
                        path: 'http://localhost:8001/lib/',
                        //pdftronServer: 'http://localhost:8001',
                        initialDoc: doc,
                    },
                    document.getElementById('viewer1')
                ).then(instance => {
                    samplesSetup(instance);

                    const { docViewer, annotManager } = instance;
                    instance.setHeaderItems(header => {
                        header.push({
                            type: 'actionButton',
                            img: '/img/logoNCM1.png',
                            onClick: async () => {
                                const doc = docViewer.getDocument();
                                const xfdfString = await annotManager.exportAnnotations();                                
                                const data = await doc.getFileData({
                                    // saves the document with annotations in it
                                    xfdfString
                                });
                                const arr = new Uint8Array(data);
                                const blob = new Blob([arr], { type: 'application/pdf' });
                                // const url = URL.createObjectURL(blob);
                                //window.open(url);
                                var a = "test";
                                window.saveAs(blob, a + '.pdf');
                            }
                        })
                    });

                    //const doc = docViewer.getDocument();
                    //const xfdfString = await annotManager.exportAnnotations();
                    //const options = { xfdfString };
                    //const data = await doc.getFileData(options);
                    //const arr = new Uint8Array(data);
                    //const blob = new Blob([arr], { type: 'application/pdf' });
                    //alert(blob)

                    //document.getElementById('select').onchange = e => {
                    // instance.loadDocument(e.target.value);
                    // };
                });

                //console.log(duongdan);

                //$("#ContentPlaceHolder1_popEdit_pnViewVB_pdfview").attr('src', duongdan);
                //  $("#ContentPlaceHolder1_pnViewfile_Iframe1").attr('src', duongdan);
                // popedit.Show();

                pnguidi.SetVisible(false);
                pnvbden.SetVisible(false);
                pnview.SetVisible(true);
            } else {
                alert('Không tìm thấy file');
            }

        }
        function ShowVBDi(s, e) {

            pnguidi.SetVisible(true);
            pnvbden.SetVisible(false);
            pnview.SetVisible(false);

            griddagui.PerformCallback();

        }

        function ShowVBDen(s, e) {
            pnguidi.SetVisible(false);
            pnvbden.SetVisible(true);
            pnview.SetVisible(false);
            griddanhan.PerformCallback();
        }

    </script>

    <script src="lib/webviewer.min.js"></script>
    <script src="modernizr.custom.min.js"></script>

    <script src="old-browser-checker.js"></script>
    <script src="global.js"></script>

    <dx:ASPxHiddenField ID="hdUser" runat="server" ClientInstanceName="hduser"></dx:ASPxHiddenField>
    <div style="font-family: Courier New">
        <dx:ASPxPopupControl ID="popEdit" runat="server" ClientInstanceName="popedit" Width="1000px"
            Theme="Material" HeaderText="Xem file văn bản" ShowOnPageLoad="false"
            CloseAction="CloseButton" PopupHorizontalAlign="WindowCenter" PopupVerticalAlign="WindowCenter">
            <ContentCollection>
                <dx:PopupControlContentControl>
                    <dx:ASPxPanel ID="pnViewVB" runat="server" Width="100%">
                        <PanelCollection>
                            <dx:PanelContent>
                                View pdf
                                   <iframe id="pdfview" runat="server" width="100%" height="1000px"></iframe>
                            </dx:PanelContent>
                        </PanelCollection>
                    </dx:ASPxPanel>
                </dx:PopupControlContentControl>
            </ContentCollection>
        </dx:ASPxPopupControl>
        <div class="row" style="padding: 20px">
            <div class="col-md-2" style="padding-top: 50px">

                <dx:ASPxButton ID="btnCreatenew" runat="server" Text="Tạo mới" Width="280px" Theme="Material" Font-Bold="true" Font-Size="13pt" Font-Names="Courier New" AutoPostBack="false">
                    <ClientSideEvents Click="Taomoiyeucau" />
                </dx:ASPxButton>

                <hr />
                <table class="table table-bordered">
                    <tr style="height: 50px">
                        <td>
                            <dx:ASPxButton ID="btnVBDi" runat="server" Text="Tài liệu đã gửi" RenderMode="Link" Theme="Material" Font-Size="12pt" AutoPostBack="false">
                                <ClientSideEvents Click="ShowVBDi" />
                            </dx:ASPxButton>

                        </td>

                    </tr>
                    <tr>
                        <td>
                            <dx:ASPxButton ID="btnVBDen" runat="server" Text="Tài liệu đã nhận" RenderMode="Link" Theme="Material" Font-Size="12pt" AutoPostBack="false">
                                <ClientSideEvents Click="ShowVBDen" />
                            </dx:ASPxButton>
                        </td>
                    </tr>
                </table>


            </div>

            <div class="col-md-10">
                <h3><b>DANH SÁCH VĂN BẢN, TÀI LIỆU</b></h3>
                <hr />
                <dx:ASPxPanel ID="pnGuidi" runat="server" Width="100%" ClientInstanceName="pnguidi" ClientVisible="true">
                    <PanelCollection>
                        <dx:PanelContent>
                            <h4><b>TÀI LIỆU ĐÃ GỬI</b></h4>
                            <dx:ASPxGridView ID="gridDanhsach" runat="server" Theme="Material" Width="100%" OnDataBinding="gridDanhsach_DataBinding" OnCustomUnboundColumnData="gridDanhsach_CustomUnboundColumnData" OnCustomColumnDisplayText="gridDanhsach_CustomColumnDisplayText"
                                OnCustomCallback="gridDanhsach_CustomCallback" ClientInstanceName="griddagui" AutoGenerateColumns="false">
                                <Columns>
                                    <dx:GridViewDataColumn FieldName="idFile" Caption="idVB"></dx:GridViewDataColumn>

                                    <dx:GridViewDataColumn FieldName="TenVBGoc" Caption="Tên văn bản"></dx:GridViewDataColumn>
                                    <dx:GridViewDataDateColumn FieldName="Ngaytao" Caption="Thời gian" PropertiesDateEdit-DisplayFormatString="{0:dd/MM/yyyy HH:mm}"></dx:GridViewDataDateColumn>
                                    <dx:GridViewDataColumn FieldName="TrangthaiVB" Caption="Trạng thái"></dx:GridViewDataColumn>
                                    <dx:GridViewDataColumn FieldName="Taikhoanky" Caption="Email tiếp nhận"></dx:GridViewDataColumn>
                                    <dx:GridViewDataColumn FieldName="Vitriluu" Caption="Đường dẫn file" Visible="false"></dx:GridViewDataColumn>

                                    <dx:GridViewDataColumn Caption="Chức năng">
                                        <DataItemTemplate>
                                            <dx:ASPxButton ID="btnXem" runat="server" Text="Xem" OnInit="btnXem_Init" RenderMode="Link" ClientEnabled="true" AutoPostBack="false">
                                                <ClientSideEvents Click="Viewfile" />
                                            </dx:ASPxButton>
                                        </DataItemTemplate>
                                    </dx:GridViewDataColumn>
                                </Columns>
                                <SettingsPager PageSize="10" Mode="ShowPager" Position="Bottom" />
                                <Styles Footer-Font-Bold="true" Footer-ForeColor="Black">
                                    <Footer Font-Bold="True" ForeColor="Black"></Footer>
                                </Styles>
                                <Settings ShowColumnHeaders="true" ShowFooter="true" />
                            </dx:ASPxGridView>

                        </dx:PanelContent>
                    </PanelCollection>
                </dx:ASPxPanel>



                <dx:ASPxPanel ID="pnVBDen" runat="server" Width="100%" ClientInstanceName="pnvbden" ClientVisible="false">
                    <PanelCollection>
                        <dx:PanelContent>
                            <h4><b>TÀI LIỆU NHẬN</b></h4>
                            <dx:ASPxGridView ID="gridVBnhan" runat="server" Theme="Material" Width="100%" OnDataBinding="gridVBnhan_DataBinding" OnCustomUnboundColumnData="gridVBnhan_CustomUnboundColumnData" OnCustomColumnDisplayText="gridVBnhan_CustomColumnDisplayText"
                                OnCustomCallback="gridVBnhan_CustomCallback" ClientInstanceName="griddanhan" AutoGenerateColumns="false">
                                <Columns>
                                    <dx:GridViewDataColumn FieldName="idFile" Caption="idVB"></dx:GridViewDataColumn>

                                    <dx:GridViewDataColumn FieldName="TenVBGoc" Caption="Tên văn bản"></dx:GridViewDataColumn>
                                    <dx:GridViewDataDateColumn FieldName="Ngaytao" Caption="Thời gian" PropertiesDateEdit-DisplayFormatString="{0:dd/MM/yyyy HH:mm}"></dx:GridViewDataDateColumn>
                                    <dx:GridViewDataColumn FieldName="TrangthaiVB" Caption="Trạng thái"></dx:GridViewDataColumn>
                                    <dx:GridViewDataColumn FieldName="Taikhoantao" UnboundType="String" Caption="Email gửi"></dx:GridViewDataColumn>
                                    <dx:GridViewDataColumn FieldName="Vitriluu" Caption="Đường dẫn file" Visible="false"></dx:GridViewDataColumn>
                                    <dx:GridViewDataColumn Caption="Chức năng">
                                        <DataItemTemplate>
                                            <dx:ASPxButton ID="btnXemvbnhan" runat="server" Text="Xem" OnInit="btnXemvbnhan_Init" RenderMode="Link" ClientEnabled="true" AutoPostBack="false">
                                                <ClientSideEvents Click="Viewfile" />
                                            </dx:ASPxButton>
                                        </DataItemTemplate>
                                    </dx:GridViewDataColumn>
                                </Columns>
                                <SettingsPager PageSize="10" Mode="ShowPager" Position="Bottom" />
                                <Styles Footer-Font-Bold="true" Footer-ForeColor="Black">
                                    <Footer Font-Bold="True" ForeColor="Black"></Footer>
                                </Styles>
                                <Settings ShowColumnHeaders="true" ShowFooter="true" />
                            </dx:ASPxGridView>
                        </dx:PanelContent>
                    </PanelCollection>
                </dx:ASPxPanel>


                <dx:ASPxPanel ID="pnViewfile" runat="server" Width="100%" ClientInstanceName="pnview" ClientVisible="false">
                    <PanelCollection>
                        <dx:PanelContent>
                            <div id="viewer1" style="width: 100%; height: 1000px;"></div>
                            <%-- <iframe id="Iframe1" runat="server" width="100%" height="1000px"></iframe>--%>
                        </dx:PanelContent>
                    </PanelCollection>
                </dx:ASPxPanel>


            </div>



        </div>
        <asp:SqlDataSource ID="dsDagui" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>"></asp:SqlDataSource>
        <asp:SqlDataSource ID="dsDanhan" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>"></asp:SqlDataSource>

        <script src="menu-button.js"></script>
        <!--ga-tag-->

        <%--  <script>
            Modernizr.addTest('async', function () {
                try {
                    var result;
                    eval('let a = () => {result = "success"}; let b = async () => {await a()}; b()');
                    return result === 'success';
                } catch (e) {
                    return false;
                }
            });

            // test for async and fall back to code compiled to ES5 if they are not supported
            ['viewing-with-webviewer-server.js'].forEach(function (js) {
                var script = Modernizr.async ? js : js.replace('.js', '.ES5.js');
                var scriptTag = document.createElement('script');
                scriptTag.src = script;
                scriptTag.type = 'text/javascript';
                document.getElementsByTagName('head')[0].appendChild(scriptTag);
            });
        </script>--%>
    </div>
</asp:Content>

