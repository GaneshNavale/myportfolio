/* HTML document is loaded. DOM is ready. 
-------------------------------------------*/
$(function(){

  // ------- Wow animated ------ //
  wow = new WOW(
  {
    mobile: false
  });
  wow.init();


  // Hide Mobile Menu After Clicking On a link
  $('.nav-link a').click(function(){
        $('.navbar-collapse').collapse('hide');
    });

});