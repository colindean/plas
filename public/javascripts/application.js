// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults
$(function(){
  $('p.notice:not(.alert)').delay(2000).fadeOut(2000);

  setInterval("clock_tick()", 1000);

  $.each($('time'), function(){
    var e = $(this);
    var t = e.attr('datetime');
    e.attr('title', new Date(t));
  });

  $('#shoutbox ul.shouts').animate({ 
    scrollTop: $("#shoutbox ul.shouts").prop("scrollHeight")}, 0);

});

function clock_tick(){
  var e = $('#current-time');
  var d = Date.now();
  e.text(d.toString('yyyy-MM-dd HH:mm:ss'));
}
