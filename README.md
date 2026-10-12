# ClockConOminoHTML

Orologio a colonna in Three.js: un omino disegna i minuti sul vetro. Apri `index.html` da un server web (o GitHub Pages).

## Novità grafiche
- **Texture reali**: legno ritagliato da foto di assi, prato fotografico, luna reale con la sua fase, selciato/scorza/foglie con normal map.
- **Cielo**: nuvole volumetriche procedurali che si muovono col vento, illuminate dal sole; montagne scolpite con foschia.
- **Luce e ombre**: ombre PCF a 4096 px con penombra che cambia col meteo, rimbalzo del prato, ombre di contatto, pulviscolo nei raggi, cerchi di pioggia sul selciato.
- **Movimento**: pendolo che batte i secondi veri in sincronia col tic-tac, ripresa con micro-oscillazioni da fotocamera.
- **Look fotografico**: profondità di campo, bloom, grana di pellicola, aberrazione cromatica e vignettatura.
- **Personaggio**: se manca `omino.glb` viene caricato un modello umano con texture PBR (scheletro Mixamo) da rete.

## Parametri URL
`?ora=17:30` blocca l'ora · `?stagione=autunno` · `?meteo=pioggia` · `?grana=0` niente grana · `?foto=0` solo texture procedurali · `?modello=0` omino geometrico · `?modello=foto` forza il modello fotografico · `?q=low` per dispositivi lenti
