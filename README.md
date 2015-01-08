editR
=====

[Release notes](https://github.com/swarm-lab/editR/blob/master/RELEASE_NOTES.md)

`editR` is a basic [Rmarkdown](http://rmarkdown.rstudio.com/) editor with instant 
previewing of your document. It allows you to create and edit 
[Rmarkdown](http://rmarkdown.rstudio.com/) documents while instantly previewing the 
result of your writing and coding. It also allows you to render your 
[Rmarkdown](http://rmarkdown.rstudio.com/) file in any format permitted by the 
[`rmarkdown`](https://github.com/rstudio/rmarkdown) R package.  

![Screenshot of editR window](https://raw.githubusercontent.com/swarm-lab/editR/master/editR_screenshot.png)

#### Installation
`editR` requires the installation of the latest versions of following libraries 
on [CRAN](http://cran.r-project.org/):

1. [`shiny`](http://cran.r-project.org/web/packages/shiny/index.html)
2. [`shinyFiles`](http://cran.r-project.org/web/packages/shinyFiles/index.html)
3. [`rmarkdown`](http://cran.r-project.org/web/packages/rmarkdown/index.html)

It also requires the installation of the development versions of 
[`shinyAce`](https://github.com/trestletech/shinyAce) and 
[`shinyBS`](https://github.com/ebailey78/shinyBS) 
both hosted on [GitHub](https://www.github.com).

The following lines of code should install everything you need to run `editR` on
your computer: 

```{r}
install.packages(c("shiny", "shinyFiles", "rmarkdown"))

if (!require("devtools")) install.packages("devtools")
devtools::install_github("trestletech/shinyAce")
devtools::install_github("ebailey78/shinyBS")
devtools::install_github("swarm-lab/editR")

library(editR)
```

Finally, to render documents in various output formats (.html, .pdf, .docx), 
`editR` uses the [`render`](http://www.rdocumentation.org/packages/rmarkdown/functions/render) 
function from the [`rmarkdown`](http://cran.r-project.org/web/packages/rmarkdown/index.html) 
package. This function requires the installation of [`pandoc`](http://johnmacfarlane.net/pandoc/) 
to work. Installation instructions for `pandoc` can be found at: 
[http://johnmacfarlane.net/pandoc/installing.html](http://johnmacfarlane.net/pandoc/installing.html). 
For Mac users, I recommend that you install `pandoc` via [Homebrew](http://brew.sh/) or 
[MacPorts](https://www.macports.org/). 

#### Usage
To start `editR`, simply run this line of code in your R console:

```{r}
editR("path/to/file.Rmd")
```

with "path/to/file.Rmd" the path to a new or existing .Rmd (or .md) file. If this 
is a new file, it will be created at this location. You can also open an existing
file from within `editR` using the `File > Open file` menu. 

At the moment, it is not possible to create new files from within `editR`. It 
will come when/if [`shinyFiles`](https://github.com/thomasp85/shinyFiles) is updated.

For more information about authoring Rmarkdown files, visit 
[http://rmarkdown.rstudio.com/](http://rmarkdown.rstudio.com/). 

#### Author(s)
Simon Garnier - [@sjmgarnier](https://twitter.com/sjmgarnier) - 
<garnier@njit.edu>

#### References
`editR` was built with [`shiny`](http://shiny.rstudio.com/) by [@rstudio](https://github.com/rstudio),
and its extensions 
[`shinyBS`](https://github.com/ebailey78/shinyBS) by [@ebailey78](https://github.com/ebailey78), 
[`shinyFiles`](https://github.com/thomasp85/shinyFiles) by [@thomaso85](https://github.com/thomasp85) and 
[`shinyAce`](https://github.com/trestletech/shinyAce) by [@trestletech](https://github.com/trestletech)
