(function($) {
	$.fn.galleryPagination = function(options) {
		//alert('running function');
		var settings = {
			nop     : 20, // The number of posts per scroll to be loaded
			offset  : 0, // Initial offset, begins at 0 in this case
            s  : 'all',
            gallery : 0,  //initial gallery.  //this is to power image listings for a gallery
            ajaxSource: 'default.php',  //this will be a specific ajax file to load data.
            error   : 'No More Posts!', // When the user reaches the end this is the message that is
			                            // displayed. You can change this if you want.
			delay   : 500, // When you scroll down the posts will load after a delayed amount of time.
			               // This is mainly for usability concerns. You can alter this as you see fit
			scroll  : true // The main bit, if set to false posts will not load as the user scrolls.
			               // but will still load if the user clicks.
		}
		
		// Extend the options so they work with the plugin
		if(options) {
			$.extend(settings, options);
            //alert('moreTesting');
		}
		
		// For each so that we keep chainability.
		return this.each(function() {		
			
			// Some variables 
			$this = $(this);
			$settings = settings;
			var offset = $settings.offset;
            var s = $settings.s;
			var busy = false; // Checks if the scroll action is happening 
			                  // so we don't run it multiple times
			
			// Custom messages based on settings
			if($settings.scroll == true) $initmessage = 'Scroll for more or click here';
			else $initmessage = 'Click for more';
			
			// Append custom messages and extra UI
			$this.append('<div class="content"></div>');
			
			function getData() {
				//alert('trying to get data');
				// Post data to ajax.php
                if($settings.ajaxSource == "default.php"){
                    alert('source is not defined');
                }
				$.post($settings.ajaxSource, {
						
					action        : 'gallerypagination',
				    number        : $settings.nop,
				    offset        : offset,
                    s        : s,
                    ajaxSource   : $settings.ajaxSource,
                    gallery    : $settings.gallery
					    
				}, function(data) {
						
					// Change loading bar content (it may have been altered)
					$this.find('#bar').html($initmessage);
						
					// If there is no data returned, there are no more posts to be shown. Show error
					if(data == "") { 
						$this.find('#bar').html($settings.error);
					}
					else {
						
						// Offset increases
					    offset = offset+$settings.nop; 
						    
						// Append the data to the content div
					   	//$this.find('#container').append(data);
                        var $moreBlocks = jQuery(data).filter('div.box');

                        // Append new blocks
                        jQuery('#chart').append( $moreBlocks );

                        // Have Masonry position new blocks
                        jQuery('#chart').masonry( 'appended', $moreBlocks );
                        jQuery('#chart').masonry();

						// No longer busy!	
						busy = false;
					}	
						
				});
					
			}	
			
			getData(); // Run function initially
			
			// If scrolling is enabled
			if($settings.scroll == true) {
				// .. and the user is scrolling
				$(window).scroll(function() {
					
					// Check the user is at the bottom of the element
					if($(window).scrollTop() + $(window).height() > $this.height() && !busy) {
						
						// Now we are working, so busy is true
						busy = true;
						
						// Tell the user we're loading posts
						//$this.find('.loading-bar').html('Loading Posts');
						
						// Run the function to fetch the data inside a delay
						// This is useful if you have content in a footer you
						// want the user to see.
						setTimeout(function() {
							
							getData();
						}, $settings.delay);
							
					}	
				});
			}
			
			// Also content can be loaded by clicking the loading bar/
            jQuery('#more').click(function() {
			    //alert('clicked');
				if(busy == false) {
					busy = true;
					getData();
				}
			
			});
			
		});
	}

})(jQuery);
