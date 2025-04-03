#!/bin/bash

# ------------------------------------------------------------------------------
# 0. Banner inicial com "Minha Automação Milionária"
# ------------------------------------------------------------------------------
echo -e "\e[32m                    __                                     \e[0m"
echo -e "\e[32m  ___     _____  __/ /_ ___________ _____  ______   _____  \e[0m"
echo -e "\e[32m | |\ \  / /| | | _____ |___   ___||  _  ||   _ \\ |  _  | \e[0m"
echo -e "\e[32m | | \ \/ / | | | _____     | |    | |_| ||  |_| ||| |_| | \e[0m"
echo -e "\e[32m |_|  \__/  |_| |______     |_|    |_____||_____// |_____| \e[0m"
echo -e "\e[32m                                                           \e[0m"
echo -e "\e[32m            ____    ____   ______  ____    ____            \e[0m"
echo -e "\e[32m           | |\ \  / /| | |  __  || |\ \  / /| |           \e[0m"
echo -e "\e[32m           | | \ \/ / | | | |__| || | \ \/ / | |           \e[0m"
echo -e "\e[32m           |_|  \__/  |_| |_|  |_||_|  \__/  |_|           \e[0m"
echo -e "\e[32m                                                           \e[0m"
echo -e "\e[32m             Auto Instalador DOCKER/DIFY AI V1             \e[0m"
echo -e "\e[32m                                                           \e[0m"
echo -e "\e[32m               https://automilionaria.trade/               \e[0m"
echo

# ------------------------------------------------------------------------------
# 1. Recebe o domínio WEB e o domínio API do usuário e confirma se estão corretos.
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
# 2. Atualiza pacotes do sistema.
# ------------------------------------------------------------------------------
echo "=================================================="
echo "Atualizando pacotes..."
sudo apt update && sudo apt upgrade -y

# ------------------------------------------------------------------------------
# 3. Instalação do Docker via script oficial.
# ------------------------------------------------------------------------------
echo "=================================================="
echo "Instalando Docker..."
curl -fsSL https://get.docker.com -o get-docker.sh
sh get-docker.sh

# ------------------------------------------------------------------------------
# 4. Verifica a versão do Docker (teste rápido de instalação).
# ------------------------------------------------------------------------------
echo "=================================================="
docker --version

# ------------------------------------------------------------------------------
# 5. Clona o repositório Dify dentro de /opt (caso não exista).
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
# 6. Copia o .env.example para .env (substitui se já existir).
# ------------------------------------------------------------------------------
echo "=================================================="
echo "Copiando e atualizando o arquivo .env..."
cd /opt/dify/docker

# Caso deseje manter backup do .env antigo, descomente:
# [ -f .env ] && cp .env "env-bkp-$(date +%Y%m%d-%H%M%S)"

cp .env.example .env

# ------------------------------------------------------------------------------
# 7. Ajusta as variáveis do .env usando 'sed'.
# ------------------------------------------------------------------------------
echo "=================================================="
echo "Configurando .env para os domínios informados..."
sed -i "s|^\(CONSOLE_API_URL=\).*|\1https://$API_DOMAIN|g" .env
sed -i "s|^\(CONSOLE_WEB_URL=\).*|\1https://$WEB_DOMAIN|g" .env
sed -i "s|^\(SERVICE_API_URL=\).*|\1https://$API_DOMAIN|g" .env
sed -i "s|^\(APP_API_URL=\).*|\1https://$API_DOMAIN|g" .env
sed -i "s|^\(APP_WEB_URL=\).*|\1https://$WEB_DOMAIN|g" .env

# ------------------------------------------------------------------------------
# 8. Sobe os containers do Dify.
# ------------------------------------------------------------------------------
echo "=================================================="
echo "Iniciando os containers Docker do Dify..."
docker compose up -d

# ------------------------------------------------------------------------------
# 9. Lista os containers para verificação.
# ------------------------------------------------------------------------------
echo "=================================================="
docker ps

# ------------------------------------------------------------------------------
# 10. Mensagem final com ASCII artístico.
# ------------------------------------------------------------------------------
echo -e "\e[32m _                             _              _        \e[0m"
echo -e "\e[32m| |                _          | |            | |       \e[0m"
echo -e "\e[32m| | ____    ___  _| |_  _____ | |  _____   __| |  ___  \e[0m"
echo -e "\e[32m| ||  _ \  /___)(_   _)(____ || | (____ | / _  | / _ \ \e[0m"
echo -e "\e[32m| || | | ||___ |  | |_ / ___ || | / ___ |( (_| || |_| |\e[0m"
echo -e "\e[32m|_||_| |_|(___/    \__)\_____| \_)\_____| \____| \___/ \e[0m"
echo -e "\e[32m                                                       \e[0m"
echo "Instalação concluída!"
echo "Agora você pode acessar o Dify em: https://$WEB_DOMAIN"
echo "API está em: https://$API_DOMAIN"
echo -e "\e[32m                                                       \e[0m"
echo -e "\e[32mMétodo MAM: https://automilionaria.trade               \e[0m"
