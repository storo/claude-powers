# Comando /auto-commit

Genera commits automáticos con descripciones inteligentes y análisis contextual avanzado.

## 📋 Descripción Completa

El comando `/auto-commit` revoluciona tu flujo de trabajo Git al analizar automáticamente los cambios pendientes y generar commits profesionales que siguen las mejores prácticas:

- **Análisis IA avanzado** de todos los cambios en el workspace
- **Detección automática** del tipo de commit (feat, fix, docs, etc.)
- **Generación inteligente** de alcance basado en archivos modificados
- **Validaciones pre-commit** configurables (lint, tests, build)
- **Mensajes descriptivos** que siguen convenciones estándar
- **Modo interactivo** para revisión antes del commit
- **Integración con issues** y sistemas de tracking

## 🎯 Análisis Inteligente de Cambios

### Detección Automática de Patrones

#### 🚀 Features (feat)
```bash
# Detecta cuando se añaden:
✅ Nuevos componentes React
✅ Nuevas páginas o rutas  
✅ Nuevas funciones o métodos
✅ Nuevas APIs o endpoints
✅ Nuevas dependencias principales
✅ Nuevos hooks o utilities

# Ejemplo de detección:
src/components/AuthModal.tsx    → feat(auth): add login modal
src/hooks/useLocalStorage.ts    → feat(hooks): add localStorage hook  
backend/routes/users.js         → feat(api): add user management endpoints
```

#### 🐛 Bug Fixes (fix)
```bash
# Detecta cuando se corrigen:
✅ Errores en condicionales o lógica
✅ Typos en texto o variables
✅ Problemas de imports/exports
✅ Fixes en CSS o estilos
✅ Manejo de errores mejorado
✅ Corrección de tipos TypeScript

# Ejemplo de detección:
if (user == null) → if (user === null)  → fix(auth): correct null comparison
Missing import fix                      → fix(imports): add missing React import
CSS alignment issue                     → fix(ui): correct button alignment
```

#### 📚 Documentation (docs)
```bash
# Detecta cambios en:
✅ Archivos .md, .mdx
✅ Comentarios JSDoc
✅ README files
✅ Code comments
✅ API documentation
✅ Changelogs

# Ejemplo de detección:
README.md changes                       → docs(setup): update installation guide
JSDoc comments added                    → docs(api): add function documentation
```

### Detección de Alcance Automática

```javascript
// El sistema mapea automáticamente directorios a alcances:
src/components/auth/        → alcance: "auth"
src/components/dashboard/   → alcance: "dashboard"
backend/api/users/         → alcance: "users-api"
docs/installation/         → alcance: "docs"
tests/unit/               → alcance: "tests"
styles/theme/             → alcance: "theme"
config/webpack/           → alcance: "config"
```

### Análisis de Impacto

```
🎯 ANÁLISIS DE IMPACTO AUTOMÁTICO:

📊 Severidad del Cambio:
• PATCH: Bug fixes, documentación, style
• MINOR: Nuevas features compatibles
• MAJOR: Breaking changes, API changes

🔍 Complejidad:
• BAJA: 1-3 archivos, cambios simples
• MEDIA: 4-10 archivos, lógica moderada  
• ALTA: 10+ archivos, cambios complejos

⚠️ Breaking Changes:
• API signature changes
• Required prop additions
• Config format changes
• Database schema changes
```

## 🛠️ Parámetros Avanzados

### Sintaxis Completa
```
/auto-commit [opciones]
```

### Opciones Detalladas

