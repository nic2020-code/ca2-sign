Imports System.Data.SqlClient
Partial Class AddReceivee
    Inherits System.Web.UI.Page
    Public sConString As String = ConfigurationManager.ConnectionStrings("ConnectionString").ConnectionString
    Protected Sub AddReceivee_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Session("Login") Is Nothing Then
            Response.Redirect("Signin.aspx")
        End If
        GetHoTen()
    End Sub
    Private Sub GetHoTen()
        Dim email As String = Session("Login").ToString
        Dim fname As String = String.Empty
        Dim conn As New SqlConnection
        Dim comm As New SqlCommand
        conn.ConnectionString = sConString
        conn.Open()
        comm.Connection = conn
        comm.CommandText = "Select Hoten from Taikhoan where Email = '" & email & "'"
        Dim reader As SqlDataReader = comm.ExecuteReader
        If reader.HasRows Then
            While reader.Read
                fname = reader(0).ToString()
                Session("Name") = fname
            End While

        Else
            Session("Name") = String.Empty
        End If
    End Sub
    Protected Sub btnAddRecei_Click(sender As Object, e As EventArgs)
        Dim htky As String = drhtKy.SelectedItem.Text
        Dim a As Integer
        If htky = "Ký điện tử" Then
            a = 1
        ElseIf htky = "Ký số" Then
            a = 2
        ElseIf htky = "Xem" Then
            a = 3
        End If

        Dim idFile As Integer = Integer.Parse(Session("idFile").ToString())
        Dim ttk As Integer = txtttKy.Text
        Dim tkt As String = Session("Login").ToString()
        Dim tkk As String = txtEmail.Text
        Dim arr As String() = tkt.Split(",")
        Dim serv As New swEDoc.apiEdoc
        Dim res As Integer = serv.Thietlaptaikhoanky(idFile, tkk, ttk, htky, tkt)
        If res = 1 Then
            Response.Redirect("addsignturefield.aspx")
        End If
    End Sub
End Class
