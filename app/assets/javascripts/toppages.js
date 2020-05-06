// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
$('.card-body').hover(
	function(){
		$(this).find('card-text').addClass({'display':'block'})
},
	function(){
		$(this).find('card-text').removeClass({'display':'block'})
});