Imports System.Data.SqlClient
Imports System.IO
Imports DevExpress.Web
Imports pdftron
Partial Class Danhsachyeucau
    Inherits System.Web.UI.Page

    Public sConString As String = ConfigurationManager.ConnectionStrings("ConnectionString").ConnectionString
    Protected Sub btnXem_Init(sender As Object, e As EventArgs)
        Dim btn As ASPxButton = DirectCast(sender, ASPxButton)
        Dim container As GridViewDataItemTemplateContainer = DirectCast(btn.NamingContainer, GridViewDataItemTemplateContainer)
        Dim duongdanfile As String = gridDanhsach.GetRowValues(container.VisibleIndex, "Vitriluu")

        Dim url As String = HttpContext.Current.Request.Url.Scheme & "://" & HttpContext.Current.Request.Url.Authority
        Dim pathview As String = url & "/FilePDF/" & hdUser("value").ToString & "/Fileinput/" & Path.GetFileName(duongdanfile)
        btn.JSProperties("cp_path") = pathview

    End Sub
    Protected Sub gridDanhsach_DataBinding(sender As Object, e As EventArgs)
        dsDagui.SelectCommand = "select * from v_VBChitiet where  Taikhoantao='" & hdUser("value").ToString & "' order by idFile desc"
        dsDagui.DataBind()
        gridDanhsach.DataSource = dsDagui
    End Sub
    Protected Sub gridDanhsach_CustomUnboundColumnData(sender As Object, e As DevExpress.Web.ASPxGridViewColumnDataEventArgs)

    End Sub

    Private Sub Danhsachyeucau_Load(sender As Object, e As EventArgs) Handles Me.Load
        '   pdftron.PDFNetLoader  PDFNet.Initialize("I-Warez 2015:OEM:AZBYCXAZBYCXAZBYCXAZBYCXAZBYCXAZBYCX")

        PDFNet.Initialize("I-Warez 2015:OEM:AZBYCXAZBYCXAZBYCXAZBYCXAZBYCXAZBYCX")

        If Not IsPostBack Then
            hdUser("value") = String.Empty
        End If
    End Sub
    Protected Sub gridVBnhan_DataBinding(sender As Object, e As EventArgs)
        dsDanhan.SelectCommand = "select * from v_VBChitiet where  Taikhoanky='" & hdUser("value").ToString & "' order by idFile desc "
        dsDanhan.DataBind()
        gridVBnhan.DataSource = dsDanhan
    End Sub
    Protected Sub gridVBnhan_CustomUnboundColumnData(sender As Object, e As DevExpress.Web.ASPxGridViewColumnDataEventArgs)

        If e.Column.FieldName = "Taikhoantao" Then
            Dim email As String = gridDanhsach.GetRowValues(e.ListSourceRowIndex, "Taikhoantao")
            e.Value = GetnamefromEmail(email)
        End If

    End Sub
    Protected Sub gridDanhsach_CustomCallback(sender As Object, e As DevExpress.Web.ASPxGridViewCustomCallbackEventArgs)
        gridDanhsach.DataBind()
    End Sub
    Protected Sub gridVBnhan_CustomCallback(sender As Object, e As DevExpress.Web.ASPxGridViewCustomCallbackEventArgs)
        gridVBnhan.DataBind()
    End Sub

    Private Function GetnamefromEmail(email As String) As String
        Dim hoten As String = String.Empty
        Dim conn As New SqlConnection
        Dim comm As New SqlCommand
        conn.ConnectionString = sConString
        conn.Open()
        comm.Connection = conn
        comm.CommandText = "Select hoten from Canbo where Email = '" & email & "'"
        Dim reader As SqlDataReader = comm.ExecuteReader
        If reader.HasRows Then
            While reader.Read
                hoten = reader(0).ToString
            End While
            reader.Close()
        Else
            hoten = String.Empty
        End If
        conn.Close()
        conn.Dispose()
        comm.Dispose()
        SqlConnection.ClearAllPools()
        Return hoten
    End Function
    Protected Sub gridVBnhan_CustomColumnDisplayText(sender As Object, e As DevExpress.Web.ASPxGridViewColumnDisplayTextEventArgs)
        If e.Column.FieldName = "TrangthaiVB" Then

            If e.Value = 0 Then
                e.DisplayText = "Tạo nháp"
            ElseIf e.Value = 1 Then
                e.DisplayText = "Đang chờ"
            ElseIf e.Value = 2 Then
                e.DisplayText = "Bị từ chối"
            ElseIf e.Value = 3 Then
                e.DisplayText = "Đã thu hồi"
            ElseIf e.Value = 4 Then
                e.DisplayText = "Đã xóa"
            ElseIf e.Value = 5 Then
                e.DisplayText = "Đã hoàn thành"

            End If
            'trangthai van ban :0: Bản nháp,1: Đang chờ, 2: Bị từ chối, 3: Đã thu hồi, 4: Đã xóa,5: Đã hoàn thành
        End If
    End Sub
    Protected Sub gridDanhsach_CustomColumnDisplayText(sender As Object, e As DevExpress.Web.ASPxGridViewColumnDisplayTextEventArgs)
        If e.Column.FieldName = "TrangthaiVB" Then

            If e.Value = 0 Then
                e.DisplayText = "Tạo nháp"
            ElseIf e.Value = 1 Then
                e.DisplayText = "Đang chờ"
            ElseIf e.Value = 2 Then
                e.DisplayText = "Bị từ chối"

            ElseIf e.Value = 3 Then
                e.DisplayText = "Đã thu hồi"
            ElseIf e.Value = 4 Then
                e.DisplayText = "Đã xóa"
            ElseIf e.Value = 5 Then
                e.DisplayText = "Đã hoàn thành"
             
            End If
        End If
    End Sub
    Protected Sub btnXemvbnhan_Init(sender As Object, e As EventArgs)
        Dim btn As ASPxButton = DirectCast(sender, ASPxButton)
        Dim container As GridViewDataItemTemplateContainer = DirectCast(btn.NamingContainer, GridViewDataItemTemplateContainer)
        Dim duongdanfile As String = gridVBnhan.GetRowValues(container.VisibleIndex, "Vitriluu")
        If (File.Exists(duongdanfile)) Then
            Dim url As String = HttpContext.Current.Request.Url.Scheme & "://" & HttpContext.Current.Request.Url.Authority
            Dim pathview As String = url & "/FilePDF/" & hdUser("value").ToString & "/Fileinput/" & Path.GetFileName(duongdanfile)

            btn.JSProperties("cp_path") = pathview
        Else
            btn.JSProperties("cp_path") = String.Empty
        End If

    End Sub
End Class
