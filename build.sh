#!/usr/bin/env bash
set -Eeuo pipefail

# Resolve all source/output paths relative to this script, from any directory.
script_dir="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)"
cd -- "$script_dir"
mkdir -p build output/pdf

trap 'printf "CV build failed. Review the compiler output and build/*.log.\n" >&2' ERR

if [[ -n "${TECTONIC+x}" ]]; then
  tectonic_bin="$TECTONIC"
  if ! command -v "$tectonic_bin" >/dev/null 2>&1; then
    printf 'TECTONIC does not name an executable compiler: %s\n' "$tectonic_bin" >&2
    exit 1
  fi
  compiler=tectonic
elif command -v latexmk >/dev/null 2>&1 && command -v xelatex >/dev/null 2>&1; then
  compiler=latexmk-xelatex
elif command -v xelatex >/dev/null 2>&1; then
  compiler=xelatex
elif command -v latexmk >/dev/null 2>&1 && command -v pdflatex >/dev/null 2>&1; then
  compiler=latexmk-pdflatex
elif command -v pdflatex >/dev/null 2>&1; then
  compiler=pdflatex
elif command -v tectonic >/dev/null 2>&1; then
  tectonic_bin=tectonic
  compiler=tectonic
elif [[ -x "$script_dir/.tools/tectonic" ]]; then
  tectonic_bin="$script_dir/.tools/tectonic"
  export XDG_CACHE_HOME="$script_dir/.tools/cache"
  compiler=tectonic
else
  printf '%s\n' \
    'No supported LaTeX compiler found.' \
    'Install a TeX distribution with xelatex or pdflatex (latexmk is optional), or Tectonic.' \
    'For a portable Tectonic binary, set TECTONIC=/absolute/path/to/tectonic.' >&2
  exit 1
fi

printf 'Building all four CV variants with %s.\n' "$compiler"
for source in cv-software-engineering.tex cv-computer-vision.tex cv-se4ai.tex cv-ai4se.tex; do
  case "$compiler" in
    latexmk-xelatex)
      latexmk -xelatex -no-shell-escape -interaction=nonstopmode -halt-on-error \
        -file-line-error -outdir=build "$source"
      ;;
    latexmk-pdflatex)
      latexmk -pdf -no-shell-escape -interaction=nonstopmode -halt-on-error -file-line-error \
        -outdir=build "$source"
      ;;
    xelatex|pdflatex)
      # A second pass resolves page/link information without requiring latexmk.
      for pass in 1 2; do
        "$compiler" -no-shell-escape -interaction=nonstopmode -halt-on-error \
          -file-line-error -output-directory=build "$source"
      done
      ;;
    tectonic)
      "$tectonic_bin" --keep-logs --outdir build "$source"
      ;;
  esac
done

# Update deliverables only after all four variants compile successfully.
cp -- build/cv-software-engineering.pdf \
  output/pdf/Saad_Kabir_Uddin_PhD_CV_Software_Engineering.pdf
cp -- build/cv-computer-vision.pdf \
  output/pdf/Saad_Kabir_Uddin_PhD_CV_Computer_Vision.pdf
cp -- build/cv-se4ai.pdf \
  output/pdf/Saad_Kabir_Uddin_PhD_CV_SE4AI.pdf
cp -- build/cv-ai4se.pdf \
  output/pdf/Saad_Kabir_Uddin_PhD_CV_AI4SE.pdf
printf 'PDFs written to %s/output/pdf/\n' "$script_dir"
