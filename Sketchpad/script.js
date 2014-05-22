var input = 96;
var boxSize = 960 / input-2;


$(document).ready(function () {

	//Fill up #grid with square <div> tags, with the .box class
	for (var i = 0; i<(input*input); i++) {
		$('<div/>', {
			'class'	: 'box',
		}).appendTo('#grid');
	}

	//Adjust .box size
	$('.box').css({
		'width' : boxSize,
		'height': boxSize
	});

	//Hover Effect
	$('.box').mouseenter(function(){
		$(this).css('background-color', 'blue');

		$(this).mouseleave(function(){
			$(this).fadeTo('slow', 0.7);			
		});
	});

});