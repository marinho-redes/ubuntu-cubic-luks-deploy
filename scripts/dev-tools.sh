#!/bin/bash
set -e
echo "=================================================="
echo " Instalação de Ferramentas de Desenvolvimento"
echo "=================================================="
apt-get update -y
echo "[1/9] Instalando ferramentas de terminal..."
apt-get install -y \
    curl wget htop tree jq unzip \
    net-tools nmap \
    git build-essential
echo "[2/9] Instalando Python..."
apt-get install -y \
    python3 python3-pip python3-venv python3-dev
echo "[3/9] Instalando Ruby..."
apt-get install -y ruby-full
echo "[4/9] Instalando Node.js LTS..."
curl -fsSL https://deb.nodesource.com/setup_lts.x | bash -
apt-get install -y nodejs
echo "[5/9] Instalando Java JDK 21..."
apt-get install -y openjdk-21-jdk
echo "[6/9] Instalando Docker..."
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | \
    gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
echo "deb [arch=amd64 signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] \
    https://download.docker.com/linux/ubuntu noble stable" | \
    tee /etc/apt/sources.list.d/docker.list > /dev/null
apt-get update -y
apt-get install -y docker-ce docker-ce-cli containerd.io docker-compose-plugin
systemctl enable docker
systemctl start docker
echo "[7/9] Instalando GitHub CLI..."
curl -fsSL https://cli.github.com/packages/githubcli-archive-keyring.gpg | \
    gpg --dearmor -o /usr/share/keyrings/githubcli-archive-keyring.gpg
echo "deb [arch=amd64 signed-by=/usr/share/keyrings/githubcli-archive-keyring.gpg] \
    https://cli.github.com/packages stable main" | \
    tee /etc/apt/sources.list.d/github-cli.list > /dev/null
apt-get update -y
apt-get install -y gh
echo "[8/9] Instalando VS Code..."
curl -fsSL https://packages.microsoft.com/keys/microsoft.asc | \
    gpg --dearmor -o /usr/share/keyrings/microsoft-vscode.gpg
echo "deb [arch=amd64 signed-by=/usr/share/keyrings/microsoft-vscode.gpg] \
    https://packages.microsoft.com/repos/code stable main" | \
    tee /etc/apt/sources.list.d/vscode.list > /dev/null
apt-get update -y
apt-get install -y code
echo "[9/9] Instalando Pritunl Client..."
apt-get install -y dirmngr
curl -fsSL "https://keyserver.ubuntu.com/pks/lookup?op=get&search=0x7568D9BB55FF9E5287D586017AE645C0CF8E292A" | \
    gpg --dearmor -o /usr/share/keyrings/pritunl.gpg
echo "deb [signed-by=/usr/share/keyrings/pritunl.gpg] https://repo.pritunl.com/stable/apt noble main" | \
    tee /etc/apt/sources.list.d/pritunl.list > /dev/null
apt-get update -y
apt-get install -y pritunl-client-electron
echo ""
echo "=================================================="
echo " Instalação concluída!"
echo "=================================================="
echo ""
echo "Versões instaladas:"
echo "Python:  $(python3 --version)"
echo "Ruby:    $(ruby --version)"
echo "Node:    $(node --version)"
echo "npm:     $(npm --version)"
echo "Java:    $(java -version 2>&1 | head -1)"
echo "Docker:  $(docker --version)"
echo "Git:     $(git --version)"
echo "GH CLI:  $(gh --version | head -1)"
echo "VSCode:  $(code --version | head -1)"
