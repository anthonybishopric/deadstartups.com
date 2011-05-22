function htmlEntities(str) {
    return String(str).replace(/&/g, '&amp;').replace(/</g, '&lt;').replace(/>/g, '&gt;').replace(/"/g, '&quot;');
}

function nl2br (str) {   
	var breakTag =  '<br />' ;    
	return (str + '').replace(/([^>\r\n]?)(\r\n|\n\r|\r|\n)/g, '$1'+ breakTag +'$2');
}


(function($){
	$.fn.blurTitle = function(options){
		return this.each(function(i,e) {
			
			
			var $$ = $(this),
				title = $$.attr('title');
			var fillWithTitle =function(){
					if ($$.val() === '') {
						$$.val(title).addClass('blurred');
					}
				};
			fillWithTitle();
			$$.focus(function(){
				if ($$.val() === title) {
					$$.val('').removeClass('blurred');
				}
			}).blur(function(){
				fillWithTitle();
			});
		});
	};	
})(jQuery);



$(function(){
	$('.blurTitle').blurTitle();
	
	$(".validated").each(function(){
		$(this).validate();
	});
	
	$(".newlines").each(function(){
		$(this).html(nl2br($(this).html()));
	})
	
	$(".date").each(function(){
		$(this).datepicker();
		$(this).datepicker("option", "dateFormat", "yy-mm-dd");

	});
	
	$("#tags").tokenInput("/tags.json",{
		preventDuplicates: true
	});
	
});