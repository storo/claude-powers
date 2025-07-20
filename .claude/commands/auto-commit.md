# Auto Commit Command

Generates automatic commits with intelligent descriptions based on detected changes in the project.

## Description

The `/auto-commit` command analyzes pending changes in the Git repository and automatically generates:

- **Descriptive commit messages** following standard conventions
- **Impact analysis** of changes made
- **Automatic categorization** of change type (feat, fix, docs, etc.)
- **Detection of breaking changes** and important changes
- **Validation** before commit to prevent errors
- **Improvement suggestions** in the generated message

## Usage

```
/auto-commit [--type] [--scope] [--message] [--validate] [--format]
```

### Parámetros

- `--type`: Forzar un tipo específico (feat, fix, docs, style, refactor, test, chore)
- `--scope`: Especificar el alcance del cambio (componente, módulo, etc.)
- `--message`: Añadir mensaje personalizado adicional
- `--validate`: Ejecutar validaciones antes del commit (lint, tests, build)
- `--format`: Formato de commit (conventional, angular, simple)
- `--interactive`: Modo interactivo para revisar antes de commitear
- `--dry-run`: Mostrar el mensaje generado sin hacer commit

### Examples

```
/auto-commit
/auto-commit --type=feat --scope=authentication
/auto-commit --message="implementar login social" --validate=true
/auto-commit --format=conventional --interactive
/auto-commit --dry-run
/auto-commit --type=fix --validate=lint,test
```

## Análisis Automático de Cambios

### Detección de Tipo de Cambio

#### 🚀 feat (Nuevas características)
- files nuevos añadidos
- Nuevas functions o méall
- Nuevos componentes React
- Nuevas rutas o endpoints
- Nuevas dependencias principales

#### 🐛 fix (Corrección de bugs)
- Cambios en condicionales o lógica
- Corrección de typos
- Manejo de errores mejorado
- Fixes en CSS o estilos
- Corrección de imports

#### 📚 docs (Documentación)
- Cambios en files .md
- Actualizaciones en comentarios
- README modificado
- Cambios en JSDoc

#### 💄 style (Formato/estilo)
- Cambios solo de formato
- Ajustes de linting
- Espacios en blanco
- Organización de imports

#### ♻️ refactor (Refactoring)
- Reorganización de código
- Extracción de functions
- Cambios de nombres
- Optimizaciones sin cambio funcional

#### ✅ test (Tests)
- files .test.* o .spec.*
- Carpetas __tests__
- Configuración de testing

#### 🔧 chore (Tareas de mantenimiento)
- package.json modificado
- Configuración de build
- Scripts de automatización
- .gitignore actualizado

### Detección de Alcance

```javascript
// Detecta automáticamente el alcance basado en:
src/components/auth/ → alcance: "auth"
src/pages/dashboard/ → alcance: "dashboard"  
backend/api/users/ → alcance: "users-api"
styles/theme/ → alcance: "theme"
docs/setup/ → alcance: "docs"
```

### Análisis de Impacto

- **Breaking Changes**: Cambios en APIs públicas, eliminación de functions
- **Major**: Nuevas características importantes, refactors grandes
- **Minor**: Nuevas características menores, mejoras
- **Patch**: Bug fixes, documentación, style

## Configuración

El comando utiliza `.claude/auto-commit-config.json`:

```json
{
  "format": "conventional",
  "validation": {
    "runLint": true,
    "runTests": false,
    "checkBuild": false,
    "maxFileChanges": 50
  },
  "templates": {
    "feat": "{tipo}({alcance}): {descripcion}\\n\\n{detalles}\\n\\n{footer}",
    "fix": "{tipo}({alcance}): {descripcion}\\n\\n{detalles}\\n\\n{footer}",
    "docs": "{tipo}({alcance}): {descripcion}",
    "style": "{tipo}: {descripcion}",
    "refactor": "{tipo}({alcance}): {descripcion}\\n\\n{detalles}",
    "test": "{tipo}({alcance}): {descripcion}",
    "chore": "{tipo}: {descripcion}"
  },
  "scopes": {
    "autoDetect": true,
    "predefined": [
      "auth",
      "api", 
      "ui",
      "components",
      "utils",
      "config",
      "docs",
      "tests"
    ]
  },
  "rules": {
    "maxSubjectLength": 100,
    "bodyWrap": 72,
    "requireBody": ["feat", "fix", "refactor"],
    "requireBreakingChange": true,
    "requireTicketNumber": false
  },
  "ai": {
    "useIntelligentDescriptions": true,
    "contextAnalysis": true,
    "suggestImprovements": true,
    "detectBreakingChanges": true
  }
}
```

## Salida del Comando

### Análisis de Cambios
```
🤖 CLAUDE POWER - AUTO COMMIT ANALYSIS
======================================

📊 CAMBIOS DETECTADOS:
┌─────────────────┬─────────┬─────────────┐
│ Tipo            │ files│ Líneas      │
├─────────────────┼─────────┼─────────────┤
│ Modificados     │    8    │ +156 -42    │
│ Nuevos          │    3    │ +203        │
│ Eliminados      │    1    │ -67         │
│ Renombrados     │    2    │ ~           │
└─────────────────┴─────────┴─────────────┘

🔍 ANÁLISIS INTELIGENTE:
📁 src/components/auth/
  ✨ [FEAT] LoginForm.tsx - Nuevo componente de login
  ✨ [FEAT] AuthContext.tsx - Context para autenticación
  
📁 src/pages/
  🐛 [FIX] dashboard.tsx - Corregir error de navegación
  
📁 docs/
  📚 [DOCS] README.md - Actualizar guía de instalación

🎯 TIPO DETECTADO: feat
🏷️ ALCANCE SUGERIDO: auth
⚡ IMPACTO: Minor (nueva funcionalidad)
```

