$( document ).ready(function() {
  $('.trigger-login').on('click', function() {
     $('.modal-wrapper-login').toggleClass('open');
     $('.page-wrapper').toggleClass('body-scroll')
    //$('.page-wrapper').toggleClass('blur-it');
     return false;
  });
  
  $('.trigger-signup').on('click', function() {
	     $('.modal-wrapper').toggleClass('open');
	     $('.page-wrapper').toggleClass('body-scroll')
	    //$('.page-wrapper').toggleClass('blur-it');
	     return false;
	  });
});