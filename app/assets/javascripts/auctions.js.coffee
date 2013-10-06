jQuery ->
$(window).ready ->
	$container = $("#container").masonry()
	$container.imagesLoaded ->
	  $container.masonry
	    itemSelector: ".auction"
	    columnWidth: 70