$(function(){
  $('.slider-item').slick({
    arrows:false,
    asNavFor:'.thumb-item',
    slidesToShow:1
  });
  $('.thumb-item').slick({
    asNavFor:'.slider-item',
    focusOnSelect: true,
    slidesToShow:10,
    slidesToScroll:1,
    infinite: false,
    variableWidth: false
  });
  $('.product__main__item-subimage').parent().removeClass().addClass("Gheeee");;
});