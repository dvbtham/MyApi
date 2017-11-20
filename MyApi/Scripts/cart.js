$(function () {
    loadData();

    $('#btnRemoveItem').off('click').on('click', function (e) {
        e.preventDefault();
        var result = confirm("Are you sure that you want to delete this item?");
        if (result) {
            var productId = parseInt($(this).data('id'));
            deleteItem(productId);
        }

    });
    $('.txtQuantity').on('keyup', function (e) {
        var quantity = parseInt($(this).val());
        var productId = parseInt($(this).data('id'));
        var price = parseFloat($(this).data('price'));
        if (!isNaN(quantity)) {
            var amount = quantity * price;
            $('#amount_' + productId).text(numeral(amount).format('0,0') + ' đ');
            $('span.product-count').text(getTotalOrder().quantity);
            $('#lblTotalOrder').text(numeral(getTotalOrder().amount).format('0,0'));
            $('#lblTotalOrder').val(numeral(getTotalOrder().amount).format('0,0'));
            $('#amount').text(numeral(getTotalOrder().amount).format('0,0'));
        }
        else {
            $('#amount_' + productId).text(0);
            $('span.product-count').text(0);
            $('#lblTotalOrder').text(0);
            $('#lblTotalOrder').val(0);
            $('#amount').text(0);
        }
    });
    $('#btnContinute').off('click').on('click', function (e) {
        e.preventDefault();
        window.location.href = "/";
    });
    $('#btnUpdate').off('click').on('click', function (e) {
        e.preventDefault();
        var result = confirm("Are you want to update this item?");
        if (result)
            updateCart();
    });

    $('#btnDeleteAll').off('click').on('click', function (e) {
        e.preventDefault();
        var result = confirm("Are you want to empty your cart?");
        if (result)
            deleteAll();
    });

    $('#btnCheckout').off('click').on('click', function (e) {
        e.preventDefault();

        $('#paymentMethodTow').removeClass('hide');
        $('.bangthanhtoan').removeClass('hide');
        $('html, body').animate({
            scrollTop: $("#bangthanhtoan").offset().top
        }, 1000);
    });

    function createOrder() {
        var order = {
            CustomerName: $('#fullname').val(),
            CustomerEmail: $('#email').val(),
            CustomerAddress: $('#address').val(),
            CustomerPhone: $('#phone').val()
        }
        $.ajax({
            url: '/Cart/CreateOrder',
            type: 'POST',
            dataType: 'json',
            data: {
                orderViewModel: JSON.stringify(order)
            },
            success: function (res) {
                if (res.status) {
                    deleteAll();
                    
                } else {
                    if (res.message)
                        toastr.error(res.message);
                }
            },
            error: function (res) {
                console.log(res);
            }
        });
    };

    $("#frmCheckout").submit(function (e) {
        createOrder();
    });

    function updateCart() {
        var cartListModel = [];
        $.each($('.txtQuantity'), function (i, item) {
            cartListModel.push({
                ProductId: $(item).data('id'),
                Quantity: $(item).val()
            });
        });

        $.ajax({
            url: '/Cart/Update',
            dataType: 'json',
            type: 'POST',
            data: {
                cartData: JSON.stringify(cartListModel)
            },
            success: function (res) {
                if (res.status) {
                    loadData();
                    toastr.success('Updated successfully');
                }
            }
        });
    };

    function deleteItem(productId) {
        $.ajax({
            url: '/Cart/DeleteItem',
            type: 'POST',
            dataType: 'json',
            data: {
                productId: productId
            },
            success: function (res) {
                if (res.status) {
                    toastr.success('Deleted.');
                    loadData();
                }
            }
        });
    };
    function deleteAll() {
        $.ajax({
            url: '/Cart/DeleteAll',
            type: 'POST',
            dataType: 'json',
            success: function (res) {
                if (res.status) {
                    toastr.success('All item is Deleted.');
                    localStorage.setItem("productCount", 0);
                    loadData();
                }
            }
        });
    };
    function getTotalOrder() {
        var listTextbox = $('.txtQuantity');
        var total = {
            amount: 0,
            quantity: 0
        };
        $.each(listTextbox, function (i, item) {
            total.amount += parseInt($(item).val()) * parseFloat($(item).data('price'));
            total.quantity += parseInt($(item).val());
        });
        return total;
    }
    function loadData() {
        $.ajax({
            url: '/Cart/GetAll',
            type: 'GET',
            dataType: 'json',
            success: function (res) {
                if (res.status) {
                    var template = $('#templateCart').html();
                    var html = '';
                    var data = res.data;
                    $.each(data,
                        function (i, item) {
                            html += Mustache.render(template,
                                {
                                    ProductId: item.ProductId,
                                    ProductName: item.Product.Name,
                                    Image: item.Product.Image,
                                    Price: item.Product.Price,
                                    FPrice: numeral(item.Product.Price).format('0,0'),
                                    Quantity: item.Quantity,
                                    Amount: numeral(item.Quantity * item.Product.Price).format('0,0'),
                                });
                        });
                    $('#cartBody').html(html);
                    if (html == '')
                        $('#tblCartTable')
                            .html('<h4 class="text-center text-danger">Cart is empty.</h4>');

                    $('#lblTotalOrder').text(numeral(getTotalOrder().amount).format('0,0'));
                    $('#amount').text(numeral(getTotalOrder().amount).format('0,0'));
                    $('span.product-count').text(getTotalOrder().quantity);

                }
            }
        });
    }
});