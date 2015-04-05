editR
=====

**IMPORTANT: the latest version of `editR` (>=0.2) has undergone important 
modifications (see release notes below). The most important changes are the 
following:**

**- `editR` is now fully compatible with the latest version of `shiny` on 
[CRAN](http://cran.r-project.org/) (>=0.11). `editR` was modified to support 
[Twitter Bootstrap](http://getbootstrap.com/) version 3 instead of version 2 as 
in the previous releases.**

**- `editR` now relies entirely on packages available through [CRAN](http://cran.r-project.org/)
and not on experimental packages as previously. This will facilitate the 
installation process and it will make possible to submit the `editR` package to 
[CRAN](http://cran.r-project.org/) in the near future.**

**As a consequence of these modifications I strongly recommend that you reinstall 
`editR` following the new instructions below.**

[Release notes](https://github.com/swarm-lab/editR/blob/master/RELEASE_NOTES.md)

`editR` is a basic [Rmarkdown](http://rmarkdown.rstudio.com/) editor with instant 
previewing of your document. It allows you to create and edit 
[Rmarkdown](http://rmarkdown.rstudio.com/) documents while instantly previewing the 
result of your writing and coding. It also allows you to render your 
[Rmarkdown](http://rmarkdown.rstudio.com/) file in any format permitted by the 
[`rmarkdown`](https://github.com/rstudio/rmarkdown) R package.  

![Screenshot of editR window](https://raw.githubusercontent.com/swarm-lab/editR/master/editR_screenshot.jpg)

#### Installation
Installing `editR` from this GitHub repository is now pretty straightforward. 
Simply copying the following lines of code in your R terminal should to install 
everything you need to run `editR` on your computer: 

```{r}
if (!require("devtools")) install.packages("devtools")
devtools::install_github("swarm-lab/editR")

library(editR)
```

`editR` requires the installation of the latest versions of following libraries 
on [CRAN](http://cran.r-project.org/):

1. [`shiny`](http://cran.r-project.org/web/packages/shiny/index.html)
2. [`shinyFiles`](http://cran.r-project.org/web/packages/shinyFiles/index.html)
3. [`shinyAce`](http://cran.r-project.org/web/packages/shinyAce/index.html) 
4. [`shinyBS`](http://cran.r-project.org/web/packages/shinyBS/index.html)
5. [`rmarkdown`](http://cran.r-project.org/web/packages/rmarkdown/index.html)
6. [`knitr`](http://cran.r-project.org/web/packages/knitr/index.html)

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

You can also open `editR` without providing a path to a new or existing .Rmd file.

```{r}
editR()
```

In this case a temporary new file will be created that can then be saved from 
withing the user interface of `editR`. 

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
