# Create PR Command

Crea pull requests automáticos con descripciones inteligentes, templates y análisis de cambios.

## Descripción

El comando `/create-pr` automatiza completamente la creación de pull requests:

- **Análisis automático** de commits y cambios
- **Generación de descripciones** detalladas e inteligentes
- **Detección de tipo de PR** (feature, bugfix, hotfix, etc.)
- **Templates personalizados** según el tipo de cambio
- **Revisores sugeridos** basados en los archivos modificados
- **Labels automáticos** según el contenido
- **Checklist de validación** pre-configurado
- **Integración con issues** y tickets

## Usage

```
/create-pr [--titulo] [--type] [--base] [--target] [--template] [--reviewers]
```

### Parámetros

- `--titulo`: Título personalizado del PR (auto-generado si se omite)
- `--type`: Tipo de PR (feature, bugfix, hotfix, docs, chore)
- `--base`: Branch base (main, develop, master)
- `--target`: Branch destino (current branch por defecto)
- `--template`: Template específico a usar
- `--reviewers`: Lista de revisores (auto-sugeridos si se omite)
- `--labels`: Labels a añadir (auto-detectados si se omite)
- `--draft`: Crear como draft PR
- `--auto-merge`: Habilitar auto-merge tras aprobaciones

### Examples

```
/create-pr
/create-pr --titulo="Implementar dashboard de usuario" --type=feature
/create-pr --base=develop --reviewers=@john,@mary --labels=enhancement
/create-pr --template=hotfix --auto-merge=true
/create-pr --draft --type=feature
/create-pr --type=docs --target=gh-pages
```

## Análisis Automático de PR

### Detección de Tipo de PR

#### 🚀 Feature PR
- Nuevas funcionalidades
- Componentes nuevos
- APIs nuevas
- Características significativas

#### 🐛 Bugfix PR
- Corrección de errores
- Fixes de comportamiento
- Patches de seguridad
- Corrección de regresiones

#### 🔥 Hotfix PR
- Fixes críticos para producción
- Parches de seguridad urgentes
- Correcciones de bugs críticos

#### 📚 Documentation PR
- Updates de README
- Documentación de APIs
- Guías y tutoriales
- Comentarios de código

#### 🔧 Chore PR
- Actualizaciones de dependencias
- Configuración de build
- Refactoring interno
- Tareas de mantenimiento

### Generación de Título Inteligente

```javascript
// Ejemplos de títulos auto-generados:
"feat(auth): implement OAuth2 authentication system"
"fix(dashboard): resolve data loading performance issue"  
"docs(api): add comprehensive endpoint documentation"
"chore(deps): update React to v18.2.0"
"hotfix(security): patch XSS vulnerability in user input"
```

## Templates de PR

### Template Feature PR
```markdown
## 🚀 Feature: {feature_name}

### 📋 Descripción
{auto_generated_description}

### ✨ Cambios Principales
{major_changes_list}

### 🧪 Testing
- [ ] Unit tests añadidos/actualizados
- [ ] Integration tests verificados
- [ ] E2E tests completados
- [ ] Manual testing realizado

### 📸 Screenshots/GIFs
{auto_attach_visual_changes}

### 🔗 Issues Relacionados
Closes #{issue_numbers}

### 🚨 Breaking Changes
{breaking_changes_analysis}

### 📝 Checklist
- [ ] Código revisado por el autor
- [ ] Documentación actualizada
- [ ] Tests pasando
- [ ] No merge conflicts
- [ ] Performance verificado
```

### Template Bugfix PR
```markdown
## 🐛 Bugfix: {bug_description}

### 🎯 Problema
{problem_description}

### 🔧 Solución
{solution_description}

### 🧪 Verificación
- [ ] Bug reproducido
- [ ] Fix verificado localmente
- [ ] Regression tests añadidos
- [ ] No side effects detectados

### 📋 Testing Instructions
{testing_steps}

### 🔗 Issue Relacionado
Fixes #{issue_number}
```

