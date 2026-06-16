#!/usr/bin/env bash
# better'in README gif'i için betikli demosu (assets/demo.tape ile VHS üzerinden render edilir).
# Çıktı, better'in gerçek prompt-forge davranışını yansıtır.
set -u

ACCENT=$'\033[38;2;157;124;240m'
GREEN=$'\033[38;2;126;200;140m'
RED=$'\033[38;2;226;130;130m'
DIM=$'\033[38;2;140;140;150m'
BOLD=$'\033[1;38;2;236;236;241m'
WHITE=$'\033[38;2;210;210;218m'
R=$'\033[0m'

p() { printf '%b\n' "$1"; sleep "${2:-0.16}"; }

sleep 0.3
p "${DIM}beceri çalışıyor — prompt'unuzu forge ediyor${R}" 0.5
echo
p "${ACCENT}▌${R} ${BOLD}better${R} ${DIM}·${R} ${WHITE}prompt forge${R}" 0.4
echo
p "  ${DIM}in${R}   ${RED}✗${R} ${WHITE}\"uygulamamı hızlandır\"${R}"
p "       ${DIM}harekete geçmek için fazla belirsiz — hedef, kapsam, kanıt yok${R}" 0.5
echo
p "  ${DIM}out${R}  ${GREEN}✓${R} ${BOLD}forge edilmiş prompt${R}"
p "       ${WHITE}Ana ekranın render yolunu profille. En çok yeniden${R}"
p "       ${WHITE}render'a yol açan 3 nedeni kanıtla bul ve düzelt.${R}"
p "       ${WHITE}Doğrula: soğuk başlangıç TTI < 800ms, release${R}"
p "       ${WHITE}derlemede 5× ölçülerek.${R}"
echo
sleep 0.3
p "  ${ACCENT}►${R} ${BOLD}eklendi:${R} ${WHITE}hedef · kapsam · doğrulanabilir bitiş koşulu${R}" 0.6
echo
sleep 1.2
