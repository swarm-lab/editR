editor <- aceEditor("rmd", mode = "markdown", wordWrap = TRUE, fontSize = .Options$editR$editor_font_size,
                    theme = .Options$editR$editor_theme, debounce = 100, autoComplete = "live", height = "auto")
