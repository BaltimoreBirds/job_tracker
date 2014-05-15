jQuery(document).ready(function() {		
	$('button.new_repo_btn').click(function(){
		jQuery.fancybox('<div><form onsubmit="createRepo()"><h4>Choose a new repository name:</h4><input type="text" name="repo_create"/><button>Create new repository</button></form></div>', {
			'width': 830,
			'height': 600,
			'transitionIn': 'fade',
			'transitionOut': 'fade',
			'autoScale': 'true',
			'scrolling': 'no',
			'autoDimensions': 'false',
			'onComplete': function() {
				$('#fancybox-wrap').css({
					'top': '20px'
				});
			}
		});
	});
});