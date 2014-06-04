jQuery(document).ready(function() {

	// Starts Stopwatch
	$('.timer_start').click(function( event ){
		event.preventDefault();
		$('.stopwatch').TimeCircles().start();	
	});
	// Stops Stopwatch
	$('.timer_stop').click(function( event ){
		event.preventDefault();
		$('.stopwatch').TimeCircles().stop();	
	});
	

});