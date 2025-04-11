#!/bin/bash

# ------------------------------------------------------------------------------
# 0. Banner inicial com "MAM"
# ------------------------------------------------------------------------------

WHITE="\e[97m"
GREEN="\e[32m"
YELLOW="\e[33m"
BLUE="\e[34m"
RESET="\e[0m"

echo -e "${WHITE}                     __       __ ______ __    __ __    __  ______                       ${RESET}"
echo -e "${WHITE}                    |  \     /  \      \  \  |  \  \  |  \/      \                      ${RESET}"
echo -e "${WHITE}                    | ▓▓\   /  ▓▓\▓▓▓▓▓▓ ▓▓\ | ▓▓ ▓▓  | ▓▓  ▓▓▓▓▓▓\                     ${RESET}"
echo -e "${WHITE}                    | ▓▓▓\ /  ▓▓▓ | ▓▓ | ▓▓▓\| ▓▓ ▓▓__| ▓▓ ▓▓__| ▓▓                     ${RESET}"
echo -e "${WHITE}                    | ▓▓▓▓\  ▓▓▓▓ | ▓▓ | ▓▓▓▓\ ▓▓ ▓▓    ▓▓ ▓▓    ▓▓                     ${RESET}"
echo -e "${WHITE}                    | ▓▓\▓▓ ▓▓ ▓▓ | ▓▓ | ▓▓\▓▓ ▓▓ ▓▓▓▓▓▓▓▓ ▓▓▓▓▓▓▓▓                     ${RESET}"
echo -e "${WHITE}                    | ▓▓ \▓▓▓| ▓▓_| ▓▓_| ▓▓ \▓▓▓▓ ▓▓  | ▓▓ ▓▓  | ▓▓                     ${RESET}"
echo -e "${WHITE}                    | ▓▓  \▓ | ▓▓   ▓▓ \ ▓▓  \▓▓▓ ▓▓  | ▓▓ ▓▓  | ▓▓                     ${RESET}"
echo -e "${WHITE}                     \▓▓      \▓▓\▓▓▓▓▓▓\▓▓   \▓▓\▓▓   \▓▓\▓▓   \▓▓    __               ${RESET}"
echo -e "${WHITE}    ______  __    __ ________  ______  __       __  ______   ______   ______   ______   ${RESET}"
echo -e "${WHITE}  /      \|  \  |  \        \/      \|  \     /  \/      \ /      \ /      \ /      \   ${RESET}"
echo -e "${WHITE} |  ▓▓▓▓▓▓\ ▓▓  | ▓▓\▓▓▓▓▓▓▓▓  ▓▓▓▓▓▓\ ▓▓\   /  ▓▓  ▓▓▓▓▓▓\  ▓▓▓▓▓▓\  ▓▓▓▓▓▓\  ▓▓▓▓▓▓\  ${RESET}"
echo -e "${WHITE} | ▓▓__| ▓▓ ▓▓  | ▓▓  | ▓▓  | ▓▓  | ▓▓ ▓▓▓\ /  ▓▓▓ ▓▓__| ▓▓ ▓▓   \▓▓ ▓▓__| ▓▓ ▓▓  | ▓▓  ${RESET}"
echo -e "${WHITE} | ▓▓    ▓▓ ▓▓  | ▓▓  | ▓▓  | ▓▓  | ▓▓ ▓▓▓▓\  ▓▓▓▓ ▓▓    ▓▓ ▓▓     | ▓▓    ▓▓ ▓▓  | ▓▓  ${RESET}"
echo -e "${WHITE} | ▓▓▓▓▓▓▓▓ ▓▓  | ▓▓  | ▓▓  | ▓▓  | ▓▓ ▓▓\▓▓ ▓▓ ▓▓ ▓▓▓▓▓▓▓▓ ▓▓   __| ▓▓▓▓▓▓▓▓ ▓▓  | ▓▓  ${RESET}"
echo -e "${WHITE} | ▓▓  | ▓▓ ▓▓__/ ▓▓  | ▓▓  | ▓▓__/ ▓▓ ▓▓ \▓▓▓| ▓▓ ▓▓  | ▓▓ ▓▓__/  \ ▓▓  | ▓▓ ▓▓__/ ▓▓  ${RESET}"
echo -e "${WHITE} | ▓▓  | ▓▓\▓▓    ▓▓  | ▓▓   \▓▓    ▓▓ ▓▓  \▓ | ▓▓ ▓▓  | ▓▓\▓▓    ▓▓ ▓▓  | ▓▓\▓▓    ▓▓  ${RESET}"
echo -e "${WHITE}  \▓▓   \▓▓ \▓▓▓▓▓▓    \▓▓    \▓▓▓▓▓▓ \▓▓      \▓▓\▓▓   \▓▓ \▓▓▓▓▓▓ \▓▓   \▓▓ \▓▓▓▓▓▓   ${RESET}"
echo -e "${WHITE}        __       __ __ __ __                                  // ______  ______         ${RESET}"
echo -e "${WHITE}       |  \     /  \  \  \  \                                   |      \/      \        ${RESET}"
echo -e "${WHITE}       | ▓▓\   /  ▓▓\▓▓ ▓▓\▓▓ ______  _______   __/ /_   ______  \▓▓▓▓▓▓  ▓▓▓▓▓▓\       ${RESET}"
echo -e "${WHITE}       | ▓▓▓\ /  ▓▓▓  \ ▓▓  \/      \|       \ |      \ /      \  | ▓▓ | ▓▓__| ▓▓       ${RESET}"
echo -e "${WHITE}       | ▓▓▓▓\  ▓▓▓▓ ▓▓ ▓▓ ▓▓  ▓▓▓▓▓▓\ ▓▓▓▓▓▓▓\ \▓▓▓▓▓▓\  ▓▓▓▓▓▓\ | ▓▓ | ▓▓    ▓▓       ${RESET}"
echo -e "${WHITE}       | ▓▓\▓▓ ▓▓ ▓▓ ▓▓ ▓▓ ▓▓ ▓▓  | ▓▓ ▓▓  | ▓▓/      ▓▓ ▓▓   \▓▓ | ▓▓ | ▓▓▓▓▓▓▓▓       ${RESET}"
echo -e "${WHITE}       | ▓▓ \▓▓▓| ▓▓ ▓▓ ▓▓ ▓▓ ▓▓__/ ▓▓ ▓▓  | ▓▓  ▓▓▓▓▓▓▓ ▓▓      _| ▓▓_| ▓▓  | ▓▓       ${RESET}"
echo -e "${WHITE}       | ▓▓  \▓ | ▓▓ ▓▓ ▓▓ ▓▓\▓▓    ▓▓ ▓▓  | ▓▓\▓▓    ▓▓ ▓▓     |   ▓▓ \ ▓▓  | ▓▓       ${RESET}"
echo -e "${WHITE}        \▓▓      \▓▓\▓▓\▓▓\▓▓ \▓▓▓▓▓▓ \▓▓   \▓▓ \▓▓▓▓▓▓▓\▓▓      \▓▓▓▓▓▓\▓▓   \▓▓       ${RESET}"
echo -e "${WHITE}                                                                                        ${RESET}"
echo -e "${GREEN}                                  .----------------------.                              ${RESET}"
echo -e "${GREEN}                                  | INICIANDO INSTALAÇÃO |                              ${RESET}"
echo -e "${GREEN}                                  '----------------------'                              ${RESET}"
echo -e "${YELLOW}                             Auto Instalador DOCKER/DifyAI V1                          ${RESET}"
echo -e "${YELLOW}                               https://automilionaria.trade                            ${RESET}"
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
  sudo git clone https://github.com/bookmapsia/4chat4.git /opt/dify
