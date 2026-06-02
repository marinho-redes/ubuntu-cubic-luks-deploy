# Solução de Problemas

## Instalação trava na tela preta
Aguarde 30min — instalador está baixando pacotes.
Verifique conexão internet.

## WiFi não conecta
- Use cabo ethernet
- Verifique SSID/senha no user-data

## Plymouth-quit-wait bloqueia boot
Normal se scripts estão rodando.
Acesse TTY2: `Ctrl+Alt+F2`

## Freshservice falha (se usar)
O instalador usa dotnet diferente. Correção já incluída no fit-firstboot.sh.

## Logs úteis
```bash
sudo tail -f /var/log/fit-firstboot.log
sudo journalctl -u fit-firstboot.service -f
```
