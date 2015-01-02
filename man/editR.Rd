\name{editR}
\alias{editR}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
Starts the editR Rmarkdown editor. 
}
\description{
This function start the editR \code{\link[<rmarkdown>:<rmarkdown>-package]{Rmarkdown}} editor. If called from RStudio, it will open in the internal RStudio internet browser. If called from a terminal, it will open in your default internet browser.
}
\usage{
editR(file)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{file}{
The path (as a character string) to an existing .Rmd/.md file, or to a new .Rmd/.md file. 
}
}
\details{
%%  ~~ If necessary, more details than the description above ~~
}
\value{
%%  ~Describe the value returned
%%  If it is a LIST, use
%%  \item{comp1 }{Description of 'comp1'}
%%  \item{comp2 }{Description of 'comp2'}
%% ...
}
\references{
%% ~put references to the literature/web site here ~
}
\author{
Simon Garnier <garnier@njit.edu> - \href{http://twitter.com/sjmgarnier}{@sjmgarnier}
}
\note{
editR should work without any problem with the internal RStudio internet browser, as well as with recent versions of most internet browsers. It is likely to break with older versions. 
}

%% ~Make other sections like Warning with \section{Warning }{....} ~

\seealso{
\code{\link[<rmarkdown>:<rmarkdown>-package]{rmarkdown}}, \code{\link[<shiny>:<shiny>-package]{shiny}},
\code{\link[<shinyBS>:<shinyBS>-package]{shinyBS}}, \code{\link[<shinyAce>:<shinyAce>-package]{shinyAce}},
\code{\link[<shinyFiles>:<shinyFiles>-package]{shinyFiles}}
}
\examples{
# This creates a new .Rmd file on the desktop
editR("~/Desktop/my_file.Rmd")
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ ~kwd1 }
\keyword{ ~kwd2 }% __ONLY ONE__ keyword per line
