#!/bin/bash

# 🚀 Claude Power - Instalador Automático
# Uso: curl -fsSL https://raw.githubusercontent.com/claude-power/slash-commands/main/install.sh | bash

set -e

# Colores para output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
PURPLE='\033[0;35m'
CYAN='\033[0;36m'
NC='\033[0m' # No Color

# Función para logging
log() {
    echo -e "${GREEN}[Claude Power]${NC} $1"
}

warn() {
    echo -e "${YELLOW}[WARNING]${NC} $1"
}

error() {
    echo -e "${RED}[ERROR]${NC} $1"
    exit 1
}

# Banner de bienvenida
print_banner() {
    echo -e "${PURPLE}"
    cat << "EOF"
  ██████╗██╗      █████╗ ██╗   ██╗██████╗ ███████╗    ██████╗  ██████╗ ██╗    ██╗███████╗██████╗ 
 ██╔════╝██║     ██╔══██╗██║   ██║██╔══██╗██╔════╝    ██╔══██╗██╔═══██╗██║    ██║██╔════╝██╔══██╗
 ██║     ██║     ███████║██║   ██║██║  ██║█████╗      ██████╔╝██║   ██║██║ █╗ ██║█████╗  ██████╔╝
 ██║     ██║     ██╔══██║██║   ██║██║  ██║██╔══╝      ██╔═══╝ ██║   ██║██║███╗██║██╔══╝  ██╔══██╗
 ╚██████╗███████╗██║  ██║╚██████╔╝██████╔╝███████╗    ██║     ╚██████╔╝╚███╔███╔╝███████╗██║  ██║
  ╚═════╝╚══════╝╚═╝  ╚═╝ ╚═════╝ ╚═════╝ ╚══════╝    ╚═╝      ╚═════╝  ╚══╝╚══╝ ╚══════╝╚═╝  ╚═╝
EOF
    echo -e "${NC}"
    echo -e "${CYAN}🚀 Los Super Poderes de IA más avanzados para desarrollo${NC}"
    echo -e "${BLUE}✨ 5 comandos que van a revolucionar tu workflow${NC}"
    echo ""
}

# Detectar sistema operativo
detect_os() {
    if [[ "$OSTYPE" == "linux-gnu"* ]]; then
        OS="linux"
    elif [[ "$OSTYPE" == "darwin"* ]]; then
        OS="macos"
    elif [[ "$OSTYPE" == "msys" ]] || [[ "$OSTYPE" == "cygwin" ]]; then
        OS="windows"
    else
        error "Sistema operativo no soportado: $OSTYPE"
    fi
    log "Sistema detectado: $OS"
}

# Verificar si Node.js está instalado
check_nodejs() {
    if ! command -v node &> /dev/null; then
        warn "Node.js no está instalado"
        log "Instalando Node.js..."
        
        case $OS in
            "linux")
                if command -v apt-get &> /dev/null; then
                    sudo apt-get update && sudo apt-get install -y nodejs npm
                elif command -v yum &> /dev/null; then
                    sudo yum install -y nodejs npm
                elif command -v pacman &> /dev/null; then
                    sudo pacman -S nodejs npm
                else
                    error "No se pudo instalar Node.js automáticamente. Instálalo manualmente desde https://nodejs.org"
                fi
                ;;
            "macos")
                if command -v brew &> /dev/null; then
                    brew install node
                else
                    error "Homebrew no está instalado. Instala Node.js desde https://nodejs.org"
                fi
                ;;
            "windows")
                error "En Windows, instala Node.js desde https://nodejs.org"
                ;;
        esac
    else
        log "Node.js ya está instalado: $(node --version)"
    fi
}

# Instalar Claude Power
install_claude_power() {
    log "Instalando Claude Power..."
    
    # Método 1: Intentar npm global
    if npm install -g @claude-power/slash-commands 2>/dev/null; then
        log "✅ Instalado via npm global"
        return 0
    fi
    
    # Método 2: Instalación local si npm global falla
    warn "Instalación global falló, instalando localmente..."
    
    INSTALL_DIR="$HOME/.claude-power"
    mkdir -p "$INSTALL_DIR"
    cd "$INSTALL_DIR"
    
    # Descargar desde GitHub
    log "Descargando desde GitHub..."
    if command -v git &> /dev/null; then
        git clone https://github.com/claude-power/slash-commands.git .
    else
        # Fallback a curl/wget
        if command -v curl &> /dev/null; then
            curl -fsSL https://github.com/claude-power/slash-commands/archive/main.tar.gz | tar -xz --strip-components=1
        elif command -v wget &> /dev/null; then
            wget -qO- https://github.com/claude-power/slash-commands/archive/main.tar.gz | tar -xz --strip-components=1
        else
            error "No se encontró git, curl o wget para descargar"
        fi
    fi
    
    # Instalar dependencias
    npm install
    
    # Crear symlink o alias
    case $OS in
        "linux"|"macos")
            # Crear symlink en PATH
            sudo ln -sf "$INSTALL_DIR/index.js" /usr/local/bin/claude-power
            chmod +x /usr/local/bin/claude-power
            ;;
        "windows")
            # En Windows crear un batch file
            echo "@echo off" > "$HOME/claude-power.bat"
            echo "node \"$INSTALL_DIR/index.js\" %*" >> "$HOME/claude-power.bat"
            ;;
    esac
    
    log "✅ Instalación local completada"
}

# Verificar instalación
verify_installation() {
    log "Verificando instalación..."
    
    if command -v claude-power &> /dev/null; then
        log "✅ Claude Power instalado correctamente"
        claude-power --version
    else
        warn "Claude Power instalado pero no se encuentra en PATH"
        log "Puedes ejecutarlo con: node $HOME/.claude-power/index.js"
    fi
}

# Configurar Claude Code
setup_claude_code() {
    log "Configurando comandos en Claude Code..."
    
    if command -v claude-power &> /dev/null; then
        claude-power install-commands
    else
        node "$HOME/.claude-power/index.js" install-commands
    fi
    
    log "✅ Comandos instalados en Claude Code"
}

# Mostrar mensaje de éxito
show_success() {
    echo ""
    echo -e "${GREEN}🎉 ¡INSTALACIÓN COMPLETADA EXITOSAMENTE!${NC}"
    echo ""
    echo -e "${CYAN}🚀 Super Poderes disponibles:${NC}"
    echo -e "  ${PURPLE}🧪 /generate-tests${NC}   - Tests automáticos con 90%+ cobertura"
    echo -e "  ${PURPLE}🐛 /fix-bugs${NC}         - Auto-reparación de bugs (90% reducción)"
    echo -e "  ${PURPLE}⚡ /performance-turbo${NC} - Optimización automática (60%+ mejora)"
    echo -e "  ${PURPLE}🛡️ /security-fortress${NC} - Fortaleza de seguridad impenetrable"
    echo -e "  ${PURPLE}🧠 /explain-code${NC}     - Profesor personal de código"
    echo ""
    echo -e "${YELLOW}📋 Próximos pasos:${NC}"
    echo -e "  1. Abre Claude Code"
    echo -e "  2. Escribe cualquiera de los comandos arriba"
    echo -e "  3. ¡Disfruta de tus super poderes! 🚀"
    echo ""
    echo -e "${BLUE}📖 Documentación: https://claude-power.dev${NC}"
    echo -e "${BLUE}🐙 GitHub: https://github.com/claude-power/slash-commands${NC}"
    echo ""
}

# Función principal
main() {
    print_banner
    detect_os
    check_nodejs
    install_claude_power
    verify_installation
    setup_claude_code
    show_success
}

# Ejecutar instalación
main "$@" 