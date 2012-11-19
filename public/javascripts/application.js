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


  $.ajax({
    url: '/lchart.json',
    dataType: 'json'
    // data: data,
  }).done(function (stats) {
      var set = [];
      //var series = Math.floor(Math.random()*10)+1;
      for (i in stats){
        console.log( stats[i].language.percent );
        set[i] = {label: stats[i].language.Language + ": " + Math.ceil(stats[i].language.percent) + "%", 
                  data: parseInt(stats[i].language.percent) }
      }

      $.plot($("#lchart"), set,
      {
        series:{
          pie:{
            show:true
          }
        }
      });
      
    });
});
