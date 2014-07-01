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
	//ends job_session. Collects session length from DOM. POST to job_session controller.
	$('.session_end').click(function( event ){
		event.preventDefault();
		$('.stopwatch').TimeCircles().stop();
		var sessionDays = parseInt($('div.textDiv_Days > span').text());
		var sessionHours = parseInt($('div.textDiv_Hours > span').text());
		var sessionMins = parseInt($('div.textDiv_Minutes > span').text());
		var sessionSecs = parseInt($('div.textDiv_Seconds > span').text());
		//Calculates Session length in seconds
		var sessionLength = (sessionDays*86400) + (sessionHours*3600) + (sessionMins*60) + sessionSecs;
		$.post( "/endSession", { length: sessionLength, job_sessionId: window.job_sessionId })
			.done(function( data ) {
		    alert(data);
		}, "json");	
	});
	

});