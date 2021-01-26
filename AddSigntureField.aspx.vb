
Imports System.Data.SqlClient
Imports System.Web.Services

Partial Class AddSigntureField
    Inherits System.Web.UI.Page

    Protected Sub AddSigntureField_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Session("Login") Is Nothing Then
            Response.Redirect("Signin.aspx")
        End If
        GetHoTen()
    End Sub

    Public Function GetHoTen() As List(Of String)
        Dim sConString As String = ConfigurationManager.ConnectionStrings("ConnectionString").ConnectionString
        Dim fname As String = String.Empty
        Dim conn As New SqlConnection
        Dim comm As New SqlCommand
        Dim hoten As New List(Of String)
        conn.ConnectionString = sConString
        conn.Open()
        comm.Connection = conn
        comm.CommandText = "Select Hoten from Taikhoan"
        Dim reader As SqlDataReader = comm.ExecuteReader
        If reader.HasRows Then
            While reader.Read
                fname = reader(0).ToString()
                hoten.Add(fname)
            End While
            reader.Close()
        End If
        Return hoten
    End Function
End Class
