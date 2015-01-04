$(document).ready(function() {
  
  jQuery(function($){
      $('#open').on('click', function(e){
          e.preventDefault();
          $('#my_open')[0].click();
      });
  });
  
  jQuery(function($){
      $(document).keydown(function(e) {
          if((e.ctrlKey || e.metaKey) && e.which == 79) {
              e.preventDefault();
              $('#my_open')[0].click();
          };
      });
  });
  
  jQuery(function($){
      $(document).keydown(function(e) {
          if((e.ctrlKey || e.metaKey) && e.which == 83) {
              e.preventDefault();
              $('#save').click();
          };
      });
  });
  
  jQuery(function($){
      $(document).keydown(function(e) {
          if((e.ctrlKey || e.metaKey) && e.which == 82) {
              e.preventDefault();
              $('#render').click();
          };
      });
  });
  
});





