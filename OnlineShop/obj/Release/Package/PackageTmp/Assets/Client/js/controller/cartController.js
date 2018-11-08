var cart = {
    init: function () {
        cart.regEvents();
    },
    regEvents: function () {
        $('#btnContinue').off('click').on('click', function () {
            window.location.href = "/";
        });
        $('#btn_payment').off('click').on('click', function (e) {
            e.preventDefault();
            window.location.href = "/thanh-toan";
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
/*$('#txt-quantity').change(function () {
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
                window.location.replace("/gio-hang");
            }
        }
    })
});*/

$('.txtQuantity').change(function () {
    //$(this).text($($($(this).parent()).parent()).children('td')[2].val() + $($($(this).parent()).parent()).children('td')[3].val());
    $(this).text($($(this).closest("tr")).children('td')[3].text());
});
/*
function updatePrice(price) {
    //$('#total-price').text(parseInt($('#txt-quantity').val()) * parseInt(price));
    $('#total-price').text($($(this).parent()).parent().children('td')[2].val()+$($(this).parent()).parent().children('td')[3].val());
    //$('#txt-quantity').trigger('change');
}*/


