<%@ Page Language="VB" AutoEventWireup="false" CodeFile="ReviewandSend.aspx.vb" Inherits="ReviewandSend" %>

<!DOCTYPE html>
<!--  This site was created in Webflow. http://www.webflow.com  -->
<!--  Last Published: Tue Jan 19 2021 02:07:46 GMT+0000 (Coordinated Universal Time)  -->
<html
data-wf-page="6001417df548bf1c0d082af0"
data-wf-site="5fc9e8d6d24a3a09aec5cdc3">
<head>
    <meta charset="utf-8" />
    <title>Review And Send</title>
    <meta content="Review And Send" property="og:title" />
    <meta content="Review And Send" property="twitter:title" />
    <meta content="width=device-width, initial-scale=1" name="viewport" />
    <meta content="Webflow" name="generator" />
    <link href="Content/css/normalize.css" rel="stylesheet" type="text/css" />
    <link href="Content/css/webflow.css" rel="stylesheet" type="text/css" />
    <link href="Content/css/edoc.webflow.css" rel="stylesheet" type="text/css" />
    <!-- [if lt IE 9]><script src="https://cdnjs.cloudflare.com/ajax/libs/html5shiv/3.7.3/html5shiv.min.js" type="text/javascript"></script><![endif] -->
    <script type="text/javascript">
        !(function (o, c) {
            var n = c.documentElement,
                t = " w-mod-";
            (n.className += t + "js"),
                ("ontouchstart" in o ||
                    (o.DocumentTouch && c instanceof DocumentTouch)) &&
                (n.className += t + "touch");
        })(window, document);
    </script>
    <link href="Content/images/favicon.png" rel="shortcut icon" type="image/x-icon" />
    <link href="Content/images/webclip.png" rel="apple-touch-icon" />
</head>
<body>
    <form id="form1" runat="server">
        <header id="nav" class="sticky-nav">
            <div class="close">
                <a href="index.html" class="back-to-home w-inline-block">
                    <img src="Content/images/Icons-Close-16px.svg" loading="lazy" alt="" /></a>
            </div>
            <div class="step-tab">
                <div class="done---step">
                    <div class="dot-step">
                        <img src="Content/images/Done-Step.png" loading="lazy" alt="" />
                    </div>
                    <div class="done-step">Tải lên</div>
                </div>
                <div class="spacing---step">
                    <img src="Content/images/Link-Step.png" loading="lazy" alt="" />
                </div>
                <div class="non-step">
                    <div class="dot-step">
                        <img src="Content/images/Done-Step.png" loading="lazy" alt="" />
                    </div>
                    <div class="done-step">Thêm người nhận</div>
                </div>
                <div class="spacing---step">
                    <img src="Content/images/Link-Step.png" loading="lazy" alt="" />
                </div>
                <div class="non-step">
                    <div class="dot-step">
                        <img src="Content/images/Done-Step.png" loading="lazy" alt="" />
                    </div>
                    <div class="done-step">Gán trường ký</div>
                </div>
                <div class="spacing---step">
                    <img src="Content/images/Link-Step.png" loading="lazy" alt="" />
                </div>
                <div class="non-step">
                    <div class="dot-step">
                        <img src="Content/images/Group-14876.svg" loading="lazy" alt="" />
                    </div>
                    <div class="next-step">Xác nhận và hoàn tất</div>
                </div>
            </div>
            <div class="nav-right">
                <div class="nav-divider"></div>
                <div class="nav-user">
                    <div data-hover="" data-delay="0" class="w-dropdown">
                        <div class="w-dropdown-toggle">
                            <div class="w-icon-dropdown-toggle"></div>
                            <div class="text-block-3">Dropdown</div>
                            <img src="Content/images/Group-15056.png" loading="lazy" alt="user" />
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
        <div class="review-body">
            <div class="review-and-send">
                <div class="review-text">
                    <div class="review-heading">Xác nhận và gửi yêu cầu</div>
                    <div class="heading-review-form">Email gửi người nhận</div>
                </div>
                <div class="review-form">
                    <div class="w-form">
                        <form action="index.html" id="email-form" name="email-form">
                            <div class="mail-title">
                                <label for="title-mail" class="message-label">Tiêu đề Email*</label><input
                                    type="text"
                                    class="text-field-4 w-input"
                                    name="title-mail"
                                    placeholder="Nhập tiêu đề mail"
                                    id="title-mail"
                                    required="" />
                            </div>
                            <div class="mail-message">
                                <label for="email-message" class="message-label">Lời nhắn</label><textarea
                                    placeholder="Nhập lời nhắn"
                                    id="email-message"
                                    name="email-message"
                                    class="textarea w-input"></textarea>
                            </div>
                            <div class="form-review-button">
                                <a href="AddSigntureField.aspx" class="button-5 w-button">Quay lại</a><input
                                    type="submit"
                                    value="Gửi yêu cầu"
                                    class="submit-button w-button" />
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
        <div class="request-info">
            <div class="request-container">
                <div class="heading-info">Thông tin chung</div>
                <div class="sender-content">
                    <div class="sender-title">Người gửi</div>
                    <div class="sender-subtitle">Nguyen Tran Van Khanh</div>
                </div>
                <div class="info-divider"></div>
                <div class="file-name-info">
                    <div class="sender-title change-color">Tên văn bản</div>
                    <div class="file-name-border">
                        <div class="file-text">
                            Hợp đồng dịch vụ VMI-NACENCOMM 13.7.20.docx.
                        </div>
                    </div>
                </div>
                <div class="info-divider"></div>
                <div class="sender-title add-margin">Người nhận</div>
                <div class="list-info">
                    <div class="order-rectangle add-prop">
                        <div class="order-text">1</div>
                    </div>
                    <div class="order-card">
                        <div class="title-receiver">
                            <div class="heading">Ký tài liệu</div>
                        </div>
                        <div class="info-review">
                            <div class="info-name">Nguyễn Thị Thu Hồng</div>
                            <div class="info-mail">hongktqd123@gmail.com</div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="footer">
            <div class="footer-container">
                <div class="footer-text">
                    Powered by <a href="#" class="link-5">Ca2</a>
                </div>
                <div class="footer-link">
                    <a href="#" class="link-footer">Liên hệ</a>
                    <div class="footer-divider"></div>
                    <a href="#" class="link-footer">Điều khoản sử dụng</a>
                    <div class="footer-divider"></div>
                    <a href="#" class="link-footer">Chính sách bảo mật</a>
                    <div class="footer-divider"></div>
                    <a href="#" class="link-footer">Quyền sở hữu trí tuệ</a>
                </div>
                <div class="copyright-footer">
                    <img
                        src="Content/images/Icon-metro-copyright.png"
                        loading="lazy"
                        alt=""
                        class="image-7" />
                    <div class="footer-text">
                        Bản quyền thuộc về Công ty Cổ phần Công nghệ thẻ NACENCOMM
                    </div>
                </div>
            </div>
        </div>
        <script
            src="https://d3e54v103j8qbb.cloudfront.net/js/jquery-3.5.1.min.dc5e7f18c8.js?site=5fc9e8d6d24a3a09aec5cdc3"
            type="text/javascript"
            integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0="
            crossorigin="anonymous"></script>
        <script src="Scripts/js/webflow.js" type="text/javascript"></script>
    </form>
    <!-- [if lte IE 9]><script src="https://cdnjs.cloudflare.com/ajax/libs/placeholders/3.0.2/placeholders.min.js"></script><![endif] -->
</body>
</html>