### Mensaje Generado
```
💬 MENSAJE DE COMMIT GENERADO:
=====================================

feat(auth): implementar sistema de autenticación con login social

- Agregar componente LoginForm con validación
- Implementar AuthContext para gestión de estado
- Corregir navegación en dashboard tras login
- Actualizar documentación de setup

Permite a los usuarios autenticarse usando:
- Email/password tradicional  
- Login con Google OAuth
- Login con GitHub OAuth

Breaking changes: Ninguno
Closes: #123, #124
```

### Validaciones Pre-commit
```
🔍 VALIDACIONES PRE-COMMIT:
==========================

✅ ESLint: 0 errores, 2 warnings
✅ Prettier: Formato correcto
✅ TypeScript: Compilación exitosa
⚠️ Tests: 2 tests pendientes para nuevos componentes
✅ Build: Generación exitosa
✅ Tamaño files: Dentro de límites

🚦 RESULTADO: ✅ LISTO PARA COMMIT
```

### Opciones Interactivas
```
📝 ¿PROCEDER CON EL COMMIT?

Mensaje propuesto:
> feat(auth): implementar sistema de autenticación con login social

Opciones:
[Y] Sí, hacer commit
[E] Editar mensaje
[A] Agregar detalles
[C] Cambiar tipo/alcance  
[V] Ver diff completo
[N] Cancelar

Elección: 
```

## Integraciones Avanzadas

### Webhooks y Notificaciones
```json
{
  "integrations": {
    "slack": {
      "enabled": true,
      "webhook": "https://hooks.slack.com/...",
      "channel": "#dev-commits"
    },
    "jira": {
      "enabled": true,
      "autoLink": true,
      "transitionTickets": false
    },
    "github": {
      "autoLabel": true,
      "linkIssues": true,
      "assignReviewers": true
    }
  }
}
```

### Templates Personalizados
```json
{
  "customTemplates": {
    "hotfix": "hotfix: {descripcion}\\n\\nUrgent fix for: {issue}\\n\\nTested: {testDetails}",
    "release": "release: version {version}\\n\\n{changelogSummary}\\n\\nBreaking Changes:\\n{breakingChanges}",
    "security": "security: {descripcion}\\n\\n⚠️ Security fix\\n\\nCVE: {cve}\\nSeverity: {severity}"
  }
}
```

## Casos de Uso Especiales

### Commits de Merge/Release
```bash
# Auto-generar mensaje para merge
/auto-commit --type=merge --message="feat/user-dashboard into main"

# Commit de release con changelog automático
/auto-commit --type=release --message="v2.1.0" --changelog=true

# Hotfix urgente
/auto-commit --type=hotfix --validate=minimal --priority=high
```

### Múltiples Contextos
```bash
# Commit para feature específica
/auto-commit --scope=dashboard --context=feature/user-dashboard

# Commit cross-platform
/auto-commit --platform=web,mobile --sync=true

# Commit con dependencias
/auto-commit --dependencies=updated --security-check=true
```

### Análisis Contextual IA

```
🧠 ANÁLISIS CONTEXTUAL IA:
=========================

📈 PATRONES DETECTADOS:
• Este commit continúa el tralow en autenticación iniciado hace 3 commits
• Se detecta patrón de desarrollo por componentes
• Código sigue convenciones establecidas del proyecto

💡 SUGERENCIAS:
• Considerar agregar tests para LoginForm.tsx
• El cambio en AuthContext puede afectar otros componentes
• Documentar los nuevos OAuth providers en wiki

🎯 CALIDAD DEL COMMIT:
• Mensaje: 9/10 (claro y descriptivo)
• Alcance: 10/10 (bien definido)
• Impacto: 8/10 (cambio importante bien documentado)
```

## Automatización y CI/CD

### GitHub Actions
```yaml
name: Auto Commit Quality Check

on:
  push:
    branches: [feature/*, develop]

jobs:
  commit-quality:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v3
      
      - name: Validate commit message
        run: |
          COMMIT_MSG=$(git log -1 --pretty=%B)
          npx claude-power validate-commit "$COMMIT_MSG"
          
      - name: Analyze commit quality
        run: |
          npx claude-power analyze-commit --output=json > commit-analysis.json
          
      - name: Comment on PR if quality issues
        if: github.event_name == 'pull_request'
        uses: actions/github-script@v6
        with:
          script: |
            const fs = require('fs');
            const analysis = JSON.parse(fs.readFileSync('commit-analysis.json'));
            if (analysis.score < 8) {
              github.rest.issues.createComment({
                issue_number: context.issue.number,
                owner: context.repo.owner,
                repo: context.repo.repo,
                body: `## 📝 Commit Quality Analysis\n\nScore: ${analysis.score}/10\n\n${analysis.suggestions.join('\n')}`
              });
            }
```

### Pre-commit Hook Integration
```bash
#!/bin/sh
# .git/hooks/prepare-commit-msg

# Si no hay mensaje o es muy básico, generar uno automático
if [ -z "$2" ] || [ "$2" = "message" ]; then
  echo "🤖 Generando mensaje de commit inteligente..."
  AUTO_MSG=$(npx claude-power auto-commit --dry-run --format=conventional)
  echo "$AUTO_MSG" > "$1"
  echo "✅ Mensaje generado. Edita si es necesario."
fi
```

---

*Parte del ecosistema **Claude Power** - Automatiza tu workflow con IA* 🚀 
