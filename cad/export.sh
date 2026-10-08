#!/usr/bin/env bash
# Uso: cad/export.sh cad/scad/minha_peca.scad  -> gera cad/out/minha_peca.stl e imprime um relatório
set -euo pipefail
src="$1"; name="$(basename "${src%.scad}")"
mkdir -p cad/out
openscad -o "cad/out/$name.stl" "$src"
python3 - "cad/out/$name.stl" <<'PY'
import sys, trimesh
m = trimesh.load(sys.argv[1])
print(f"{sys.argv[1]}: watertight={m.is_watertight} volume={m.volume:.1f} mm3 bbox={m.bounding_box.extents.round(2)} mm")
PY
