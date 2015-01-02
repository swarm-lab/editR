editR
=====

`editR` is a basic [Rmarkdown](http://rmarkdown.rstudio.com/) editor with instant 
previewing of your document. It allows you to create and edit 
[Rmarkdown](http://rmarkdown.rstudio.com/) documents while instantly previewing the 
result of your writing and coding. It also allows you to render your 
[Rmarkdown](http://rmarkdown.rstudio.com/) file in any format permitted by the 
[rmarkdown R package](https://github.com/rstudio/rmarkdown).  

#### Installation
`editR` requires the installation of the latest versions of following libraries 
on [CRAN](http://cran.r-project.org/):

1. [shiny](http://cran.r-project.org/web/packages/shiny/index.html)
2. [shinyBS](http://cran.r-project.org/web/packages/shinyBS/index.html)
3. [shinyFiles](http://cran.r-project.org/web/packages/shinyFiles/index.html)
4. [rmarkdown](http://cran.r-project.org/web/packages/rmarkdown/index.html)

It also requires the installation of the development version of 
[shinyAce](https://github.com/trestletech/shinyAce) hosted on
[GitHub](https://www.github.com).

The following lines of code should install everything you need to run `editR` on
your computer. 

```
install.packages(c("shiny", "shinyBS", "shinyFiles", "rmarkdown"))

if (!require("devtools")) install.packages("devtools")
devtools::install_github("trestletech/shinyAce")
devtools::install_github("swarm-lab/editR")
```

#### Author(s)
Simon Garnier - [@sjmgarnier](https://twitter.com/sjmgarnier) - 
<garnier@njit.edu>

#### References
`editR` was built with [Shiny](http://shiny.rstudio.com/) by [@rstudio](https://github.com/rstudio),
and its extensions 
[ShinyBS](https://github.com/ebailey78/shinyBS) by [@ebailey78](https://github.com/ebailey78), 
[ShinyFiles](https://github.com/thomasp85/shinyFiles) by [thomaso85](https://github.com/thomasp85) and 
[ShinyAce](https://github.com/trestletech/shinyAce) by [@trestletech](https://github.com/trestletech)
