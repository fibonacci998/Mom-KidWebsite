var cart = {
    init: function () {
        cart.regEvents();
    },
    regEvents: function () {
        $('#btnContinue').off('click').on('click', function () {
            window.location.href = "/";
        });
        $('#btnUpdate').off('click').on('click', function () {
            var listProduct = $('.txtQuantity');
            var cartList = [];
            $.each(listProduct, function (i, item) {
                cartList.push({
                    Quantity: $(this).val(),
                    Product: {
                        ID:$(item).data('id')
                    }
                });
            });
            $.ajax({
                url:'/Cart/Update',
                data: { cartModel: JSON.stringify(cartList) },
                dataType:'json',
                type: 'POST',
                success: function (res) {
                    if (res.status == true) {
                        window.location.href = "/gio-hang";
                    }
                }
            })
        });
        $('#delete_cart').off('click').on('click', function () {
            $.ajax({
                url: '/Cart/DeleteAll',
                dataType: 'json',
                type: 'POST',
                success: function (res) {
                    if (res.status == true) {
                        window.location.href = "/gio-hang";
                    }
                }
            })
        });
        $('.btn-delete').off('click').on('click', function (e) {
            e.preventDefault();
            $.ajax({
                data:{id:$(this).data('id')},
                url: '/Cart/Delete',
                dataType: 'json',
                type: 'POST',
                success: function (res) {
                    if (res.status == true) {
                        window.location.href = "/gio-hang";
                    }
                }
            })
        });
    }
}
cart.init();

$('#txt-quantity').change(function () {
    //var quantity = Number($(this).val());

    //var total = quantity * 2;
    //$('#total-price').html(total);
    var listProduct = $('.txtQuantity');
    var cartList = [];
    $.each(listProduct, function (i, item) {
        cartList.push({
            Quantity: $(this).val(),
            Product: {
                ID: $(item).data('id')
            }
        });
    });
    $.ajax({
        url: '/Cart/Update',
        data: { cartModel: JSON.stringify(cartList) },
        dataType: 'json',
        type: 'POST',
        success: function (res) {
            if (res.status == true) {
                window.location.href = "/gio-hang";
            }
        }
    })
});
function updatePrice(val) {
    $('#txt-quantity').val = val;
    $('#txt-quantity').trigger('change');
}

