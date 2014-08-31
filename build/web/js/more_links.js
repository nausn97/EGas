jQuery(document).ready(function($) {
    $('#contenu_panneau').hide();
    
    $('.open').click(function() {
        
		if ($('#contenu_panneau').is(':visible')) {
		   
			$('#contenu_panneau').slideUp();				   
		} else {
			$('#contenu_panneau').slideDown();
		}
		
		return false;
	});
});

