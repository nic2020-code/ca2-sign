<%@ Page Language="VB" AutoEventWireup="false" MasterPageFile="~/MasterPage.master" CodeFile="Contact.aspx.vb" Inherits="Contact" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
 <div style="opacity:0" class="background-modal">
    <div class="modal-form">
      <div class="heading-modal">
        <div class="title-modal">Thêm liên hệ mới</div>
        <div data-w-id="364e1923-9d43-5395-460f-ad19efcd0897" class="close-button"><img src="images/Path-30115.png" loading="lazy" alt="Close Modal"></div>
      </div>
      <div class="add-contact-form w-form">
        <form id="email-form" name="email-form" data-name="Email Form" method="post">
          <div class="name-field"><label for="name" class="field-label">Họ và tên*</label><input type="text" class="text-field w-input" maxlength="256" name="name" data-name="Name" placeholder="Nhập họ và tên" id="name" required=""></div>
          <div class="name-field"><label for="Email" class="field-label">Email*</label><input type="email" class="text-field w-input" maxlength="256" name="Email" data-name="Email" placeholder="Nhập Email" id="Email" required=""></div>
          <div class="name-field"><label for="Company" class="field-label">Tên Công ty</label><input type="text" class="text-field w-input" maxlength="256" name="Company" data-name="Company" placeholder="Nhập tên công ty" id="Company"></div>
          <div class="name-field add-margin"><label for="Phone" class="field-label">Số điện thoại</label><input type="tel" class="text-field w-input" maxlength="256" name="Phone" data-name="Phone" placeholder="Nhập số điện thoại" id="Phone"></div>
          <div class="two-button">
            <a data-w-id="9f68cfc0-9335-39b2-174e-0dc57e3b6817" href="#" class="ghost-button w-button">Bỏ qua</a><input type="submit" value="Xác nhận" data-wait="" class="form-button button-color add-width w-button">
          </div>
        </form>
        <div class="w-form-done">
          <div>Thank you! Your submission has been received!</div>
        </div>
        <div class="w-form-fail">
          <div>Oops! Something went wrong while submitting the form.</div>
        </div>
      </div>
    </div>
  </div>

  <div class="w-layout-grid dashboard-grid">
    <div id="w-node-7889c68f6827-595a19e4" class="menu-left">
      <div class="title-menu">danh bạ</div>
      <a href="#" class="menu-link w-inline-block">
        <div class="item-menu-container">
          <div class="menu-text-link">Tất cả liên hệ</div>
        </div>
      </a>
      <a href="#" class="menu-link w-inline-block">
        <div class="item-menu-container space-between">
          <div class="item-left">
            <div class="menu-text-link">Nhóm</div>
          </div>
          <div class="item-right"><img src="Content/images/Group-15086_1.png" loading="lazy" alt="function"></div>
        </div>
      </a>
    </div>
    <div class="work-area">
      <div class="heading-container reset-margin">
        <div class="heading-text">Tất cả liên hệ</div>
        <a data-w-id="b7306d4b-9b2b-8819-9a89-2495b3b6303b" href="#" class="contact-button w-button">Thêm liên hệ</a>
      </div>
      <div class="subtitle-heading">05 liên hệ</div>
      <div class="contact-title-table">
        <div class="w-layout-grid title-contact-grid">
          <div id="w-node-cb433ce5a059-595a19e4" class="title-contact-name">
            <div class="title-text add-size">Họ và tên</div>
          </div>
          <div id="w-node-d8d306320963-595a19e4" class="title-contact-name">
            <div class="title-text add-size">Địa chỉ Email</div>
          </div>
          <div id="w-node-35a003a73163-595a19e4" class="title-contact-name">
            <div class="title-text add-size">Số điện thoại</div>
          </div>
          <div id="w-node-64c9b9b7822a-595a19e4" class="title-contact-name">
            <div class="title-text add-size">Nhóm</div>
          </div>
        </div>
      </div>
      <div class="contact-table-row">
        <div class="w-layout-grid row-grid">
          <div style="margin-left: 30px;"><input type="checkbox" id="" name="" value=""></div>
          <div id="w-node-9dee574de6fc-595a19e4" class="text-container">
            <div class="text-style medium-weight">Nguyen Tran Van Khanh</div>
          </div>
          <div id="w-node-a695b6b32604-595a19e4" class="text-container">
            <div class="text-style">nguyenvankhanh123@gmail.com</div>
          </div>
          <div id="w-node-b8ef967b8291-595a19e4" class="text-container">
            <div class="text-style">+84 972 373 2115</div>
          </div>
          <div id="w-node-5a52419acfa0-595a19e4" class="text-container">
            <div class="text-style">NACENCOMM</div>
          </div>
          <div id="w-node-5cf798cd9dab-595a19e4" class="function-row">
            <div data-hover="" data-delay="0" class="w-dropdown">
              <div class="dropdown-button w-dropdown-toggle"><img src="Content/images/Group-15086_1.png" loading="lazy" alt="function"></div>
              <nav class="dropdown-menu w-dropdown-list">
                <a href="#" class="w-dropdown-link">Link 1</a>
                <a href="#" class="w-dropdown-link">Link 2</a>
                <a href="#" class="w-dropdown-link">Link 3</a>
              </nav>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
    </asp:Content>