| Opción | Valores | Descripción | Ejemplo |
|--------|---------|-------------|---------|
| `--tipo` | `feat,fix,docs,style,refactor,test,chore,hotfix` | Forzar tipo específico | `--tipo=feat` |
| `--alcance` | `string` | Especificar alcance manualmente | `--alcance=auth` |
| `--mensaje` | `string` | Añadir descripción personalizada | `--mensaje="implementar OAuth"` |
| `--validar` | `all,lint,test,build,minimal,none` | Nivel de validación | `--validar=lint,test` |
| `--formato` | `conventional,angular,simple,custom` | Formato del mensaje | `--formato=conventional` |
| `--interactive` | `true,false` | Modo interactivo | `--interactive=true` |
| `--dry-run` | `true,false` | Solo mostrar mensaje | `--dry-run=true` |
| `--ticket` | `string` | Vincular con ticket | `--ticket=PROJ-123` |
| `--breaking` | `true,false` | Marcar como breaking change | `--breaking=true` |

### Ejemplos Prácticos

```bash
# Commit automático básico
/auto-commit

# Commit con tipo específico
/auto-commit --tipo=feat --alcance=dashboard

# Commit con validaciones completas
/auto-commit --validar=all --formato=conventional

# Commit interactivo para revisión
/auto-commit --interactive --dry-run

# Commit urgente (hotfix)
/auto-commit --tipo=hotfix --validar=minimal

# Commit con ticket vinculado
/auto-commit --ticket=PROJ-123 --tipo=feat

# Commit con breaking change
/auto-commit --breaking=true --tipo=feat --alcance=api
```

## 📊 Salida Detallada del Comando

### Análisis Pre-commit
```
🤖 CLAUDE POWER - AUTO COMMIT ANALYSIS
======================================

📂 WORKSPACE ANALYSIS:
┌─────────────────┬─────────┬─────────────┬─────────────┐
│ Tipo            │ Archivos│ Líneas      │ Complejidad │
├─────────────────┼─────────┼─────────────┼─────────────┤
│ Modificados     │    8    │ +156 -42    │ Media       │
│ Nuevos          │    3    │ +203        │ Baja        │
│ Eliminados      │    1    │ -67         │ Muy Baja    │
│ Renombrados     │    2    │ ~           │ Baja        │
└─────────────────┴─────────┴─────────────┴─────────────┘

🔍 ANÁLISIS POR DIRECTORIO:
📁 src/components/auth/ (3 archivos)
  ✨ [FEAT] LoginModal.tsx - Nuevo modal de login
  ✨ [FEAT] AuthProvider.tsx - Context provider
  🔧 [REFACTOR] AuthUtils.ts - Extraer utilities

📁 src/pages/ (2 archivos)  
  🐛 [FIX] Dashboard.tsx - Corregir error de carga
  💄 [STYLE] Profile.tsx - Actualizar estilos

📁 docs/ (1 archivo)
  📚 [DOCS] auth.md - Documentar nueva API

🎯 DETECCIÓN AUTOMÁTICA:
• Tipo detectado: feat (60% confianza)
• Alcance sugerido: auth (95% confianza)
• Impacto: Minor (nueva funcionalidad)
• Breaking changes: No detectados
• Issues relacionados: #123, #124 detectados en commits
```

### Mensaje Generado
```
💬 MENSAJE DE COMMIT GENERADO:
=====================================

feat(auth): implement comprehensive authentication system

- Add LoginModal component with form validation
- Implement AuthProvider for state management  
- Extract authentication utilities to AuthUtils
- Fix dashboard loading issue after login
- Update profile page styling
- Document new authentication API

Features include:
- Email/password authentication
- Social login integration (Google, GitHub)
- Automatic token refresh
- Session persistence
- Logout functionality

Breaking changes: None
Closes: #123, #124
Co-authored-by: AI Assistant <ai@claude-power.com>

📊 STATS: 8 files changed, 292 insertions(+), 109 deletions(-)
```

### Validaciones Pre-commit
```
🔍 VALIDACIONES PRE-COMMIT:
==========================

✅ Git Status: Working directory clean
✅ Branch Status: Up to date with origin
✅ ESLint: 0 errors, 3 warnings (auto-fixable)
✅ Prettier: All files formatted correctly
✅ TypeScript: Compilation successful
⚠️ Tests: 2 new test files needed for components
✅ Build: Production build successful (2.3s)
✅ Bundle Size: +15KB (+2.1% acceptable)
✅ Dependencies: No security vulnerabilities
✅ File Size: All files within limits

🚦 RESULTADO: ✅ READY TO COMMIT
💡 Sugerencia: Considera añadir tests para LoginModal.tsx
```

