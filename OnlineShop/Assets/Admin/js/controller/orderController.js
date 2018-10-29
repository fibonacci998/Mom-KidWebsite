var order = {
    init: function () {
        order.registerEvent();
    },
    registerEvent: function () {
        $('.btn-active').off('click').on('click', function (e) {
            e.preventDefault();
            var btn = $(this);
            var id = btn.data('id');
            $.ajax({
                url: "/Admin/Order/ChangeStatus",
                data: { id: id },
                type:"POST",
                dataType: "json",
                success: function (response) {
                    if (response.status == true) {
                        btn.text('Chấp nhận');
                    } else {
                        btn.text('Hủy đơn');
                    }
                }
            });
        })
    }
}
order.init();