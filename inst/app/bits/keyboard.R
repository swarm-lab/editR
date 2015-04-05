keyboard <- withTags(
  table(style = "width: 80%; margin-left: 10%;",
        
        tr(class = "border_bottom",
           td(b("Function")), td(b("Mac")), td(b("Linux & Windows"))),
        
        tr(class = "padding_top",
           td("New file"), td("cmd-n"), td("ctrl-n")),
        
        tr(td("Open file", td("cmd-o"), td("ctrl-o"))),
        
        tr(td("Save file", td("cmd-s"), td("ctrl-s"))),
        
        tr(td("Save file as", td("cmd-shift-s"), td("ctrl-shift-s"))),
        
        tr(class = "border_bottom padding_bottom",
           td("Render file"), td("cmd-r"), td("ctrl-r")),
        
        tr(class = "padding_top",
           td("Display editor only"), td("cmd-alt-e"), td("ctrl-alt-e")),
        
        tr(td("Display preview only"), td("cmd-alt-p"), td("ctrl-alt-p")),
        
        tr(class = "border_bottom padding_bottom",
           td("Toggle split screen"), td("cmd-alt-s"), td("ctrl-alt-s"))
  )
)
