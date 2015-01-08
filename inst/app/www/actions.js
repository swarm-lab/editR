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
          
           if((e.ctrlKey || e.metaKey) && e.which == 83) {
              e.preventDefault();
              $('#save').click();
          };
          
          if((e.ctrlKey || e.metaKey) && e.altKey && e.which == 69) {
              e.preventDefault();
              $('#ed_only').click();
          };
          
          if((e.ctrlKey || e.metaKey) && e.altKey && e.which == 80) {
              e.preventDefault();
              $('#pr_only').click();
          };
          
          if((e.ctrlKey || e.metaKey) && e.altKey && e.which == 83) {
              e.preventDefault();
              $('#dual').click();
          };
      });
  });
  
});





