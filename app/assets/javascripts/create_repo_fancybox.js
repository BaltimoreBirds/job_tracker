
jQuery(document).ready(function() {
	//Launches fancy popup create github repository form		
	$('button.new_repo_btn').click(function(){
		var fancybox = jQuery.fancybox('<div><form><h4>Choose a new repository name:</h4><input type="text" name="repo_create"/><button type=button class="create_repo_button">Create new repository</button></form></div>', {
			'width': 830,
			'height': 600,
			'transitionIn': 'fade',
			'transitionOut': 'fade',
			'autoScale': 'true',
			'scrolling': 'no',
			'autoDimensions': 'false',
		    afterShow: function () {
				$('.create_repo_button').on('click', function(e){
					e.preventDefault();
					var usersRepoName = $('input[name="repo_create"]').val();
					$('.fancybox-close').click();
					createRepo(usersRepoName);
				})

		    }
		}); 
		// posts to createNewRepo job controller action action, updates new job form
		function createRepo(newRepoName){
			$.post( "/createNewRepo", { repoName: newRepoName })
				.done(function( data ) {
				    $('input#job_github_repo').val(data.github_repo);
		  }, "json");
		}
	});

});
