function setRatingStars(){
	$('.rates').each(function(){
		rate = parseFloat($(this).data('rate'));

		$(this).find('.stars').each(function(){
			if(parseFloat($(this).data('star')) <= rate){
				$(this).addClass('rated');
			}
		});
	});
}