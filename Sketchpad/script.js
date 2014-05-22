$(document).ready(function () {

	//Initialise Grid
	var input = 64;
	FillGrid(input);
	ChangeColor();

	//Sketch Button is Clicked
	$('#sketch').click(function(){
		$('.box').remove();
		input = parseInt(prompt('Please enter a number between 1 and 128'));
			if (input > 128) 
				{ input = 128; }
			else if (input < 1) 
				{ input = 1; }
		//Call Functions to re-fill our container
		FillGrid(input);
		ChangeColor();
	});

	//Funky Trails Button is Clicked
	$('#funky').click(function(){
		$('.box').remove();
		input = parseInt(prompt('Please enter a number between 1 and 128'));
			if (input > 128) 
				{ input = 128; }
			else if (input < 1) 
				{ input = 1; }
		//Call Functions to re-fill our container
		FillGrid(input);
		FunkyTrail();
	});

});

//FUNCTIONS -- These functions are called in the main body

//This creates our grid. Square <div> items tagged with the .box class.
function FillGrid(boxes){
	//For loop fills the grid
	for (var i = 0; i<(boxes*boxes); i++) {
		$('<div/>', {
			'class'	: 'box',
		}).appendTo('#grid');
	}
	//Adjust .box size based on grid size (960px)
	var boxSize = 960 / boxes;	
	$('.box').css({
		'width' : boxSize,
		'height': boxSize
	});
}

//Change Colour Function
function ChangeColor(){
	$('.box').mouseenter(function(){	
		$(this).addClass('box_coloured');
		$(this).mouseleave(function(){
			$(this).fadeTo('slow', 0.7);			
		});
	});
}

//Funky Trails Function
function FunkyTrail(){
	$('.box').mouseenter(function(){
		$(this).fadeTo(100, 0);		
		// $(this).addClass('box_coloured');
		$(this).mouseleave(function(){
				$(this).fadeTo(400,1);
		});
	});
}
