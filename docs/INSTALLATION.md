# Guia de Instalação

## Pré-requisitos

- Ubuntu para customizar a ISO
- Cubic instalado: `sudo apt install cubic`
- ISO Ubuntu 26.04 Desktop

## Passo 1 — Criar Projeto no Cubic

1. Abra o Cubic
2. New Project → Selecione a ISO Ubuntu 26.04
3. Escolha diretório do projeto
4. Avance até a aba de terminal (chroot)

## Passo 2 — Configurar Arquivos da ISO

Na aba **Custom Disk**:

1. Copie `user-data.template` → renomeie para `user-data`
2. Copie `meta-data`
3. Edite `boot/grub/grub.cfg` e substitua pelo conteúdo do arquivo `grub.cfg` deste repo

**IMPORTANTE:** Edite `user-data` e substitua:
- `YOUR_WIFI_SSID_X` e `YOUR_WIFI_PASSWORD_X`
- `YOUR_LUKS_PASSWORD_HERE`
- `tempuser` e hash de senha
- `COMPANY` pelo prefixo da sua empresa

## Passo 3 — Adicionar Scripts ao Chroot

Via explorador de arquivos, vá para:
```
~/cubic/projects/SeuProjeto/chroot/opt/
```

Crie pasta `fit-scripts` e copie:
- `scripts/fit-firstboot.sh`
- `scripts/dev-tools.sh`
- Seus scripts corporativos (se tiver)

No terminal do Cubic:
```bash
chmod +x /opt/fit-scripts/*.sh
```

## Passo 4 — Gerar ISO

1. Avance no Cubic até a tela final
2. Clique em **Generate**
3. Aguarde

## Passo 5 — Gravar no Pendrive

```bash
sudo dd if=sua-iso.iso of=/dev/sdX bs=4M status=progress && sync
```

## Passo 6 — Deploy

1. Boot pelo pendrive
2. Aguarde instalação (10-30min)
3. Máquina reinicia
4. Digite senha LUKS no boot
5. Faça login
6. Scripts rodam automaticamente após 2 minutos

Acompanhe: `sudo tail -f /var/log/fit-firstboot.log`
