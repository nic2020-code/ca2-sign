
Imports System
Imports System.Drawing
Imports System.IO
Imports System.Web

Imports Spire.Doc
Imports Spire.Pdf
Imports Spire.Pdf.Graphics


Partial Class Taoyeucauky

    Inherits System.Web.UI.Page
    Public fn As String

    Protected Sub aspxUpload_FileUploadComplete(sender As Object, e As DevExpress.Web.FileUploadCompleteEventArgs)
        Dim taikhoan As String = hdUser("value").ToString
        Dim rootpath As String = Server.MapPath("FilePDF/" & taikhoan & "/")
        Dim drname As String = Server.MapPath("FilePDF/" & taikhoan & "/Fileinput/")
        If Not Directory.Exists(rootpath) Then
            Directory.CreateDirectory(rootpath)
        End If
        If Not Directory.Exists(drname) Then
            Directory.CreateDirectory(drname)
        End If
        Dim ext, fullname, fileinput As String
        fullname = e.UploadedFile.FileName
        ext = Path.GetExtension(e.UploadedFile.FileName)
        Dim temp As String() = fullname.Split(".")
        fileinput = drname & temp(0) & "_" & Path.GetRandomFileName & ext
        e.UploadedFile.SaveAs(fileinput)
        'Dim drname As String = Server.MapPath("FilePDF/")
        'If Not Directory.Exists(drname) Then
        '    Directory.CreateDirectory(drname)
        'End If
        'Dim ext, name, fullname As String
        'fullname = e.UploadedFile.FileName
        'Dim temp As String() = fullname.Split(".")
        'ext = Path.GetExtension(e.UploadedFile.FileName)
        'name = temp(0) & "_" & Path.GetRandomFileName & ".pdf"
        'Dim filePath As String = Server.MapPath("FilePDF/")
        'e.UploadedFile.SaveAs(newfile)
        Dim tengoc, newfile As String
        tengoc = fullname
        newfile = drname & temp(0) & "_" & Path.GetRandomFileName & ".pdf"
        If ext = ".pdf" Then
            If System.IO.File.Exists(fileinput) = True Then
                System.IO.File.Copy(fileinput, newfile)
                fn = newfile
                'show file pdf
            End If
        ElseIf ext = ".docx" Then
            If System.IO.File.Exists(fileinput) = True Then
                Dim document As New Document()
                document.LoadFromFile(fileinput)
                'Convert Word to PDF                    
                document.SaveToFile(newfile, Spire.Doc.FileFormat.PDF)
                fn = newfile
                'PdfViewer1.LoadDocument(NewCopy)
            End If
        ElseIf ext = ".doc" Then
            If System.IO.File.Exists(fileinput) = True Then
                Dim document As New Document()
                document.LoadFromFile(fileinput)
                'Convert Word to PDF                    
                document.SaveToFile(newfile, Spire.Doc.FileFormat.PDF)
                fn = newfile
                'PdfViewer1.LoadDocument(NewCopy)
            End If
        ElseIf ext = ".xls" Then
            If System.IO.File.Exists(fileinput) = True Then
                Dim workbook As New Spire.Xls.Workbook()
                workbook.LoadFromFile(fileinput)
                workbook.SaveToFile(newfile, Spire.Xls.FileFormat.PDF)
                fn = newfile
                'PdfViewer1.LoadDocument(newfile)
            End If
        ElseIf ext = ".xlsx" Then
            If System.IO.File.Exists(fileinput) = True Then
                Dim workbook As New Spire.Xls.Workbook()
                workbook.LoadFromFile(fileinput)
                workbook.SaveToFile(newfile, Spire.Xls.FileFormat.PDF)
                fn = newfile
                'PdfViewer1.LoadDocument(newfile)
            End If
        ElseIf ext = ".txt" Then
            Dim text As String = File.ReadAllText(fileinput)
            Dim doc As New Spire.Pdf.PdfDocument()
            Dim section As PdfSection = doc.Sections.Add()
            Dim page As PdfPageBase = section.Pages.Add()
            Dim font As New Spire.Pdf.Graphics.PdfFont(PdfFontFamily.Helvetica, 11)
            Dim format As New Spire.Pdf.Graphics.PdfStringFormat()
            format.LineSpacing = 20.0F
            Dim brush As PdfBrush = PdfBrushes.Black
            Dim textWidget As New PdfTextWidget(text, font, brush)
            Dim y As Single = 0
            Dim textLayout As New PdfTextLayout()
            textLayout.Break = PdfLayoutBreakType.FitPage
            textLayout.Layout = PdfLayoutType.Paginate
            Dim bounds As New RectangleF(New PointF(0, y), page.Canvas.ClientSize)
            textWidget.StringFormat = format
            textWidget.Draw(page, bounds, textLayout)
            fn = newfile
            doc.SaveToFile(newfile, Spire.Pdf.FileFormat.PDF)
            'PdfViewer1.LoadDocument(newfile)
        Else
            Dim doc As New Spire.Pdf.PdfDocument()
            Dim section As PdfSection = doc.Sections.Add()
            Dim page As PdfPageBase = doc.Pages.Add()
            Dim image As Spire.Pdf.Graphics.PdfImage = Spire.Pdf.Graphics.PdfImage.FromFile(fileinput)
            'Set image display location and size in PDF
            Dim widthFitRate As Single = image.PhysicalDimension.Width / page.Canvas.ClientSize.Width
            Dim heightFitRate As Single = image.PhysicalDimension.Height / page.Canvas.ClientSize.Height
            Dim fitRate As Single = Math.Max(widthFitRate, heightFitRate)
            Dim fitWidth As Single = image.PhysicalDimension.Width / fitRate
            Dim fitHeight As Single = image.PhysicalDimension.Height / fitRate
            page.Canvas.DrawImage(image, 30, 30, fitWidth, fitHeight)
            Dim tempfile As String = "preview.pdf"
            doc.SaveToFile(newfile, Spire.Pdf.FileFormat.PDF)
            fn = newfile
            'PdfViewer1.LoadDocument(newfile)
        End If
        Dim url As String = HttpContext.Current.Request.Url.Scheme & "://" & HttpContext.Current.Request.Url.Authority
        Dim serv As New swEDoc.apiEdoc
        Dim idfile As Integer = serv.TaoVB(tengoc, newfile, taikhoan, 0)
        Session("idFile") = idfile
        Session("user") = taikhoan
        e.CallbackData = idfile & "|" & url & "/FilePDF/" & taikhoan & "/Fileinput/" & Path.GetFileName(newfile)
        'aspxUpload.JSProperties("idfile") = idfile
        'trangthai van ban :0: Bản nháp,1: Đang chờ, 2: Bị từ chối, 3: Đã thu hồi, 4: Đã xóa,5: Đã hoàn thành
    End Sub


    'Protected Sub cpSave_Callback(source As Object, e As DevExpress.Web.CallbackEventArgs)
    '    Dim serv As New swEDoc.apiEdoc
    '    Dim res As Integer = 0

    '    'Dim idfile As Integer = Convert.ToInt32(Session("idFile").ToString)
    '    Dim idfile As Integer = Convert.ToInt32(hdIDfile("value").ToString)
    '    If cmbNguoinhan.Tokens.Count > 0 Then
    '        Dim i As Integer
    '        Dim arr As String() = cmbNguoinhan.Value.ToString.Split(",")
    '        For i = 0 To arr.Count - 1
    '            res = serv.Thietlaptaikhoanky(idfile, arr(i), 0, String.Empty, String.Empty, String.Empty, String.Empty, Session("user").ToString)
    '            serv.GuiVB_Capnhatchitietguinguoinhan(idfile, arr(i))
    '        Next
    '        serv.GuiVB_CapnhatTTVB(idfile)
    '    End If

    '    e.Result = res
    'End Sub

    Private Sub Taoyeucauky_Load(sender As Object, e As EventArgs) Handles Me.Load
        If Not IsPostBack Then
            hdUser("value") = String.Empty
            hdIDfile("value") = String.Empty
        End If
        Spire.License.LicenseProvider.SetLicenseKey("PD94bWwgdmVyc2lvbj0iMS4wIiBlbmNvZGluZz0idXRmLTgiIHN0YW5kYWxvbmU9InllcyI/Pgo8TGljZW5zZSBLZXk9ImNyOERaN1hKMkR5MUs2UUJBTkRPSVRLdlpjTzZkelVod2lsSHBnVlluQ3k0cXlHV2V6TFZubFJGeFAxNU1mSWZnUmdNWm1XaEdOQWRFNFRqZWZnQ1ovbFR2b1BkSXRIbDZXdDVBNWk1TVhFbnFkQnVPMUthRnovRFFzYUdWTGhzdjlySG1ybnRxSElFRGxJeGRxYUpNcGtLb0Frd1A3d1N6T01KMVkrbUNmVTVVRmV6REwvTjd1enJ4M0Y0d2I1SGErd0E2VFQ5VFJ3SzAzejlFS01aRmwzU1lSL3o0YVU3TE0wZFNYWTlqU0ZKZ2dqZlZzRFVLaUJyVm5td1ljaXVyOUVrYmw5Q3RaWTAzdG1yZm01QlplKzZnaHRFTm4wb2gzMzh0WlJleWpjcjc0QWs3MWhnWWtuTE9CQzE1VllmalhzcXVBVW13MlI2TWNWMlBPT2JyY1RSYlhBZ3pvUWJPeWQ4U2JFWmN3aE43NktQd1dzUVFTMUowdGlZSFVLeE9tMnQ0ZkJWMGhQVmhhOUI4Y0swNHFKUVp0MDBaMWNKRGEwd2I4VWx6RWs5QkhVVzJlbk9mVDE0UnlIQ2krWUdlbVBLY2RDUXJoMXpyWVRGN0ltb0x4N3h1NGV2RFRZc2xzV0JrbFFJb3g4NnJWckVVa1N0dXErQUNTWS9xVTM5L1Zhd3Y5S0FmUjVUZUVicGt3RGhTYjBOQkFqVDhBeXRsRFZkR2ZpZzBxS0czVllpVHBYRnc1cHRMVmgrYmtkK2RnN3Z4dHZyNDVaVVdKZXlyekdOR0g3YUZZZDZwLzJNRy9YSlRsR3ovU05RbzJDUExraU83SlhuOU5HZXhaN3BIbTBkZ3pNWmJHRVhxVmR2bG04MTJhL1hMMVNxeEdVWStvNVpsVUM3WTV4Z2dhRCtGZVA5enpoeUpxSUVwcDk3My9ScTRteG1wQWZMcVNzTzJSeHlTcStpdjFDc3AwQ3JvMDc4OEhybDFteWt4dVQweWRSWVpDNkRTeDhNMi9MWTNkOXNud3U3NkFmYjVDOVF1ZE9Zc0wzREh2aGZncmNVSWUvcUhmVFo5QWF6Y3pUanlyM2RPQkFjczBLZk12Y0xVUzRSeHZDdW1NNDVyNDJnMXJ3UGluN2JBcmYvZnNMTzZtS3g0WWRoSURNWlF6V3RjbkhFSTF5TXJ6aU9pdXhMdE8xalRBV25uU2VLVDJ0cXI3Tm42Qmg5TURHNjZZK2lJaW4xV05TUCtMdDFYdXRkajNKTyt4b1FNUVB5ZFpoZkJYZXpVMEhRMnd0eEdwdzRNczRTMTVJbFg1TEdXR3dXeUdYTWNjVWd3b1RDeFRGYmgyZFo0Vkg3OVZHTEVFR1JRWEZrNTRBdlFLdFBpdUcxY0w4RFo3WEoyRHkxSzZUUWVORE9YeFl2NFNveitCMHNBS0VwTVRrNCtTYWpYNksrSjlUOFhZVXRTOE8wWWZGUFZqZkhIYTZORWQyODdVcUlqMnJnQlF1bjVDV3hCczFHUm5BYmd1Z3MyL2ZQakcwZmdQemdSYzR5Q3ZObFg4V2pKUnloc3U5VFRKTjd1R3NOdnprU2IyZWlyQmhEaG1vQ0Jqa0wyYnMzT3I2d2pnNnBUNVpmNGhEdDF0STBJNXo1aytxQXVSZnRhd1lmamhXYmpMS0xKOTlUVk1kRDZaTCtTenNtQkNWN05lYm96V0RUTWgrRnJPT292R09ZbUk1bWp4Smd1MVRXNnI1V0JUK2oxSjBFNmJIb2tEMWo0Wm1DWUQreVBPUW1PMm1yUTNGdC9jVmZwQWlJdzliRkgwZ1FIbXQ4QnNuZnQ2MVV3c1h6cSs2akNvY1hOOUMvRXZPblhTczZuVlNGSkVBL3l1QmNIazZxOWdqanBnRG1NTEcrNlpxR1VjRWMzZEp2THpuK3pNT0p3TDI4WUQxN3BLSXBUNnd6WFBFVFJwWS9qNHhoMkQvaFhJRVNHcTk1eTVmZE9MNmx1QT09IiBWZXJzaW9uPSI5LjkiPgogICAgPFR5cGU+UnVudGltZTwvVHlwZT4KICAgIDxVc2VybmFtZT5Vc2VyTmFtZTwvVXNlcm5hbWU+CiAgICA8RW1haWw+ZU1haWxAaG9zdC5jb208L0VtYWlsPgogICAgPE9yZ2FuaXphdGlvbj5Pcmdhbml6YXRpb248L09yZ2FuaXphdGlvbj4KICAgIDxMaWNlbnNlZERhdGU+MjAxNi0wMS0wMVQxMjowMDowMFo8L0xpY2Vuc2VkRGF0ZT4KICAgIDxFeHBpcmVkRGF0ZT4yMDk5LTEyLTMxVDEyOjAwOjAwWjwvRXhwaXJlZERhdGU+CiAgICA8UHJvZHVjdHM+CiAgICAgICAgPFByb2R1Y3Q+CiAgICAgICAgICAgIDxOYW1lPlNwaXJlLk9mZmljZSBQbGF0aW51bTwvTmFtZT4KICAgICAgICAgICAgPFZlcnNpb24+OS45OTwvVmVyc2lvbj4KICAgICAgICAgICAgPFN1YnNjcmlwdGlvbj4KICAgICAgICAgICAgICAgIDxOdW1iZXJPZlBlcm1pdHRlZERldmVsb3Blcj45OTk5OTwvTnVtYmVyT2ZQZXJtaXR0ZWREZXZlbG9wZXI+CiAgICAgICAgICAgICAgICA8TnVtYmVyT2ZQZXJtaXR0ZWRTaXRlPjk5OTk5PC9OdW1iZXJPZlBlcm1pdHRlZFNpdGU+CiAgICAgICAgICAgIDwvU3Vic2NyaXB0aW9uPgogICAgICAgIDwvUHJvZHVjdD4KICAgIDwvUHJvZHVjdHM+CiAgICA8SXNzdWVyPgogICAgICAgIDxOYW1lPklzc3VlcjwvTmFtZT4KICAgICAgICA8RW1haWw+aXNzdWVyQGlzc3Vlci5jb208L0VtYWlsPgogICAgICAgIDxVcmw+aHR0cDovL3d3dy5pc3N1ZXIuY29tPC9Vcmw+CiAgICA8L0lzc3Vlcj4KPC9MaWNlbnNlPg==")
    End Sub
End Class
