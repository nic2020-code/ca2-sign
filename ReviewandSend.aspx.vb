﻿
Imports System.IO

Partial Class ReviewandSend
    Inherits System.Web.UI.Page

    Protected Sub ReviewSend_Callback(source As Object, e As DevExpress.Web.CallbackEventArgs)
        Dim arr As String() = e.Parameter.Split("|")
        Dim tieude As String = arr(0)
        Dim loinhan As String = arr(1)
        Dim body As String = String.Empty
        Using reader As StreamReader = New StreamReader(Server.MapPath("NotificationSign.html"))
            body = reader.ReadToEnd()
        End Using
        body = body.Replace("{nameSend}", Session("Name").ToString())
        body = body.Replace("{nameFile}", Session("Namefile").ToString())
        'Dim subject As String = ""
        Dim ccmail As String = ""
        Dim res As Integer = 0
        Dim em As String = arr(2)
        Dim email As String() = em.Split(",")
        For i = 0 To email.Count - 1
            Dim serv As New swEDoc.apiEdoc
            res = serv.SendMail(email(i), loinhan, body, ccmail, tieude)
        Next
        e.Result = res
    End Sub
End Class
