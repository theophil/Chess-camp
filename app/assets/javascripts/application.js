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
//= require jquery_nested_form
//= require foundation
//= require_tree .
//= require jquery.ui.all

$(function(){ $(document).foundation(); });

// $(function() {
//   $('.datepicker').datepicker();
// });

// Datepicker code
$(function() {
  $(".datepicker").datepicker({
    format: 'mm/dd/YYYY'
  });
});

// Flash fade
// $(function() {
//    $('.alert-box').fadeIn('normal', function() {
//       $(this).delay(3700).fadeOut();
//    });
// });

// // Sticky footer js
// // Thanks to Charles Smith for this -- http://foundation.zurb.com/forum/posts/629-sticky-footer
// $(window).bind("load", function () {
//   var footer = $("#footer");
//   var pos = footer.position();
//   var height = $(window).height();
//   height = height - pos.top;
//   height = height - footer.height();
//   if (height > 0) {
//       footer.css({
//           'margin-top': height + 'px'
//       });
//   }
// });

