<%@ Page Language="VB" AutoEventWireup="false" CodeFile="AddSigntureField.aspx.vb" Inherits="AddSigntureField" %>

<!DOCTYPE html><!--  This site was created in Webflow. http://www.webflow.com  -->
<!--  Last Published: Tue Jan 19 2021 02:07:46 GMT+0000 (Coordinated Universal Time)  -->
<html data-wf-page="60011c5a12fdee57bc58cace" data-wf-site="5fc9e8d6d24a3a09aec5cdc3">
<head>
  <meta charset="utf-8">
  <title>Add Signature Field</title>
  <meta content="Add Signature Field" property="og:title">
  <meta content="Add Signature Field" property="twitter:title">
  <meta content="width=device-width, initial-scale=1" name="viewport">
  <meta content="Webflow" name="generator">
  <link href="Content/css/normalize.css" rel="stylesheet" type="text/css">
  <link href="Content/css/webflow.css" rel="stylesheet" type="text/css">
  <link href="Content/css/edoc.webflow.css" rel="stylesheet" type="text/css">
  <!-- [if lt IE 9]><script src="https://cdnjs.cloudflare.com/ajax/libs/html5shiv/3.7.3/html5shiv.min.js" type="text/javascript"></script><![endif] -->
  <script type="text/javascript">!function(o,c){var n=c.documentElement,t=" w-mod-";n.className+=t+"js",("ontouchstart"in o||o.DocumentTouch&&c instanceof DocumentTouch)&&(n.className+=t+"touch")}(window,document);</script>
  <link href="Content/images/favicon.png" rel="shortcut icon" type="image/x-icon">
  <link href="Content/images/webclip.png" rel="apple-touch-icon">
</head>

<body class="body-3">
    <form id="form1" runat="server">
  <header id="nav" class="sticky-nav">
    <div class="close">
      <div class="file-name">Hợp đồng dịch vụ VMI-NACENCOMM 13.7.20.docx.</div>
    </div>
    <div class="nav-right">
      <div class="nav-divider"></div>
      <div class="nav-user">
        <div data-hover="" data-delay="0" class="w-dropdown">
          <div class="w-dropdown-toggle">
            <div class="w-icon-dropdown-toggle"></div>
            <div class="text-block-3">Dropdown</div><img src="Content/images/Group-15056.png" loading="lazy" alt="user">
          </div>
          <nav class="w-dropdown-list">
            <a href="#" class="w-dropdown-link">Link 1</a>
            <a href="#" class="w-dropdown-link">Link 2</a>
            <a href="#" class="w-dropdown-link">Link 3</a>
          </nav>
        </div>
      </div>
    </div>
  </header>
  <div class="add-sign-body">
    <div class="function-signature">
      <form action="review-and-send.html" class="function-container">
        <div class="dropdown-container">
          <div class="w-dropdown">
            <div class="dropdown-toggle-4 w-dropdown-toggle">
              <select
                class="dropdown-text"
                name="signer"
                id="signer"
              >
                <option value="nguyen-thi-thu-hong">Nguyễn Thị Thu Hồng</option>
                <option value="hoang-quoc-khanh">Hoàng Quốc Khanh</option>
              </select>
            </div>
          </div>
        </div>
        <button id="selection-input" type="submit" class="w-hidden">Tiếp tục</button>
      </form>
      <div class="function-text">
        <div class="function-title">Gán trường ký</div>
        <div class="function-divider"></div>
      </div>
      <div class="function-button">
        <a href="#" class="signature-button w-button">Chữ ký điện tử</a>
        <a href="#" class="signature-button w-button">Chữ ký số</a>
      </div>
      <div class="sign-hint">Hướng dẫn: Kéo và thả trường ký vào khu vực ký mong muốn</div>
    </div>
    <div class="pdf-viewer"></div>
  </div>
  <div class="footer-button">
    <div class="add-receiver-button add-width">
      <a href="AddReceive.aspx" class="back-button w-button">Quay lại</a>
      <a href="#" id="footer-btn" class="next-button w-button">Tiếp tục</a>
    </div>
  </div>
<%--  <script src="https://d3e54v103j8qbb.cloudfront.net/js/jquery-3.5.1.min.dc5e7f18c8.js?site=5fc9e8d6d24a3a09aec5cdc3" type="text/javascript" integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"></script>--%>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="Scripts/js/webflow.js" type="text/javascript"></script>
  <script src="Scripts/js/add-signature-field.js"></script>
         <script type="text/javascript">
            $(document).ready(function () {
               
            $.ajax({
                type: "POST",
                url: "AddSigntureField.aspx/GetHoTen",         
                contentType: "application/json; charset=utf-8",
                data:"{}",
                dataType: "json",
                success: function (result) {
                    alert(result);
                }
            });
            });
        </script>
        </form>
  <!-- [if lte IE 9]><script src="https://cdnjs.cloudflare.com/ajax/libs/placeholders/3.0.2/placeholders.min.js"></script><![endif] -->
</body>
</html>