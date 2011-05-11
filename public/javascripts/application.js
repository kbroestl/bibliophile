// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults
$(function(){
  $('#book_author_tokens').tokenInput('/authors.json', {
    crossDomain: false,
    prePopulate: $('#book_author_tokens').data('pre')
  });
  $('a.open-modal').click(
    function() {
      $('body').append('<div id="blackout"></div>');
      $('body').append('<div id="modal-receiver"></div>');
      
      $('#blackout').fadeTo('slow',0.5);
      $('#modal-receiver').fadeIn('slow');
    });
    
})