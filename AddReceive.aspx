<!DOCTYPE html>
<!--  This site was created in Webflow. http://www.webflow.com  -->
<!--  Last Published: Tue Jan 19 2021 02:07:46 GMT+0000 (Coordinated Universal Time)  -->
<html data-wf-page="600012b31e4e340d940f06c8" data-wf-site="5fc9e8d6d24a3a09aec5cdc3">

<head>
    <meta charset="utf-8" />
    <title>Add Receiver</title>
    <meta content="Add Receiver" property="og:title" />
    <meta content="Add Receiver" property="twitter:title" />
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
    <header id="nav" class="sticky-nav">
        <div class="close">
            <a href="index.html" class="back-to-home w-inline-block"><img src="Content/images/Icons-Close-16px.svg"
                    loading="lazy" alt="" /></a>
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
                    <img src="Content/images/Group-14876.svg" loading="lazy" alt="" />
                </div>
                <div class="next-step">Thêm người nhận</div>
            </div>
            <div class="spacing---step">
                <img src="Content/images/Group-14878.svg" loading="lazy" alt="" />
            </div>
            <div class="non-step">
                <div class="dot-step">
                    <img src="Content/images/Group-14877.svg" loading="lazy" alt="" />
                </div>
                <div class="body-text-13 grey">Gán trường ký</div>
            </div>
            <div class="spacing---step">
                <img src="Content/images/Group-14878.svg" loading="lazy" alt="" />
            </div>
            <div class="non-step">
                <div class="dot-step">
                    <img src="Content/images/Group-14877.svg" loading="lazy" alt="" />
                </div>
                <div class="body-text-13 grey">Xác nhận và hoàn tất</div>
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
    <div class="add-receiver-body">
        <div class="body-container">
            <div class="heading-receiver">
                <div class="heading-step">Thêm người nhận</div>
            </div>
            <div class="sender-container">
                <div class="icon-sender">
                    <img src="Content/images/Sender-Icon.png" loading="lazy" alt="" />
                </div>
                <div class="sender-text">
                    <div class="title-sender">Người gửi</div>
                    <div class="subtitle-sender" id="nameSend"></div>
                </div>
            </div>
            <div class="vertical-dashed-line">
                <img src="Content/images/Dashed-Line.png" loading="lazy" alt="" />
            </div>
            <div class="sender-container add-margin">
                <div class="icon-sender">
                    <img src="Content/images/Receiver-Icon.png" loading="lazy" alt="" />
                </div>
                <div class="title-sender">Người nhận</div>
            </div>
            <div class="set-order-checkbox">
                <div class="checkbox-form w-form">
                    <label class="w-checkbox checkbox-field">
                        <input type="checkbox" id="ordered-checkbox" name="checkbox" class="w-checkbox-input" />
                        <span class="checkbox-text w-form-label">
                            Thiết lập thứ tự ký
                        </span>
                    </label>
                </div>
            </div>
            <form action="add-signature-field.html" class="add-receiver-area">
                <div id="recipient-list">
                    <div id="original-recipient-block" class="recipient1">
                        <div class="long-dashed-line">
                            <img src="images/Line 130.png" loading="lazy" alt="" />
                            <div class="order-rectangle">
                                <input id="order-input" type="text" name="recipient[][order]" class="order-text w-hidden">
                            </div>
                            <img src="images/Line 130.png" loading="lazy" alt="" />
                        </div class>
                        <div class="add-receiver-container">
                            <div class="info-receiver">
                                <div class="info-card">
                                    <div class="form-container">
                                        <div class="form-block w-form">
                                            <div class="name-container">
                                                <label for="name" class="label-text">Tên người nhận</label>
                                                <div class="name-field">
                                                    <input type="text" class="text-field-3 w-input" name="recipient[][name]"
                                                    pattern="^[\p{L}\s-]+$" placeholder="Nhập tên người nhận" required />
                                                    <a href="#" class="eye-icon w-inline-block"><img
                                                            src="Content/images/Contact-Icon.png" loading="lazy" alt=""
                                                            class="eye-image" /></a>
                                                </div>
                                            </div>
                                            <div>
                                                <label for="email" class="label-text">Email</label>
                                                <input type="email" class="text-field-2 w-input" name="recipient[][email]"
                                                    placeholder="Nhập Email người nhận" required />
                                            </div>
                                        </div>
                                    </div>
                                    <div class="dropdown-container">
                                        <div class="w-dropdown">
                                            <div class="dropdown-toggle-4 w-dropdown-toggle">
                                                <select class="dropdown-text" name="recipient[][action]" id="role-sign">
                                                    <option value="sign-now">Ký tài liệu</option>
                                                    <option value="receive-a-copy">Nhận bản sao</option>
                                                </select>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div id="new-recipient-block" class="recipient">
                        <div class="long-dashed-line">
                            <img src="Content/images/Line 130.png" loading="lazy" alt="" />
                            <div class="order-rectangle">
                                <input id="order-input" type="text" name="recipient[][order]" class="order-text w-hidden">
                            </div>
                            <img src="Content/images/Line 130.png" loading="lazy" alt="" />
                        </div class>
                        <div class="add-receiver-container">
                            <div class="info-receiver">
                                <div class="info-card">
                                    <div class="form-container">
                                        <div class="form-block w-form">
                                            <div class="name-container">
                                                <label for="name" class="label-text">Tên người nhận</label>
                                                <div class="name-field">
                                                    <input type="text" class="text-field-3 w-input" name="recipient[][name]"
                                                    pattern="^[\p{L}\s-]+$" placeholder="Nhập tên người nhận" required />
                                                    <a href="#" class="eye-icon w-inline-block"><img
                                                            src="Content/images/Contact-Icon.png" loading="lazy" alt=""
                                                            class="eye-image" /></a>
                                                </div>
                                            </div>
                                            <div>
                                                <label for="email" class="label-text">Email</label>
                                                <input type="email" class="text-field-2 w-input" name="recipient[][email]"
                                                    placeholder="Nhập Email người nhận" required />
                                            </div>
                                        </div>
                                    </div>
                                    <div class="dropdown-container">
                                        <div class="w-dropdown">
                                            <div class="dropdown-toggle-4 w-dropdown-toggle">
                                                <select class="dropdown-text" name="recipient[][action]" id="role-sign">
                                                    <option value="sign-now">Ký tài liệu</option>
                                                    <option value="receive-a-copy">Nhận bản sao</option>
                                                </select>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div id="delete-btn" class="delete-card">
                                    <a href="#" class="delete-button">
                                        <img class="delete-recipient-button" src="Content/images/Delete-Icon.png"
                                            loading="lazy" alt="" />
                                    </a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="add-margin">
                    <div class="add-button-container">
                        <a href="#" id="add-recipient-button" class="add-person-button w-button">Thêm người nhận</a>
                        <div class="button-divider"></div>
                        <a href="#" class="add-contact-button w-button">Thêm từ danh bạ</a>
                    </div>
                    <div class="add-receiver-button">
                        <a href="upload-file.html" class="back-button w-button">Quay lại</a>
                        <button class="next-button w-button" type="submit">Tiếp tục</button>
                    </div>
                </div>
            </form>
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
                <img src="images/Icon-metro-copyright.png" loading="lazy" alt="" class="image-7" />
                <div class="footer-text">
                    Bản quyền thuộc về Công ty Cổ phần Công nghệ thẻ NACENCOMM
                </div>
            </div>
        </div>
    </div>
    <script src="https://d3e54v103j8qbb.cloudfront.net/js/jquery-3.5.1.min.dc5e7f18c8.js?site=5fc9e8d6d24a3a09aec5cdc3"
        type="text/javascript" integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0="
        crossorigin="anonymous"></script>

    <script src="Scripts/js/webflow.js" type="text/javascript"></script>
    <script src="Scripts/js/pages/create-signature-request.js"></script>
    <script src="Scripts/js/webflow.js" type="text/javascript"></script>
              <script type="text/javascript">
            $(document).ready(function () {
                $("#txtEmail").attr("placeholder", "Nhập Email người nhận");
                var sessionValue = '<%= Session("Name") %>';
                if (sessionValue != null) {
                    document.getElementById("nameSend").innerHTML = sessionValue;
                }
            });
        </script>
    <!-- [if lte IE 9]><script src="https://cdnjs.cloudflare.com/ajax/libs/placeholders/3.0.2/placeholders.min.js"></script><![endif] -->
</body>

</html>
