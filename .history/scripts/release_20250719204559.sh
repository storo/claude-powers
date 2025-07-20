#!/bin/bash

# 🚀 Claude Power - Script de Release Automático
# Uso: ./scripts/release.sh [patch|minor|major]

set -e

# Colores para output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
PURPLE='\033[0;35m'
CYAN='\033[0;36m'
NC='\033[0m' # No Color

# Banner de release
print_banner() {
    echo -e "${PURPLE}"
    cat << "EOF"
  ██████╗██╗      █████╗ ██╗   ██╗██████╗ ███████╗    ██████╗ ███████╗██╗     ███████╗ █████╗ ███████╗███████╗
 ██╔════╝██║     ██╔══██╗██║   ██║██╔══██╗██╔════╝    ██╔══██╗██╔════╝██║     ██╔════╝██╔══██╗██╔════╝██╔════╝
 ██║     ██║     ███████║██║   ██║██║  ██║█████╗      ██████╔╝█████╗  ██║     █████╗  ███████║███████╗█████╗  
 ██║     ██║     ██╔══██║██║   ██║██║  ██║██╔══╝      ██╔══██╗██╔══╝  ██║     ██╔══╝  ██╔══██║╚════██║██╔══╝  
 ╚██████╗███████╗██║  ██║╚██████╔╝██████╔╝███████╗    ██║  ██║███████╗███████╗███████╗██║  ██║███████║███████╗
  ╚═════╝╚══════╝╚═╝  ╚═╝ ╚═════╝ ╚═════╝ ╚══════╝    ╚═╝  ╚═╝╚══════╝╚══════╝╚══════╝╚═╝  ╚═╝╚══════╝╚══════╝
EOF
    echo -e "${NC}"
    echo -e "${CYAN}🚀 Automatización completa de release y distribución${NC}"
    echo ""
}

# Función para logging
log() {
    echo -e "${GREEN}[Release]${NC} $1"
}

warn() {
    echo -e "${YELLOW}[WARNING]${NC} $1"
}

error() {
    echo -e "${RED}[ERROR]${NC} $1"
    exit 1
}

# Verificar dependencias
check_dependencies() {
    log "Verificando dependencias..."
    
    # Node.js y npm
    if ! command -v node &> /dev/null; then
        error "Node.js no está instalado"
    fi
    
    if ! command -v npm &> /dev/null; then
        error "npm no está instalado"
    fi
    
    # Git
    if ! command -v git &> /dev/null; then
        error "Git no está instalado"
    fi
    
    # Docker (opcional)
    if ! command -v docker &> /dev/null; then
        warn "Docker no está instalado (opcional para distribución)"
    fi
    
    log "✅ Todas las dependencias verificadas"
}

# Verificar que estamos en el directorio correcto
check_project_directory() {
    if [ ! -f "package.json" ]; then
        error "No se encontró package.json. Ejecuta desde el directorio raíz del proyecto."
    fi
    
    if [ ! -f ".claude/commands/generate-tests.md" ]; then
        error "No se encontraron los comandos de Claude Power. ¿Estás en el directorio correcto?"
    fi
    
    log "✅ Directorio del proyecto verificado"
}

# Verificar que todo está commiteado
check_git_status() {
    log "Verificando estado de git..."
    
    if [ -n "$(git status --porcelain)" ]; then
        error "Hay cambios sin commitear. Commitea todos los cambios antes del release."
    fi
    
    # Verificar que estamos en main/master
    CURRENT_BRANCH=$(git branch --show-current)
    if [ "$CURRENT_BRANCH" != "main" ] && [ "$CURRENT_BRANCH" != "master" ]; then
        warn "No estás en main/master branch. Branch actual: $CURRENT_BRANCH"
        read -p "¿Continuar anyway? (y/N): " confirm
        if [ "$confirm" != "y" ] && [ "$confirm" != "Y" ]; then
            exit 1
        fi
    fi
    
    log "✅ Estado de git verificado"
}

# Ejecutar tests
run_tests() {
    log "Ejecutando tests..."
    
    # Si hay tests definidos
    if npm run test 2>/dev/null; then
        log "✅ Tests pasaron exitosamente"
    else
        warn "No hay tests definidos o fallaron"
        read -p "¿Continuar sin tests? (y/N): " confirm
        if [ "$confirm" != "y" ] && [ "$confirm" != "Y" ]; then
            exit 1
        fi
    fi
}

# Incrementar versión
bump_version() {
    local version_type=$1
    
    log "Incrementando versión ($version_type)..."
    
    CURRENT_VERSION=$(node -p "require('./package.json').version")
    log "Versión actual: $CURRENT_VERSION"
    
    # Usar npm version para incrementar
    NEW_VERSION=$(npm version $version_type --no-git-tag-version)
    log "Nueva versión: $NEW_VERSION"
    
    # Commitear el cambio de versión
    git add package.json
    git commit -m "chore: bump version to $NEW_VERSION"
    
    log "✅ Versión incrementada y commiteada"
    echo "$NEW_VERSION"
}

# Build del proyecto
build_project() {
    log "Building proyecto..."
    
    if npm run build 2>/dev/null; then
        log "✅ Build completado"
    else
        log "No hay script de build definido (opcional)"
    fi
}

# Crear tag de git
create_git_tag() {
    local version=$1
    
    log "Creando git tag $version..."
    
    git tag -a "$version" -m "Release $version"
    
    log "✅ Git tag creado: $version"
}

