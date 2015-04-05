navbar <- bs3_navbar("editR", 
                     navs = list(
                       bs3_dropdown(name = "File",
                                    navs = list(
                                      actionLink("new", "New file"),
                                      actionLink("open", "Open file"),
                                      tags$hr(class = "sep"),
                                      actionLink("save", "Save file"),
                                      actionLink("saveas", "Save file as"),
                                      tags$hr(class = "sep"),
                                      actionLink("render", "Render file"))
                       ), 
                       
                       bs3_dropdown(name = "View",
                                    navs = list(
                                      actionLink("ed_only", "Editor only"), 
                                      actionLink("pr_only", "Preview only"),
                                      actionLink("dual", "Dual view"),
                                      tags$hr(class = "sep"),
                                      actionLink("ef_plus", "Editor font size +"), 
                                      actionLink("ef_minus", "Editor font size -"),
                                      actionLink("e_theme", "Editor theme"),
                                      tags$hr(class = "sep"),
                                      actionLink("pf_plus", "Preview font size +"),
                                      actionLink("pf_minus", "Preview font size -"),
                                      tags$hr(class = "sep"),
                                      actionLink("auto_scroll", "Toggle auto-scroll")
                                    )
                       ),
                       
                       bs3_dropdown(name = "Help",
                                    navs = list(
                                      actionLink("keys", "Keyboard shortcuts"), 
                                      tags$hr(class = "sep"),
                                      actionLink("about", "About editR")
                                    )
                       )
                       
                     )
)
