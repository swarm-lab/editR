$(document).ready(function() {
  
  jQuery(function($){
    $('#open').on('click', function(e){
        e.preventDefault();
        $('#my_file')[0].click();
    });
  });
  
  jQuery(function($){
    $('#save').on('click', function(e){
        e.preventDefault();
        $('#my_save')[0].click();
    });
  });
  
  jQuery(function($){
    $('#save_as').on('click', function(e){
        e.preventDefault();
        $('#my_save_as')[0].click();
    });
  });
  
});