# Publicar en npm
publish_npm() {
    log "Publicando en npm..."
    
    # Verificar login de npm
    if ! npm whoami &> /dev/null; then
        error "No estás logueado en npm. Ejecuta 'npm login' primero."
    fi
    
    # Verificar que el package name está disponible
    PACKAGE_NAME=$(node -p "require('./package.json').name")
    log "Publicando package: $PACKAGE_NAME"
    
    # Publish
    if npm publish; then
        log "✅ Publicado en npm exitosamente"
        echo -e "📦 npm: ${BLUE}https://www.npmjs.com/package/${PACKAGE_NAME}${NC}"
    else
        error "Falló la publicación en npm"
    fi
}

# Push a git
push_to_git() {
    local version=$1
    
    log "Pushing a git repository..."
    
    # Push commits y tags
    git push origin HEAD
    git push origin "$version"
    
    log "✅ Push completado"
    
    # URL del release en GitHub
    REPO_URL=$(git config --get remote.origin.url | sed 's/\.git$//')
    if [[ $REPO_URL == *"github.com"* ]]; then
        REPO_URL=$(echo $REPO_URL | sed 's/git@github.com:/https:\/\/github.com\//')
        echo -e "🐙 GitHub: ${BLUE}${REPO_URL}/releases${NC}"
    fi
}

# Build Docker image (opcional)
build_docker() {
    if ! command -v docker &> /dev/null; then
        log "Docker no disponible, saltando build de imagen"
        return
    fi
    
    log "Building Docker image..."
    
    local version=$1
    
    # Build imagen
    if docker build -t claude-power/slash-commands:latest -t claude-power/slash-commands:$version .; then
        log "✅ Docker image built exitosamente"
        echo -e "🐳 Docker: ${BLUE}claude-power/slash-commands:$version${NC}"
        
        # Preguntar si quiere pushear a Docker Hub
        read -p "¿Pushear a Docker Hub? (y/N): " push_docker
        if [ "$push_docker" = "y" ] || [ "$push_docker" = "Y" ]; then
            if docker push claude-power/slash-commands:latest && docker push claude-power/slash-commands:$version; then
                log "✅ Docker images pushed a Docker Hub"
                echo -e "🐳 Docker Hub: ${BLUE}https://hub.docker.com/r/claude-power/slash-commands${NC}"
            else
                warn "Falló el push a Docker Hub"
            fi
        fi
    else
        warn "Falló el build de Docker image"
    fi
}

# Mostrar resumen final
show_summary() {
    local version=$1
    local package_name=$2
    
    echo ""
    echo -e "${GREEN}🎉 ¡RELEASE COMPLETADO EXITOSAMENTE!${NC}"
    echo ""
    echo -e "${CYAN}📦 Nueva versión: ${YELLOW}$version${NC}"
    echo ""
    echo -e "${PURPLE}🌍 Canales de distribución activos:${NC}"
    echo -e "  📦 npm install -g $package_name"
    echo -e "  🔽 curl -fsSL [...]/install.sh | bash"
    echo -e "  🐳 docker run claude-power/slash-commands:$version"
    echo ""
    echo -e "${BLUE}🔗 Links importantes:${NC}"
    echo -e "  📦 NPM: https://www.npmjs.com/package/$package_name"
    echo -e "  🐙 GitHub: https://github.com/claude-power/slash-commands"
    echo -e "  🐳 Docker: https://hub.docker.com/r/claude-power/slash-commands"
    echo ""
    echo -e "${YELLOW}📈 Próximos pasos para promoción:${NC}"
    echo -e "  🐦 Tweet sobre el release"
    echo -e "  📰 Post en dev.to/Medium"
    echo -e "  💼 Compartir en LinkedIn"
    echo -e "  🎯 Enviar a Product Hunt"
    echo ""
    echo -e "${GREEN}🚀 Claude Power está listo para conquistar el mundo!${NC}"
}

# Función principal
main() {
    local version_type=${1:-patch}
    
    # Validar argumento
    if [[ ! "$version_type" =~ ^(patch|minor|major)$ ]]; then
        error "Tipo de versión inválido. Usa: patch, minor, o major"
    fi
    
    print_banner
    
    echo -e "${CYAN}🎯 Iniciando release ($version_type)...${NC}"
    echo ""
    
    # Verificaciones previas
    check_dependencies
    check_project_directory
    check_git_status
    
    # Tests
    run_tests
    
    # Confirmación final
    echo ""
    echo -e "${YELLOW}⚠️  CONFIRMACIÓN FINAL:${NC}"
    echo -e "  Tipo de release: ${BLUE}$version_type${NC}"
    echo -e "  Se va a publicar en npm y crear release en GitHub"
    echo ""
    read -p "¿Continuar con el release? (y/N): " final_confirm
    if [ "$final_confirm" != "y" ] && [ "$final_confirm" != "Y" ]; then
        echo "Release cancelado."
        exit 0
    fi
    
    echo ""
    log "🚀 ¡Iniciando proceso de release!"
    
    # Proceso de release
    build_project
    NEW_VERSION=$(bump_version $version_type)
    create_git_tag $NEW_VERSION
    push_to_git $NEW_VERSION
    publish_npm
    build_docker $NEW_VERSION
    
    # Resumen final
    PACKAGE_NAME=$(node -p "require('./package.json').name")
    show_summary $NEW_VERSION $PACKAGE_NAME
}

# Verificar si se está ejecutando directamente
if [[ "${BASH_SOURCE[0]}" == "${0}" ]]; then
    main "$@"
fi 