var email = {
    init: function () {
        email.registerEvent();
    },
    registerEvent: function () {
        $('.btn-active').off('click').on('click', function (e) {
            e.preventDefault();
            var btn = $(this);
            var id = $('#contact_email').val();
            alert(id);
            $.ajax({
                url: "/Home/UpdateMail",
                data: { xemail: id },
                type: "POST",
                dataType: "json",
                success: function (response) {
                    if (response.status == true) {
                        alert("Thank you!! We will send news and promotion for you");
                    } else {
                        alert("Some error was happened. Contact admin soon");
                    }
                }
            });
        })
    }
}
email.init();
