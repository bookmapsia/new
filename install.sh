#!/bin/bash

# ------------------------------------------------------------------------------
# 0. Banner inicial com "Método MAM"
# ------------------------------------------------------------------------------
echo -e "\e[34m┌────────────────────────────────────────────────────────────────────────────┐\e[0m"
echo -e "\e[34m│\e[37m                    __                                                     \e[34m│\e[0m"
echo -e "\e[34m│\e[37m  ___     _____  __/ /_ ___________ _____  ______   _____                  \e[34m│\e[0m"
echo -e "\e[34m│\e[37m | |\ \  / /| | | _____ |___   ___||  _  ||   _ \\ |  _  |                 \e[34m│\e[0m"
echo -e "\e[34m│\e[37m | | \ \/ / | | | _____     | |    | |_| ||  |_| ||| |_| |                 \e[34m│\e[0m"
echo -e "\e[34m│\e[37m |_|  \__/  |_| |______     |_|    |_____||_____// |_____|                 \e[34m│\e[0m"
echo -e "\e[34m│                                                                            │\e[0m"
echo -e "\e[34m│\e[37m            ____    ____   ______  ____    ____                            \e[34m│\e[0m"
echo -e "\e[34m│\e[37m           | |\ \  / /| | |  __  || |\ \  / /| |                            \e[34m│\e[0m"
echo -e "\e[34m│\e[37m           | | \ \/ / | | | |__| || | \ \/ / | |                            \e[34m│\e[0m"
echo -e "\e[34m│\e[37m           |_|  \__/  |_| |_|  |_||_|  \__/  |_|                            \e[34m│\e[0m"
echo -e "\e[34m│                                                                            │\e[0m"
echo -e "\e[34m│\e[37m             Auto Instalador DOCKER/DIFY AI V1                              \e[34m│\e[0m"
echo -e "\e[34m│                                                                            │\e[0m"
echo -e "\e[34m│\e[37m               https://automilionaria.trade/                                \e[34m│\e[0m"
echo -e "\e[34m└────────────────────────────────────────────────────────────────────────────┘\e[0m"
echo

# ------------------------------------------------------------------------------
# 1. Garante que git e curl estejam instalados
# ------------------------------------------------------------------------------
if ! command -v git &>/dev/null; then
  echo "Instalando git..."
  sudo apt update && sudo apt install -y git
fi

if ! command -v curl &>/dev/null; then
  echo "Instalando curl..."
  sudo apt update && sudo apt install -y curl
fi

# ------------------------------------------------------------------------------
# 2. Recebe o domínio WEB e o domínio API do usuário e confirma se estão corretos.
# ------------------------------------------------------------------------------
while true; do
  echo "=================================================="
  read -p "Digite o domínio WEB (ex: df.automilionaria.trade): " WEB_DOMAIN
  read -p "Digite o domínio API (ex: api-df.automilionaria.trade): " API_DOMAIN
  
  echo
  echo "Você informou:"
  echo " - Domínio WEB: $WEB_DOMAIN"
  echo " - Domínio API: $API_DOMAIN"
  echo
  
  read -p "Está correto? (s/n): " CONFIRMA
  if [[ "$CONFIRMA" == "s" || "$CONFIRMA" == "S" ]]; then
    break
  fi
done

# ------------------------------------------------------------------------------
# 3. Atualiza pacotes do sistema.
# ------------------------------------------------------------------------------
echo "=================================================="
echo "Atualizando pacotes..."
sudo apt update && sudo apt upgrade -y

# ------------------------------------------------------------------------------
# 4. Instalação do Docker via script oficial.
# ------------------------------------------------------------------------------
echo "=================================================="
echo "Instalando Docker..."
curl -fsSL https://get.docker.com -o get-docker.sh
sh get-docker.sh

# ------------------------------------------------------------------------------
# 5. Verifica a versão do Docker (teste rápido de instalação).
# ------------------------------------------------------------------------------
echo "=================================================="
docker --version

