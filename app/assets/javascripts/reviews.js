// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

function activateRating(){
	$('.stars').click(function(){
		var rate = parseInt($(this).data('star'));

		$('.stars').each(function(){
			if(parseInt($(this).data('star')) <= rate) $(this).addClass('rated');
			else $(this).removeClass('rated');
		});

		$('#review_rating').val(parseFloat($(this).data('star')));
	});
}