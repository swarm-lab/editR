Release notes
=============

---

- **0.2.0**:
    - The UI has been rewritten to be compatible with the latest version of shiny (>=0.11) and with Twitter Bootstrap 3. 
    - The UI and server now rely only on packages available on CRAN. Experimental packages are not necessary anymore, making the installation process easier and permitting submission to CRAN (coming soon).
    - The editR function does not require the path to a rmarkdown file anymore. If no path is provided, editR will create a new temporary file that can be saved later from within the UI. 
    - Added a "New file" menu to create new rmarkdown file from within the UI. 
    - Added a "Save file as" menu to save new documents or save existing documents under a different name. 
    - Added keyboard shortcuts for "New file" and "Save file as". 
    - The structure of the app source code has been modified to be more modular and easier to modify/update. 
---

- **0.1.6**:
    - Added an experimental autoscroll function. Deactivated by default until it works well with documents containing many code chunks. 
    - Updated installation instructions and code to accomodate the transition of `shiny` from Bootstrap2 to Bootstrap3. 
    - Corrected a number of bugs listed [here](https://github.com/swarm-lab/editR/compare/v0.1.5...master).
    
---

- **0.1.5**:
    - Added menu item to select editor theme. 
    - Added automatic caching of code chunks to speed up preview. 
    - Added automatic numbering of headings. 
    
---

- **0.1.4**:
    - Added 'Help' menu with 'About' submenu and 'Keyboard shorcuts' submenu. 
    
---

- **0.1.3**:
    - Added possibility to display editor or preview only. 
    
---

- **0.1.2**:
    - Added file containing release notes. 
    - When editR cannot parse the markdown file without error, it shows the 
    last working version instead but displays it with reduced opacity to indicate
    an error. 

---

- **0.1.1:** 
    - Added 'View' menu.
    - In 'View' menu, added possibility to increase/decrease font size in editor and preview

---

- **0.1:** 
    - Initial release. 
