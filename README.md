# Ubuntu 26.04 Autoinstall com LUKS

Deploy automatizado do Ubuntu com criptografia de disco usando Cubic.

## Funcionalidades

- Instalação completamente automatizada
- Criptografia LUKS
- WiFi configurado automaticamente
- Hostname por serial number
- Scripts executados no primeiro boot

## Uso

Veja [docs/INSTALLATION.md](docs/INSTALLATION.md) para instruções completas.

## Configuração Necessária

Antes de usar, edite:
- `user-data.template` → substitua TODOS os placeholders
- Scripts em `scripts/` → adicione suas credenciais corporativas

## Licença

MIT
