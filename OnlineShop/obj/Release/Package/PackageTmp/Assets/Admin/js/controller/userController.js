var user = {
    init: function () {
        user.registerEvent();
    },
    registerEvent: function () {
        $('.btn-active').off('click').on('click', function (e) {
            e.preventDefault();
            var id=$(this).data('id');
            $.ajax({
                url: "User/ChangeStatus",
                data: 
            });
        })
    }
}
user.init();