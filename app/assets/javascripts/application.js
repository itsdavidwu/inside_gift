// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require jquery.turbolinks
//= require turbolinks
//= require jquery
//= require bootstrap-sprockets
//= require fancybox
//= require_tree .

$(document).ready(function() {


  if (window.frameElement) {
    $(".navbar").hide();
    $(".footer").hide();
    $(".alert").hide();
    document.getElementById("boom").style.marginLeft = "0px";
    document.getElementById("boom").style.marginRight = "0px";
    document.getElementById("boom").style.paddingLeft = "0px";
    document.getElementById("boom").style.paddingRight = "0px";
    document.getElementById("fluider").style.paddingRight = "0px";
    document.getElementById("fluider").style.paddingLeft = "0px";
    document.getElementById("boom2").style.paddingLeft = "0px";
    document.getElementById("boom2").style.paddingRight = "0px";
  }
  else {

  }


  $("a.fancy1").fancybox(
  {
	'width': '90%',
	'type':'iframe',
	'scrolling': 'no',
  'padding': 0,
	'iframe': {'scrolling': 'no'},
	 'aspectRatio' : true,
    'margin' : [0, 30, 0, 25] ,
    'transitionIn'      : 'elastic',
    'transitionOut'     : 'elastic',
    'keys': { 'close'  : [27] }
  });


  $("a.fancy2").fancybox(
  {
  'width': '90%',
  'type':'iframe',
  'scrolling': 'no',
  'padding': 0,
  'iframe': {'scrolling': 'no'},
   'aspectRatio' : true,
    'margin' : [0, 30, 0, 25] ,
    'transitionIn'      : 'elastic',
    'transitionOut'     : 'elastic',
    'keys': { 'close'  : [27] }
  });

  $("a.fancy2").click(function(e) {
    e.preventDefault();
    var link = $(this).attr("href");
    window.self.location = link;
  });



  var visiteddd = localStorage.getItem('visiteddd');
  if (!visiteddd) {
    $('.headline').collapse('show');
    localStorage.setItem('visiteddd', true);
  }



});
