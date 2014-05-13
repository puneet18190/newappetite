// Off-canvas Animations
$('#navicon').click(function(){
	$(this).toggleClass("arrow-right");
	$('#logo').toggleClass("small");
	$('#off-canvas').toggleClass("hide");   
	$('#main').toggleClass("expand");   
});

// // Search Bar Animations
// $(document).ready(function() {
//   $('#search').click(function() {
//       $('#search-input').animate({width: 300},8, function(){
//         $(this).focus();
//       });
//   });
//   $('#search-input').click(function() {
//       $(this).animate({width: 300},8);
//   });
//   $('#search-input').focusout(function() {
//       $(this).animate({width: 0},8);
//   });
// });

// Info Button 
$('.info').click(function(){  
  $(this).parent().toggleClass("hide");
  $(this).parent().next('.info-panel').toggleClass("show");
});
$('.close').click(function(){  
  $(this).parent().prev('.hover-panel').toggleClass("hide");
  $(this).parent().toggleClass("show");
});

// Fake Login
$('#login').click(function(){
  $(this).parent().hide();
  $('#add-music').show();
  $('#profile').show();
});
$('#signup').click(function(){
  $(this).parent().hide();
  $('#add-music').show();
  $('#profile').show();
});

// Toggle Buttons
$('button').click(function(){
  $(this).toggleClass("active");
});
$('#nav li a').click(function(){
  $(this).toggleClass("active");
});
