// Yarn tension board (scheda per prove colore filati) - parametrico
// Stampante: Creality K1 (220x220x250). Assi: X = lunghezza, Y = altezza scheda, Z = spessore.
// Cambia `part` e rendi in STL:  "roller" | "block" | "assembly"
part = "assembly";

// ---- Parametri principali (mm) ----
card_w   = 110;    // larghezza scheda bianca (tra i rulli)
card_h   = 70;     // altezza scheda = lunghezza rullo
card_t   = 1.0;    // spessore scheda (PVC/polistirolo bianco 1 mm)
roller_d = 20;     // diametro rullo
gap      = 2;      // gioco tra bordo scheda e rullo
cap_h    = 8;      // altezza "testata" rullo con foro asta
rod_d    = 3;      // asta filettata M3
hole_tol = 0.25;   // tolleranza foro per stampa FDM
spring_od = 6;     // diametro esterno molla a compressione
nut_af   = 5.5;    // M3: apertura chiave
nut_h    = 2.4;
seat_off = 7;      // distanza piano appoggio molla dall'asse rullo
nut_off  = 8;      // distanza piano dado dall'asse rullo
blk_x = 12; blk_z = 10; blk_in = 3; blk_out = 11; // blocco centrale
slot_depth = 5;    // profondità fessura (3 mm di presa + 2 mm di corsa per l'inserimento)
$fn = 72;

R   = roller_d/2;
xr  = card_w/2 + R + gap;            // centro rullo
yrod = card_h/2 + cap_h/2;           // posizione asta (centro testata)

module teardrop_x(d, len) {          // foro lungo X, "a goccia" per stampa verticale del rullo
  rotate([0,90,0]) hull() {
    cylinder(d=d, h=len, center=true);
    translate([d/2*0.9,0,0]) cube([0.01, 0.01, len], center=true);  // vertice verso l'alto (Z)
  }
}

module roller() {                    // asse lungo Z, stampa in piedi
  difference() {
    union() {
      cylinder(d=roller_d, h=card_h + 2*cap_h);
    }
    // piani appoggio molla (interno, -X) e dado (esterno, +X) sulle testate
    for (z=[0, card_h + cap_h]) translate([0,0,z]) {
      translate([-R-1, -R, -0.01]) cube([R+1-seat_off, 2*R, cap_h+0.02]);
      translate([ nut_off, -R, -0.01]) cube([R+1-nut_off, 2*R, cap_h+0.02]);
      // foro asta
      translate([0,0,cap_h/2]) teardrop_x(rod_d+hole_tol*2, roller_d+2);
      // tasca dado esagonale sul piano esterno
      translate([nut_off - nut_h, 0, cap_h/2]) rotate([0,90,0])
        cylinder(d=nut_af/cos(30)+0.3, h=nut_h+0.5, $fn=6);
    }
  }
}

module block() {                     // blocco centrale: guida asta + fessura scheda
  // stampa con asse X in verticale (foro verticale, fessura verticale)
  difference() {
    translate([-blk_x/2, -blk_in, -blk_z/2]) cube([blk_x, blk_in+blk_out, blk_z]);
    translate([0, cap_h/2, 0]) rotate([0,90,0])
      cylinder(d=rod_d+hole_tol*2, h=blk_x+2, center=true);
    translate([-blk_x/2-1, -blk_in-1, -(card_t+0.3)/2]) cube([blk_x+2, 1+slot_depth, card_t+0.3]);
  }
}

module assembly() {
  color("DimGray") for (x=[-xr,xr]) translate([x, card_h/2+cap_h, 0]) rotate([90,0,0]) roller();
  color("White") cube([card_w, card_h, card_t], center=true);
  for (s=[-1,1]) {
    color("Gold") translate([0, s*yrod, 0]) rotate([0,90,0]) cylinder(d=rod_d, h=2*xr+2*R, center=true);
    color("Silver") for (x=[-1,1]) translate([x*(xr-seat_off+blk_x/2)/2 + x*blk_x/4, s*yrod, 0])
      rotate([0,90,0]) cylinder(d=spring_od, h=xr-seat_off-blk_x/2, center=true);
    color("SteelBlue") translate([0, s*card_h/2, 0]) scale([1,s,1]) block();
  }
}

if (part=="roller") roller();
else if (part=="block") block();
else assembly();