### Modo Interactivo
```
📝 REVISIÓN INTERACTIVA DE COMMIT:
=================================

Mensaje propuesto:
┌─────────────────────────────────────────────────────────┐
│ feat(auth): implement comprehensive authentication      │
│ system                                                  │
│                                                         │
│ - Add LoginModal component with form validation        │
│ - Implement AuthProvider for state management          │
│ - Extract authentication utilities to AuthUtils        │
│ - Fix dashboard loading issue after login              │
│ - Update profile page styling                          │
│ - Document new authentication API                      │
│                                                         │
│ Features include:                                       │
│ - Email/password authentication                        │
│ - Social login integration (Google, GitHub)            │
│ - Automatic token refresh                              │
│                                                         │
│ Breaking changes: None                                  │
│ Closes: #123, #124                                     │
└─────────────────────────────────────────────────────────┘

📋 OPCIONES DISPONIBLES:
[Y] ✅ Confirmar y hacer commit
[E] ✏️  Editar mensaje manualmente
[T] 🏷️  Cambiar tipo (actual: feat)
[S] 🎯 Cambiar alcance (actual: auth)
[A] ➕ Añadir detalles adicionales
[B] ⚠️  Marcar como breaking change
[I] 🔗 Vincular con ticket/issue
[V] 👁️  Ver diff completo
[D] 🔍 Ver archivos cambiados
[R] 🔄 Regenerar mensaje
[N] ❌ Cancelar

Elección [Y]: 
```

## ⚙️ Configuración Avanzada

### Configuración Completa (.claude/auto-commit-config.json)

```json
{
  "format": "conventional",
  "validation": {
    "runLint": true,
    "runTests": "auto",
    "checkBuild": false,
    "maxFileChanges": 50,
    "requireCleanWorking": true,
    "checkBranchStatus": true,
    "allowLargeFiles": false,
    "maxFileSize": "1MB"
  },
  "ai": {
    "useIntelligentDescriptions": true,
    "contextAnalysis": true,
    "suggestImprovements": true,
    "detectBreakingChanges": true,
    "analyzeRelatedIssues": true,
    "generateDetailedBody": true,
    "confidenceThreshold": 0.7
  },
  "customRules": {
    "requireTicketForFeatures": false,
    "enforceConventionalCommits": true,
    "maxSubjectLength": 100,
    "requireBody": ["feat", "fix", "refactor"],
    "allowEmptyCommits": false
  }
}
```

### Templates Personalizados

```json
{
  "templates": {
    "security": "security({alcance}): {descripcion}\n\n⚠️ Security fix\n\nDetails:\n{detalles}\n\nCVE: {cve}\nSeverity: {severity}\n\nTested: {testingDetails}",
    "performance": "perf({alcance}): {descripcion}\n\n⚡ Performance improvement\n\n{detalles}\n\nBenchmark results:\n{benchmark}\n\nImpact: {impactAnalysis}",
    "release": "release: version {version}\n\n🚀 Release {version}\n\n## What's New\n{newFeatures}\n\n## Bug Fixes\n{bugFixes}\n\n## Breaking Changes\n{breakingChanges}"
  }
}
```

## 🚀 Integración con Herramientas

