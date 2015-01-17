$(document).ready(function() {
  
  window.autoscroll = 0;
  window.frontmatter = 0;
  
  jQuery(function($){
      $('#open').on('click', function(e) {
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
  
  
  
  jQuery(function($){
      $('#auto_scroll').on('click', function() {
        if (window.autoscroll == 0) {
          window.autoscroll = 1;
          editor__rmd.selection.moveCursorBy(0, 1);
          editor__rmd.selection.moveCursorBy(0, -1);
        } else {
          window.autoscroll = 0;
        }
      });
  });
  
  jQuery(function($){
      editor__rmd.selection.on('changeCursor', function(e) {
        
        if (window.autoscroll == 1) {  
          
          if (editor__rmd.session.getLine(0) == '---') {
            var frontmatter = [];
            for (var i = 0, l = editor__rmd.session.getLength(); i < l; i++) {
              if (editor__rmd.session.getLine(i) == '---')
                frontmatter.push(i);
            }            
          }
          
          frontmatter_length = 0;
          if (frontmatter.length > 1) {
            frontmatter_length = frontmatter[1] + 2;
          }
          
          var ace_percent = (editor__rmd.selection.getCursor().row - frontmatter_length) / (editor__rmd.session.getLength() - (frontmatter_length + 1));      
          var knit_div_height = $('#knit_doc').get(0).scrollHeight;
          
          $('#knit_doc').animate({
            scrollTop: ace_percent * knit_div_height - 180
          }, 100);
          
        }
        
    });
  });
  
});





