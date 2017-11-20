var count = localStorage.getItem('productCount');
if (count === null) count = 0;
$('span.product-count').text(count);