$(function(){
  $('.bottom-image-little').hover(
    function(){
      var value = $(this).val()
      $(this).css('opacity',1);
      console.log(value)
    },
    function(){
      $(this).css('opacity',0.5);
    })
});