### Template Hotfix PR
```markdown
## 🔥 HOTFIX: {critical_issue}

### ⚠️ URGENTE
{urgency_description}

### 🎯 Root Cause
{root_cause_analysis}

### 🔧 Quick Fix
{fix_description}

### ✅ Verification
- [ ] Issue confirmed in production
- [ ] Fix tested in staging
- [ ] No breaking changes
- [ ] Rollback plan ready

### 🚀 Deployment
- [ ] Ready for immediate deployment
- [ ] Stakeholders notified
- [ ] Monitoring alerts configured
```

## Configuración

`.claude/create-pr-config.json`:

```json
{
  "github": {
    "defaultBase": "main",
    "autoAssignReviewers": true,
    "autoAddLabels": true,
    "enableAutoMerge": false,
    "requireApprovals": 2
  },
  "templates": {
    "feature": "feature-pr-template.md",
    "bugfix": "bugfix-pr-template.md", 
    "hotfix": "hotfix-pr-template.md",
    "docs": "docs-pr-template.md",
    "chore": "chore-pr-template.md"
  },
  "reviewers": {
    "codeOwners": true,
    "autoSuggest": true,
    "rules": {
      "frontend": ["@frontend-team", "@ui-specialists"],
      "backend": ["@backend-team", "@api-experts"],
      "docs": ["@tech-writers", "@documentation-team"],
      "security": ["@security-team"],
      "performance": ["@performance-team"]
    },
    "minimumReviewers": 1,
    "maximumReviewers": 3
  },
  "labels": {
    "autoDetect": true,
    "mapping": {
      "feat": ["enhancement", "feature"],
      "fix": ["bug", "bugfix"],
      "docs": ["documentation"],
      "style": ["style", "formatting"],
      "refactor": ["refactor", "cleanup"],
      "perf": ["performance"],
      "test": ["testing"],
      "chore": ["maintenance"],
      "security": ["security", "vulnerability"]
    },
    "sizeLabels": {
      "enabled": true,
      "small": "< 100 lines",
      "medium": "100-500 lines", 
      "large": "500-1000 lines",
      "xlarge": "> 1000 lines"
    }
  },
  "analysis": {
    "detectBreakingChanges": true,
    "analyzeComplexity": true,
    "suggestReviewers": true,
    "estimateReviewTime": true,
    "checkDependencies": true
  }
}
```

## Salida del Comando

### Análisis de PR
```
🔗 CLAUDE POWER - CREATE PR ANALYSIS
====================================

📊 ANÁLISIS DE CAMBIOS:
┌─────────────────┬─────────┬─────────────┐
│ Categoría       │ Archivos│ Complejidad │
├─────────────────┼─────────┼─────────────┤
│ Frontend        │    8    │ Media       │
│ Backend         │    3    │ Baja        │
│ Tests           │    5    │ Baja        │
│ Docs            │    2    │ Muy Baja    │
│ Config          │    1    │ Baja        │
└─────────────────┴─────────┴─────────────┘

🎯 TIPO DETECTADO: Feature PR
📏 TAMAÑO: Medium (347 líneas cambiadas)
⏱️ TIEMPO ESTIMADO DE REVIEW: 25-30 minutos

🏷️ LABELS SUGERIDOS:
• enhancement
• feature  
• frontend
• needs-review
• size/medium

👥 REVIEWERS SUGERIDOS:
• @frontend-team (archivos UI modificados)
• @john-doe (CODEOWNER de auth/)
• @security-team (cambios en autenticación)
```

### PR Generado
```
📝 PULL REQUEST GENERADO:
========================

🔗 URL: https://github.com/org/repo/pull/156

📋 TÍTULO:
feat(auth): implement comprehensive OAuth2 authentication system

📄 DESCRIPCIÓN:
## 🚀 Feature: OAuth2 Authentication System

### 📋 Descripción
Este PR implementa un sistema completo de autenticación OAuth2 que permite a los usuarios iniciar sesión usando múltiples proveedores externos (Google, GitHub, Microsoft).

### ✨ Cambios Principales
- ✅ Nuevo AuthProvider component para gestión de estado
- ✅ LoginForm component con validación y UX mejorada  
- ✅ OAuth2Service para integración con proveedores
- ✅ AuthGuard para protección de rutas
- ✅ Token refresh automático y gestión de sesiones
- ✅ Tests unitarios e integración completos

### 🧪 Testing
- [x] Unit tests añadidos (95% coverage)
- [x] Integration tests verificados
- [x] E2E tests para flujos críticos
- [x] Manual testing en diferentes browsers

### 🔗 Issues Relacionados
Closes #123: Implement social login
Closes #124: Add OAuth2 support
Related to #125: Improve user onboarding

### 🚨 Breaking Changes
Ninguno - completamente backward compatible

### 📝 Checklist
- [x] Código revisado por el autor
- [x] Documentación actualizada
- [x] Tests pasando (100%)
- [x] No merge conflicts
- [x] Performance verificado
```

