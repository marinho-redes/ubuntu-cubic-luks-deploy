# Scripts

## fit-firstboot.sh
Orquestrador executado no primeiro boot. Atualmente roda apenas `dev-tools.sh`.

Você pode adicionar seus próprios scripts corporativos editando este arquivo.

## dev-tools.sh
Instala ferramentas de desenvolvimento:
- Python, Ruby, Node.js, Java
- Docker + Docker Compose
- VS Code, GitHub CLI
- Pritunl VPN Client
- Git e utilitários de terminal

Pronto para uso sem modificação.

## Adicionar Scripts Corporativos

1. Coloque seus scripts nesta pasta
2. Edite `fit-firstboot.sh` para chamá-los
3. Exemplo:
   ```bash
   bash "$SCRIPTS_DIR/seu-script.sh"
   ```