# ------------------------------------------------------------------------------
# 6. Clona o repositório Dify dentro de /opt (caso não exista).
# ------------------------------------------------------------------------------
echo "=================================================="
if [ ! -d "/opt/dify" ]; then
  echo "Clonando o repositório Dify em /opt..."
  sudo mkdir -p /opt
  sudo git clone https://github.com/langgenius/dify.git /opt/dify
else
  echo "O diretório /opt/dify já existe. Pulando clonagem."
fi

# ------------------------------------------------------------------------------
# 7. Copia o .env.example para .env (substitui se já existir).
# ------------------------------------------------------------------------------
echo "=================================================="
echo "Copiando e atualizando o arquivo .env..."
cd /opt/dify/docker || exit 1

# Caso deseje manter backup do .env antigo, descomente:
# [ -f .env ] && cp .env "env-bkp-$(date +%Y%m%d-%H%M%S)"

cp .env.example .env

# ------------------------------------------------------------------------------
# 8. Ajusta as variáveis do .env usando 'sed'.
# ------------------------------------------------------------------------------
echo "=================================================="
echo "Configurando .env para os domínios informados..."
sed -i "s|^\(CONSOLE_API_URL=\).*|\1https://$API_DOMAIN|g" .env
sed -i "s|^\(CONSOLE_WEB_URL=\).*|\1https://$WEB_DOMAIN|g" .env
sed -i "s|^\(SERVICE_API_URL=\).*|\1https://$API_DOMAIN|g" .env
sed -i "s|^\(APP_API_URL=\).*|\1https://$API_DOMAIN|g" .env
sed -i "s|^\(APP_WEB_URL=\).*|\1https://$WEB_DOMAIN|g" .env

# ------------------------------------------------------------------------------
# 9. Sobe os containers do Dify.
# ------------------------------------------------------------------------------
echo "=================================================="
echo "Iniciando os containers Docker do Dify..."
docker compose up -d

# ------------------------------------------------------------------------------
# 10. Lista os containers para verificação.
# ------------------------------------------------------------------------------
echo "=================================================="
docker ps

# ------------------------------------------------------------------------------
# 11. Mensagem final com ASCII artístico.
# ------------------------------------------------------------------------------
echo -e "\e[34m┌──────────────────────────────────────────────────────────────────────────────┐\e[0m"
echo -e "\e[34m│\e[37m  _                             _              _        \e[34m                │\e[0m"
echo -e "\e[34m│\e[37m | |                _          | |            | |       \e[34m                │\e[0m"
echo -e "\e[34m│\e[37m | | ____    ___  _| |_  _____ | |  _____   __| |  ___  \e[34m                │\e[0m"
echo -e "\e[34m│\e[37m | ||  _ \  /___)(_   _)(____ || | (____ | / _  | / _ \ \e[34m                │\e[0m"
echo -e "\e[34m│\e[37m | || | | ||___ |  | |_ / ___ || | / ___ |( (_| || |_| | \e[34m               │\e[0m"
echo -e "\e[34m│\e[37m |_||_| |_|(___/    \__)\_____| \_)\_____| \____| \___/  \e[34m               │\e[0m"
echo -e "\e[34m│\e[37m                                                                            \e[34m│\e[0m"
echo -e "\e[34m│\e[37m Instalação concluída!                                                      \e[34m│\e[0m"
echo -e "\e[34m│\e[37m Você pode agora acessar o Dify em:                                          \e[34m│\e[0m"
echo -e "\e[34m│\e[37m   https://$WEB_DOMAIN                                                      \e[34m│\e[0m"
echo -e "\e[34m│\e[37m API disponível em:                                                          \e[34m│\e[0m"
echo -e "\e[34m│\e[37m   https://$API_DOMAIN                                                      \e[34m│\e[0m"
echo -e "\e[34m│\e[37m                                                                            \e[34m│\e[0m"
echo -e "\e[34m│\e[37m Método MAM:                                                                 \e[34m│\e[0m"
echo -e "\e[34m│\e[37m   https://automilionaria.trade                                              \e[34m│\e[0m"
echo -e "\e[34m└──────────────────────────────────────────────────────────────────────────────┘\e[0m"
echo
