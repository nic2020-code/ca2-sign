
Imports System.Data.SqlClient
Imports swEDoc

Partial Class AddReceive
    Inherits System.Web.UI.Page
    Public sConString As String = ConfigurationManager.ConnectionStrings("ConnectionString").ConnectionString


    Protected Sub AddReceive_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
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
        Dim serv As apiEdoc = New apiEdoc()
        Dim idfile As Integer = Integer.Parse(Session("idFile").ToString())
        Dim email As String = txtEmail.Text
        Dim res As Integer = serv.GuiVB_Capnhatchitietguinguoinhan(idfile, email)

        'If res = 1 Then
        Response.Redirect("AddSigntureField.aspx")
        'End If
    End Sub
End Class