### Validaciones Pre-PR
```
🔍 VALIDACIONES PRE-PR:
======================

✅ Branch up-to-date con base
✅ No merge conflicts detectados
✅ CI/CD pipeline verde
✅ Tests coverage > 80%
✅ No secrets o credentials expuestos
✅ Documentación actualizada
⚠️ 2 archivos grandes detectados (considerar split)
✅ CODEOWNERS notificados

🚦 RESULTADO: ✅ LISTO PARA CREAR PR
```

## Integraciones Avanzadas

### GitHub API Integration
```javascript
// Auto-configuración de PR
{
  "github": {
    "linkIssues": true,
    "autoAssignLabels": true,
    "requestReviewers": true,
    "enableAutoMerge": false,
    "deleteBranchAfterMerge": true,
    "allowSquashMerge": true,
    "allowMergeCommit": false,
    "allowRebaseMerge": true
  }
}
```

### Jira Integration
```javascript
// Linking automático con Jira
{
  "jira": {
    "autoLinkTickets": true,
    "transitionOnMerge": true,
    "addPRLinkToTicket": true,
    "ticketPatterns": [
      "PROJ-\\d+",
      "TICKET-\\d+"
    ]
  }
}
```

### Slack Notifications
```javascript
{
  "slack": {
    "notifyOnCreate": true,
    "channels": {
      "features": "#feature-reviews",
      "hotfixes": "#urgent-reviews",
      "docs": "#documentation"
    },
    "mentionReviewers": true,
    "includePreview": true
  }
}
```

## Flujos Especiales

### Release PR
```bash
# PR automático para release
/create-pr --type=release --template=release --auto-changelog=true --version=2.1.0
```

### Security PR  
```bash
# PR para fix de seguridad
/create-pr --type=security --template=security --priority=high --reviewers=@security-team
```

### Documentation PR
```bash
# PR solo para docs
/create-pr --type=docs --target=gh-pages --auto-merge=true
```

## Análisis IA Avanzado

### Impact Analysis
```
🧠 ANÁLISIS DE IMPACTO IA:
=========================

📈 COMPLEJIDAD:
• Cognitive Complexity: Media (7/10)
• Cyclomatic Complexity: 12 (dentro de límites)
• Dependencies Impact: low

⚡ PERFORMANCE:
• Bundle Size Impact: +15KB (+2.3%)
• Runtime Performance: Neutral
• Loading Time: +0.1s (mínimo)

🔒 SECURITY:
• No vulnerabilities detectadas
• OAuth2 implementation sigue best practices
• Token handling es seguro

🎯 CALIDAD:
• Code Quality Score: 9.2/10
• Test Coverage: 95% (+5% vs baseline)
• Documentation Coverage: 100%

💡 RECOMENDACIONES:
• Considerar lazy loading para OAuth components
• Agregar monitoring para token refresh failures
• Documentar rate limiting considerations
```

### Review Time Estimation
```
⏱️ ESTIMACIÓN DE REVIEW:
========================

👥 REVIEWERS ESTIMADOS: 2-3 personas
⏰ TIEMPO POR REVIEWER:
• Senior Dev: 20-25 min
• Security Expert: 15-20 min
• Frontend Specialist: 25-30 min

📊 TOTAL ESTIMADO: 45-60 minutos

🎯 PRIORIDAD SUGERIDA: Media-Alta
📅 TARGET MERGE: Dentro de 2-3 días
```

---

*Parte del ecosistema **Claude Power** - Automatiza tu workflow con IA* 🚀 
