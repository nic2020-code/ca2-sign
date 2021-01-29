Imports System
Imports System.Drawing
Imports System.IO
Imports System.Web

Imports Spire.Doc
Imports Spire.Pdf
Imports Spire.Pdf.Graphics
Partial Class UploadFile
    Inherits System.Web.UI.Page
    Public fn As String
    Protected Sub btnUpload_Click(sender As Object, e As EventArgs)
        If FileUpload1.HasFile Then
            Dim taikhoan As String = Session("Login").ToString
            Dim rootpath As String = Server.MapPath("FilePDF/" & taikhoan & "/")
            Dim drname As String = Server.MapPath("FilePDF/" & taikhoan & "/Fileinput/")
            If Not Directory.Exists(rootpath) Then
                Directory.CreateDirectory(rootpath)
            End If
            If Not Directory.Exists(drname) Then
                Directory.CreateDirectory(drname)
            End If
            Dim ext, fullname, fileinput As String
            fullname = FileUpload1.FileName
            ext = Path.GetExtension(FileUpload1.FileName)
            Dim temp As String() = fullname.Split(".")
            fileinput = drname & temp(0) & "_" & Path.GetRandomFileName & ext


            FileUpload1.SaveAs(fileinput)
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
            Response.Redirect("AddReceivee.aspx")
        End If
        'e.CallbackData = idfile & "|" & url & "/FilePDF/" & taikhoan & "/Fileinput/" & Path.GetFileName(newfile)
        'aspxUpload.JSProperties("idfile") = idfile
        'trangthai van ban :0: Bản nháp,1: Đang chờ, 2: Bị từ chối, 3: Đã thu hồi, 4: Đã xóa,5: Đã hoàn thành
    End Sub

    'End Sub
End Class
