
Imports System
Imports System.Collections.Generic
Imports System.Linq
Imports System.Text.RegularExpressions
Imports System.Web
Imports System.Web.UI
Imports System.Web.UI.WebControls
Partial Class signin
    Inherits System.Web.UI.Page
    Private Sub signin_Load(ByVal Sender As System.Object, ByVal e As System.EventArgs) Handles Me.Load
        lblError.Text = String.Empty


    End Sub

    Protected Sub cpLogin_Callback(source As Object, e As DevExpress.Web.CallbackEventArgs)
        Dim cookName As HttpCookie = New HttpCookie("user")
        Dim arr As String() = e.Parameter.Split("|")
        Dim tendn, matkhau As String
        tendn = arr(0)
        matkhau = arr(1)

        Dim serv As New swEDoc.apiEdoc
        '0: Tai khoan khong dung,1: thành công, -1: Lỗi,  -2 :TK chưa kích hoạt, -3: Tài khoản đã bị khóa, -4: Tài khoản bị khóa do dang nhap sai qua 5 lan, -5: Thong tin dang nhap khong dung
        Dim res As Integer = serv.Dangnhap(tendn, matkhau)
        e.Result = res & "|" & tendn
    End Sub
    Protected Sub btnDangNhap_Click(sender As Object, e As EventArgs)
        Dim mRegxExpression As Regex

        If txtEmail.Text.Trim() <> String.Empty Then
            mRegxExpression = New Regex("^([a-zA-Z0-9_\-])([a-zA-Z0-9_\-\.]*)@(\[((25[0-5]|2[0-4][0-9]|1[0-9][0-9]|[1-9][0-9]|[0-9])\.){3}|((([a-zA-Z0-9\-]+)\.)+))([a-zA-Z]{2,}|(25[0-5]|2[0-4][0-9]|1[0-9][0-9]|[1-9][0-9]|[0-9])\])$")

            If Not mRegxExpression.IsMatch(txtEmail.Text.Trim()) Then
                lblError.Text = "Sai định dạng email"
            Else
                Dim email = txtEmail.Text
                Dim pass = txtPass.Text
                Dim serv As New swEDoc.apiEdoc
                Dim res As Integer = serv.Dangnhap(email, pass)

                If res = 1 Then
                    Session.Remove("Email")
                    Session("Login") = txtEmail.Text
                    Response.Redirect("Index.aspx")
                ElseIf res = -1 Then
                    lblError.Text = "Lỗi hệ thống"
                ElseIf res = -2 Then
                    lblError.Text = "Tài khoản chưa được kích hoạt"
                ElseIf res = -3 Then
                    lblError.Text = "Tài khoản đang bị khóa"
                ElseIf res = -4 Then
                    lblError.Text = "Tài khoản đã nhập sai quá 5 lần và đang bị khóa"
                ElseIf res = -5 Then
                    lblError.Text = "Sai thông tin đăng nhập"
                ElseIf res = 0 Then
                    lblError.Text = "Không tồn tại tài khoản"
                End If
            End If
        End If

    End Sub
End Class
