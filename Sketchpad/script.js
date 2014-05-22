$(document).ready(function () {

	//Initialise Gride
	var input = 64;
	FillGrid(input);
	AddColor();

	//Button is Clicked Function
	$('button').click(function(){
		$('.box').remove();
		input = parseInt(prompt('Please enter a number between 1 and 128'));
			if (input > 128) {
				input = 128;
			}
			else if (input < 1) {
				input = 1;
			}

		FillGrid(input);
		AddColor();
	});

});

//Function to create our grid. Square <div> items tagged with the .box class.
function FillGrid(boxes){
	for (var i = 0; i<(boxes*boxes); i++) {
		$('<div/>', {
			'class'	: 'box',
		}).appendTo('#grid');
	}

	var boxSize = 960 / boxes;
	//Adjust .box size
	$('.box').css({
		'width' : boxSize,
		'height': boxSize
	});
}

//Change Colour Function
function AddColor(){
	$('.box').mouseenter(function(){	
		$(this).addClass('box_coloured');
		$(this).mouseleave(function(){
			$(this).fadeTo('slow', 0.7);			
		});
	});

}