editor <- aceEditor("rmd", mode = "markdown", wordWrap = TRUE, 
                    fontSize = getOption("editR")$editor_font_size,
                    theme = getOption("editR")$editor_theme, 
                    debounce = 100, autoComplete = "live", height = "auto")
