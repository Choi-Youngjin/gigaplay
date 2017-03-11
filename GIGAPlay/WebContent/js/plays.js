$(".gathering-border-playpage").hover(
		function() {
			$(this).css("background", "black");
			$(this).find('a').css("color", "white");
		},
		function() {
			$(this).css("background", "white");
			$(this).find('a').css("color", "black");
		}
);

$(".gathering-border").hover(
		function() {
			$(this).css("background", "black");
			$(this).find('a').css("color", "white");
		},
		function() {
			$(this).css("background", "white");
			$(this).find('a').css("color", "black");
		}
);

$("#error-btn").click(function() {
	 $('.modal-wrapper-error-nologin').toggleClass('open');
	    $('.page-wrapper').toggleClass('body-scroll')
	   //$('.page-wrapper').toggleClass('blur-it');
	    return false;
});