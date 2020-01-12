$(function(){
  $('#price').on('input', function(){
      var data = $('#price').val();
    if (data >= 300 && 9999999 >= data) {
      var profit = Math.round(data * 0.9)
      var fee = (data - profit)
      $('#fee').val('¥'+fee)
      $('.items__cost__price-inputArea-answer').val('¥'+profit)
    }else {
      $('#fee').val('-');
      $('.items__cost__price-inputArea-answer').val('-');
    }
  })


  $('#price').ready(function(){
    var data = $('#price').val();
    if (data >= 300 && 9999999 >= data) {
      var profit = Math.round(data * 0.9)
      var fee = (data - profit)
      $('#fee').val('¥'+fee)
      $('.items__cost__price-inputArea-answer').val('¥'+profit)
    }else {
      $('#fee').val('-');
      $('.items__cost__price-inputArea-answer').val('-');
    }
  })
})