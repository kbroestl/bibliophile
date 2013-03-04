// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
// WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
// GO AFTER THE REQUIRES BELOW.
//
//= require jquery
//= require jquery_ujs
//= require jquery-ui-1.10.1.custom.min.js
//= require jquery.flot.min.js
//= require jquery.flot.pie.min.js
//= require_tree .

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