else
  echo "O diretório /opt/dify já existe. Pulando clonagem."
fi

# ------------------------------------------------------------------------------
# 7. Copia o .env.example para .env (substitui se já existir).
# ------------------------------------------------------------------------------
echo "=================================================="
echo "Copiando e atualizando o arquivo .env..."
cd /opt/dify/docker || exit 1

cp .env.example .env

# ------------------------------------------------------------------------------
# 8. Ajusta as variáveis do .env usando 'sed'.
# ------------------------------------------------------------------------------
echo "=================================================="
echo "Configurando .env para os domínios informados..."
sed -i "s|^CONSOLE_API_URL=.*|CONSOLE_API_URL=https://$API_DOMAIN|g" .env
sed -i "s|^CONSOLE_WEB_URL=.*|CONSOLE_WEB_URL=https://$WEB_DOMAIN|g" .env
sed -i "s|^SERVICE_API_URL=.*|SERVICE_API_URL=https://$API_DOMAIN|g" .env
sed -i "s|^APP_API_URL=.*|APP_API_URL=https://$API_DOMAIN|g" .env
sed -i "s|^APP_WEB_URL=.*|APP_WEB_URL=https://$WEB_DOMAIN|g" .env

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
# Mensagem final
# ------------------------------------------------------------------------------
echo -e "${GREEN}                                 .----------------------.                               ${RESET}"
echo -e "${GREEN}                                 | INSTALAÇÃO CONCLUÍDA |                               ${RESET}"
echo -e "${GREEN}                                 |      COM SUCESSO     |                               ${RESET}"
echo -e "${GREEN}                                 '----------------------'                               ${RESET}"
echo -e "${GREEN}                                         DifyAI V1                                      ${RESET}"
echo -e "${GREEN}                               https://automilionaria.trade                             ${RESET}"

  echo
echo "========================================"
echo -e "       ${GREEN}ACESSE ATRAVÉS DOS LINKS ABAIXO${RESET}"
echo -e "       ${INFO} - API do sistema disponível em: \e[33mhttps://$API_DOMAIN\e[0m"
echo -e "       ${INFO} - Para ir para sua dashboard: \e[33mhttps://$WEB_DOMAIN\e[0m"
echo "========================================"
echo

