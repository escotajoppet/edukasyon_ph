function whenJQueryIsReady(){
	if(typeof $ === 'undefined'){
		setTimeout('whenJQueryIsReady', 1500);
	} else{
		setRatingStars();
	}
}

whenJQueryIsReady();