### GitHub Actions
```yaml
name: Auto Commit Validation

on:
  workflow_dispatch:
    inputs:
      validate_commit:
        description: 'Validate latest commit'
        required: false
        default: 'true'

jobs:
  validate:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v3
        with:
          fetch-depth: 2
          
      - name: Setup Node.js
        uses: actions/setup-node@v3
        with:
          node-version: '18'
          
      - name: Install Claude Power
        run: npm install -g @claude-power/slash-commands
        
      - name: Validate commit message
        run: |
          COMMIT_MSG=$(git log -1 --pretty=%B)
          echo "Validating commit: $COMMIT_MSG"
          npx claude-power validate-commit --message="$COMMIT_MSG"
          
      - name: Analyze commit quality
        run: |
          npx claude-power analyze-commit \
            --commit=$(git rev-parse HEAD) \
            --output=json > commit-analysis.json
            
      - name: Upload analysis
        uses: actions/upload-artifact@v3
        with:
          name: commit-analysis
          path: commit-analysis.json
```

### Pre-commit Hook
```bash
#!/bin/sh
# .git/hooks/prepare-commit-msg

COMMIT_MSG_FILE=$1
COMMIT_SOURCE=$2
SHA1=$3

# Solo generar mensaje si no hay uno o es muy básico
if [ -z "$COMMIT_SOURCE" ] || [ "$COMMIT_SOURCE" = "message" ]; then
  echo "🤖 Generating intelligent commit message..."
  
  # Generar mensaje automático
  AUTO_MSG=$(npx claude-power auto-commit --dry-run --format=conventional 2>/dev/null)
  
  if [ $? -eq 0 ] && [ ! -z "$AUTO_MSG" ]; then
    echo "$AUTO_MSG" > "$COMMIT_MSG_FILE"
    echo "✅ Generated commit message. Edit if needed."
  else
    echo "⚠️ Could not generate automatic message. Please write manually."
  fi
fi
```

### VS Code Integration
```json
{
  "tasks": [
    {
      "label": "Auto Commit",
      "type": "shell",
      "command": "npx",
      "args": [
        "claude-power",
        "auto-commit",
        "--interactive"
      ],
      "group": "build",
      "presentation": {
        "echo": true,
        "reveal": "always",
        "focus": true,
        "panel": "shared"
      },
      "options": {
        "cwd": "${workspaceFolder}"
      }
    },
    {
      "label": "Quick Commit",
      "type": "shell", 
      "command": "npx",
      "args": [
        "claude-power",
        "auto-commit",
        "--validar=lint"
      ],
      "group": "build"
    }
  ],
  "keybindings": [
    {
      "key": "ctrl+shift+c",
      "command": "workbench.action.tasks.runTask",
      "args": "Auto Commit"
    }
  ]
}
```

## 🎯 Casos de Uso Específicos

### Commits de Feature Branch
```bash
# Commit para nueva feature
/auto-commit --tipo=feat --alcance=dashboard --ticket=PROJ-123

# Commit con breaking change
/auto-commit --breaking=true --tipo=feat --mensaje="nueva API v2"
```

### Commits de Bug Fix
```bash
# Fix rápido con validación mínima
/auto-commit --tipo=fix --validar=lint

# Fix crítico para producción
/auto-commit --tipo=hotfix --validar=all --priority=critical
```

### Commits de Documentación
```bash
# Update de docs sin validaciones
/auto-commit --tipo=docs --validar=none

# Docs con generación automática
/auto-commit --tipo=docs --auto-generate=true
```

## 📈 Métricas y Análisis

### Estadísticas de Commit
```
📊 ESTADÍSTICAS DEL PROYECTO:
============================

📈 Historial de Commits (últimos 30 días):
• feat: 45 commits (65%)
• fix: 15 commits (22%)  
• docs: 6 commits (8%)
• chore: 3 commits (4%)
• refactor: 1 commit (1%)

🎯 Calidad Promedio: 8.7/10
📏 Longitud Promedio: 65 caracteres
⏱️ Frecuencia: 3.2 commits/día
🔧 Auto-generados: 78% (alta adopción)

💡 Sugerencias de Mejora:
• Incrementar commits de tests (+15%)
• Reducir commits de chore (-50%)
• Mejorar descripción en fix commits
```

---

*Herramienta del ecosistema **Claude Power** - Automatiza tu workflow Git con IA* 🚀 