# 🚀 Claude Power - Docker Image
FROM node:18-alpine

LABEL maintainer="Claude Power Team <team@claude-power.dev>"
LABEL version="1.0.0"
LABEL description="🚀 Super Powers para Claude Code - Los 5 comandos más revolucionarios para desarrollo con IA"

# Instalar dependencias del sistema
RUN apk add --no-cache \
    git \
    curl \
    bash \
    jq \
    && rm -rf /var/cache/apk/*

# Crear usuario no-root para seguridad
RUN addgroup -g 1001 -S claude && \
    adduser -S claude -u 1001 -G claude

# Establecer directorio de trabajo
WORKDIR /app

# Copiar archivos de configuración primero (para mejor caching)
COPY package*.json ./
COPY LICENSE ./

# Instalar dependencias de npm
RUN npm ci --only=production && \
    npm cache clean --force

# Copiar código fuente
COPY . .

# Asegurar permisos correctos
RUN chown -R claude:claude /app && \
    chmod +x /app/index.js

# Cambiar a usuario no-root
USER claude

# Crear directorio para configuración de claude
RUN mkdir -p /home/claude/.claude

# Punto de entrada por defecto
ENTRYPOINT ["node", "/app/index.js"]

# Comando por defecto (mostrar ayuda)
CMD ["--help"]

# Exponer información sobre la imagen
EXPOSE 3000

# Health check
HEALTHCHECK --interval=30s --timeout=3s --start-period=5s --retries=3 \
  CMD node /app/index.js --version || exit 1

# Labels para metadata
LABEL org.opencontainers.image.title="Claude Power"
LABEL org.opencontainers.image.description="🚀 Super Powers para Claude Code - Los 5 comandos más revolucionarios para desarrollo con IA"
LABEL org.opencontainers.image.url="https://claude-power.dev"
LABEL org.opencontainers.image.source="https://github.com/claude-power/slash-commands"
LABEL org.opencontainers.image.vendor="Claude Power Team"
LABEL org.opencontainers.image.licenses="MIT" 