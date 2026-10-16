# Yarn tension board – scheda a molle per prove colore filati

Accessorio stampabile in 3D (Creality K1) per avvolgere il filato e vedere l'effetto delle strisce di colore.
Due rulli stampati, scheda bianca al centro, due aste M3 con molle a compressione che tengono il filo in tensione.

## Distinta materiali (BOM)
| Qtà | Parte | Note |
|---|---|---|
| 2 | `roller.stl` | PLA/PETG nero, stampa in piedi |
| 2 | `block.stl` | blocco centrale con fessura per la scheda |
| 1 | Scheda bianca 110×70×1 mm | PVC/polistirolo/PETG bianco, tagliata a mano |
| 2 | Asta filettata M3, ~170 mm | da tagliare da barra da 1 m |
| 4 | Dado M3 (+ rondelle) | alloggiati nelle testate dei rulli |
| 4 | Molla a compressione Ø ext 6 mm, lunghezza libera ~60 mm | filo 0,6–0,8 mm |

## Stampa (K1)
- Ugello 0,4, layer 0,2 mm, 4 pareti, infill 25 % gyroid.
- Rullo: in piedi (68+16=86 mm di altezza). Fori a goccia, **niente supporti**.
- Blocco: stampa già orientato con foro e fessura verticali. 
- PETG/PLA con brim sul rullo per aderenza (base Ø20).

## Montaggio
1. Infila un'asta nella testata del rullo sinistro, poi molla, blocco, molla, rullo destro; blocca con i dadi nelle tasche esagonali.
2. Ripeti per l'asta inferiore, poi inserisci la scheda nelle fessure (la fessura è 2 mm più profonda per l'inserimento).
3. Avvolgi il filato attorno a scheda e rulli: le molle mantengono la tensione.

## Parametri
Tutto è parametrico in `yarn_board.scad` (dimensioni scheda, diametro rullo, molla, tolleranze).
Esporta con `openscad -D 'part="roller"' -o roller.stl yarn_board.scad` (idem `block`; `assembly` per l'anteprima).

## Prototipo – da verificare
Le dimensioni sono stimate dalle foto (non c'è una scala): misura il tuo originale e correggi `card_w`, `card_h`, `roller_d`.
Il modello non è ancora stato stampato: prima prova consigliata con tolleranze `hole_tol` 0,2–0,3.
