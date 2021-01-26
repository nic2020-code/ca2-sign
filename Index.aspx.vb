Imports System.Data
Imports System.Data.SqlClient
Imports System.IO
Imports DevExpress.Web
Imports pdftron
Partial Class Index
    Inherits System.Web.UI.Page
    Protected Sub Index_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Session("Login") Is Nothing Then
            Response.Redirect("Signin.aspx")
        End If
        Dim email As String = Session("Login").ToString()
        LoadData()
    End Sub
    Private Sub LoadData()
        Dim email As String = Session("Login").ToString()
        Dim serv As New swEDoc.apiEdoc
        Dim data As DataTable = New DataTable()
        data = serv.LayDSVBDatao(email)
        'dsDagui.SelectCommand = "select * from v_VBChitiet where  Taikhoantao='" & Session("Login").ToString & "' order by idFile desc"
        'dsDagui.DataBind()
        gridDanhsach.DataSource = data
        gridDanhsach.DataBind()
    End Sub

    'Public sConString As String = ConfigurationManager.ConnectionStrings("ConnectionString").ConnectionString
    Protected Sub gridDanhsach_DataBinding(sender As Object, e As EventArgs)
        Dim email As String = Session("Login").ToString()
        Dim serv As New swEDoc.apiEdoc
        Dim data As DataTable = New DataTable()
        data = serv.LayDSVBDatao(email)
        'dsDagui.SelectCommand = "select * from v_VBChitiet where  Taikhoantao='" & Session("Login").ToString & "' order by idFile desc"
        'dsDagui.DataBind()
        gridDanhsach.DataSource = data
        gridDanhsach.DataBind()
    End Sub
    Protected Sub gridDanhsach_CustomUnboundColumnData(sender As Object, e As DevExpress.Web.ASPxGridViewColumnDataEventArgs)

    End Sub
    Protected Sub gridDanhsach_CustomColumnDisplayText(sender As Object, e As DevExpress.Web.ASPxGridViewColumnDisplayTextEventArgs)
        If e.Column.FieldName = "TrangthaiVB" Then

            If e.Value = 0 Then
                e.DisplayText = "Bản nháp"
            ElseIf e.Value = 1 Then
                e.DisplayText = "Đang chờ"
            ElseIf e.Value = 2 Then
                e.DisplayText = "Bị từ chối"
            ElseIf e.Value = 3 Then
                e.DisplayText = "Đã thu hồi"
            ElseIf e.Value = 4 Then
                e.DisplayText = "Đã xóa"
            ElseIf e.Value = 5 Then
                e.DisplayText = "Hoàn thành"
            End If
        End If
    End Sub

End Class
