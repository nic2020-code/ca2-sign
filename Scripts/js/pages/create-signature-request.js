(function () {
    function initRecipientForm() {
        var newRecipientBlock = document.querySelector("#new-recipient-block");
        var recipientList = document.querySelector("#recipient-list");
        var addRecipientButton = document.querySelector("#add-recipient-button"); 
        var addOrderRecipient = document.querySelector("#ordered-checkbox");
        var orderInput = document.querySelector("#txtttKy");
        var deleteButton = document.querySelector('#delete-btn');
        var input = document.querySelector('#txtttKy');

        newRecipientBlock.removeAttribute("id");

        addRecipientButton.addEventListener("click", function () {
            newRecipientBlock.style.display = ('flex');
            var cloned = newRecipientBlock.cloneNode(true);
            recipientList.append(cloned);
            deleteButton.classList.remove("w-hidden");
           input.removeAttr('id');

        });

        addOrderRecipient.addEventListener("click", function (event) {
            event.stopPropagation();

            if (addOrderRecipient.checked == true) {
                orderInput.style.display = "block";
            } else {
                orderInput.style.display = "none";
            }
        });
        recipientList.addEventListener("click", function (event) {
            event.stopPropagation();

            if (!event.target.classList.contains("delete-recipient-button"))
                return;
            event.target.closest(".recipient").remove();
        });
    }

    initRecipientForm();
})();
