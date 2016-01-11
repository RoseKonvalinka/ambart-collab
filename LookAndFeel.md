# Introduzione #

Componenti che definiscono il 'Look & Feel'


# Dettagli #

  * WebTemplate (non credo voi ne abbiate sviluppati di custom)
  * Master Pages
  * Page Layouts (non credo ne abbiate sviluppato) NB abbiamo modificato il layout delle pagine wiki che sta sul file system per inserire la wp "contenuti correlati". File: wkpstd.aspx , in: Web Server Extensions > 14 > TEMPLATE > Document Templates.
_non è una buona pratica. Sarebbe meglio svilupparne una custom ed creare uno stapler che la associ di default ai siti di tipo wiki (template WIKI#0)_
  * Stylesheets:
    * CSS
      * Themable
      * non Themable
    * XLS
  * Javascript (jQuery, per esempio) NB (per bloccare lo scroll del ribbon) abbiamo modificato il file jscript INIT.js in: Web Server Extensions > 14 > Layouts > 1040 (mi pare sia il solo modo x farlo...)
_sicuramente non è il solo modo di farlo. Javascript permette di overridare le funzioni già definite e quindi di farle comportar ein altro modo. Vedremo di sistemare anche questo, net tempo_
  * Pezzi html (snippets ?)
  * Immagini