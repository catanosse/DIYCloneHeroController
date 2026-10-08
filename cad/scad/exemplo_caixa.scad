// Exemplo: caixa 40x30x15 mm com furo central de 3 mm (igual aos furos de alinhamento do projeto)
$fn = 64;
difference() {
    cube([40, 30, 15]);
    translate([20, 15, -1]) cylinder(d = 3, h = 17);
}
