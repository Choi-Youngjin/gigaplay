$(".gathering-border-playpage").hover(
		function() {
			$(this).css("background", "red");
			$(this).find('a').css("color", "white");
		},
		function() {
			$(this).css("background", "white");
			$(this).find('a').css("color", "black");
		}
);