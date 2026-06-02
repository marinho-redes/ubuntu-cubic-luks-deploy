#!/bin/bash
set -e
LOG="/var/log/fit-firstboot.log"
SCRIPTS_DIR="/opt/fit-scripts"
exec >> "$LOG" 2>&1
echo "========================================"
echo " FIT First Boot - $(date)"
echo "========================================"
echo "[INFO] Aguardando rede..."
for i in $(seq 1 30); do
    if ping -c1 -W2 8.8.8.8 >/dev/null 2>&1; then
        echo "[INFO] Rede disponível."
        break
    fi
    sleep 2
done
echo "[1/1] Instalando ferramentas dev..."
bash "$SCRIPTS_DIR/dev-tools.sh"
echo "[INFO] Desabilitando serviços de primeiro boot..."
systemctl disable fit-firstboot.service
systemctl disable fit-firstboot.timer
systemctl stop fit-firstboot.timer
touch /var/lib/fit-firstboot-done
echo "========================================"
echo " FIT First Boot concluído - $(date)"
echo "========================================"
