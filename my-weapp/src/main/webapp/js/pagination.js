function setPartPerPage(arg){
			partsPerPage = arg;
			prepareQuery();
		}
$('.ten-a,.twentyFive-a,.fifty-a,.hundred-a').click(function(){
	$('.ten-a,.twentyFive-a,.fifty-a,.hundred-a').css('color', 'black');
	var elementId=$(this).attr('id');
	if(elementId=="ten")
		$('.ten-a').css('color', 'blue');
	else if (elementId=="twentyFive")
		$('.twentyFive-a').css('color', 'blue');
	else if (elementId=="fifty")
		$('.fifty-a').css('color', 'blue');
	else if (elementId=="hundred")
		$('.hundred-a').css('color', 'blue');
});

