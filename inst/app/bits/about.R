about <- withTags(
  div(style = "width: 80%; margin-left: 10%; text-align: justify;",
      
    h3("editR", 
       span("version 0.2.0", style = "font-size: 12px;")),
    
    p(HTML("Author: Simon Garnier (<a href='mailto:garnier@njit.edu'>garnier@njit.edu</a>, 
           <a href='https://twitter.com/sjmgarnier'>@sjmgarnier</a>)")),
    
    p(HTML("This program is distributed under the terms of version 3 of the 
           <a href='GNU General Public License'>GNU General Public License</a>.")),
    
    p("editR is built thanks to the following open source components and the hard work of their respective authors:"),
    
    ul(li(a("shiny", href = "http://cran.r-project.org/web/packages/shiny/index.html")),
       li(a("shinyAce", href = "https://github.com/trestletech/shinyAce")),
       li(a("shinyFiles", href = "http://cran.r-project.org/web/packages/shinyFiles/index.html")),
       li(a("shinyBS", href = "https://github.com/ebailey78/shinyBS")),
       li(a("rmarkdown", href = "http://cran.r-project.org/web/packages/rmarkdown/index.html")),
       li(a("pandoc", href = "http://johnmacfarlane.net/pandoc/")))
  )
)
