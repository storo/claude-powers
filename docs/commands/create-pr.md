# Comando /create-pr

Automatiza completamente la creación de pull requests con análisis IA, templates inteligentes y configuración avanzada.

## 📋 Descripción Completa

El comando `/create-pr` transforma la creación manual de pull requests en un proceso automatizado e inteligente:

- **Análisis completo** de todos los commits y cambios del branch
- **Generación automática** de títulos y descripciones profesionales
- **Templates dinámicos** que se adaptan al tipo de cambio
- **Detección inteligente** de revisores basada en archivos modificados
- **Labels automáticos** según el contenido y patrón de cambios
- **Validaciones pre-PR** para asegurar calidad
- **Integración nativa** con GitHub, GitLab y Bitbucket
- **Checklists inteligentes** según el tipo de cambio

## 🎯 Análisis Automático Avanzado

### Detección de Tipo de PR

#### 🚀 Feature Pull Request
```bash
# Detecta cuando hay:
✅ Nuevos componentes o páginas
✅ Nuevas funcionalidades
✅ Nuevas APIs o endpoints
✅ Integración de librerías
✅ Nuevos hooks o utilities
✅ Expansión de características existentes

# Ejemplo de detección:
src/components/UserDashboard.tsx    → Feature PR
backend/api/notifications.js       → Feature PR  
hooks/useWebSocket.ts              → Feature PR
```

#### 🐛 Bugfix Pull Request
```bash
# Detecta cuando hay:
✅ Corrección de errores específicos
✅ Fixes de comportamiento
✅ Parches de compatibilidad
✅ Corrección de regresiones
✅ Mejoras de estabilidad

# Ejemplo de detección:
Fix null pointer exception        → Bugfix PR
Resolve memory leak issue        → Bugfix PR
Correct responsive layout        → Bugfix PR
```

#### 🔥 Hotfix Pull Request  
```bash
# Detecta cuando hay:
✅ Commits con "hotfix" o "urgent"
✅ Fixes críticos para producción
✅ Parches de seguridad
✅ Corrección de downtime
✅ Rollback de cambios problemáticos

# Ejemplo de detección:
hotfix: critical payment bug      → Hotfix PR
urgent: security vulnerability    → Hotfix PR
```

### Análisis de Complejidad y Riesgo

```
🧠 ANÁLISIS DE COMPLEJIDAD IA:
==============================

📊 Métricas de Cambio:
• Archivos modificados: 15
• Líneas añadidas: +347
• Líneas eliminadas: -123
• Complejidad ciclomática: +5
• Cobertura de tests: 87% (+3%)

🎯 Nivel de Riesgo:
• BAJO: Cambios aislados, bien testeados
• MEDIO: Múltiples archivos, lógica compleja  
• ALTO: Breaking changes, core functionality

⚡ Impacto Estimado:
• Bundle size: +25KB (+3.2%)
• Performance: Neutral/Positivo
• Seguridad: Sin impacto negativo
• Compatibilidad: Totalmente compatible
```

## 🛠️ Parámetros Completos

### Sintaxis Avanzada
```
/create-pr [opciones]
```

### Opciones Detalladas

| Opción | Valores | Descripción | Ejemplo |
|--------|---------|-------------|---------|
| `--titulo` | `string` | Título personalizado del PR | `--titulo="Add user dashboard"` |
| `--tipo` | `feature,bugfix,hotfix,docs,chore,release` | Tipo específico de PR | `--tipo=feature` |
| `--base` | `branch_name` | Branch base para el merge | `--base=develop` |
| `--target` | `branch_name` | Branch actual (auto-detectado) | `--target=feature/dashboard` |
| `--template` | `template_name` | Template específico a usar | `--template=feature` |
| `--reviewers` | `@user1,@user2` | Lista de revisores | `--reviewers=@john,@mary` |
| `--labels` | `label1,label2` | Labels a añadir | `--labels=enhancement,frontend` |
| `--draft` | `true,false` | Crear como draft PR | `--draft=true` |
| `--auto-merge` | `true,false` | Habilitar auto-merge | `--auto-merge=true` |
| `--milestone` | `milestone_name` | Asignar a milestone | `--milestone=v2.1.0` |
| `--project` | `project_name` | Añadir a project board | `--project=Frontend Tasks` |

### Ejemplos Prácticos

```bash
# PR automático básico
/create-pr

# Feature PR con revisores específicos
/create-pr --tipo=feature --reviewers=@frontend-team,@john-doe

# Hotfix PR urgente con auto-merge
/create-pr --tipo=hotfix --auto-merge=true --labels=urgent,critical

# Draft PR para revisión temprana  
/create-pr --draft=true --titulo="WIP: User authentication"

# PR con milestone y project
/create-pr --milestone=v2.1.0 --project="Sprint 15"

# PR hacia develop branch
/create-pr --base=develop --tipo=feature

# PR de documentación
/create-pr --tipo=docs --target=gh-pages --auto-merge=true
```

## 📊 Análisis y Salida Detallada

### Análisis Pre-PR
```
🔗 CLAUDE POWER - CREATE PR ANALYSIS
====================================

📂 ANÁLISIS DEL BRANCH:
┌─────────────────┬─────────┬─────────────┬─────────────┐
│ Categoría       │ Archivos│ Complejidad │ Riesgo      │
├─────────────────┼─────────┼─────────────┼─────────────┤
│ Frontend        │    8    │ Media       │ Bajo        │
│ Backend         │    3    │ Baja        │ Bajo        │
│ Tests           │    5    │ Baja        │ Muy Bajo    │
│ Docs            │    2    │ Muy Baja    │ Ninguno     │
│ Config          │    1    │ Baja        │ Bajo        │
└─────────────────┴─────────┴─────────────┴─────────────┘

🎯 DETECCIÓN AUTOMÁTICA:
• Tipo: Feature PR (85% confianza)
• Alcance: User Dashboard
• Tamaño: Medium (347 líneas)
• Breaking changes: No detectados

⏱️ ESTIMACIONES:
• Tiempo de review: 25-35 minutos
• Reviewers sugeridos: 2-3 personas
• Complejidad: Media
• Prioridad: Media-Alta

🏷️ LABELS SUGERIDOS:
• enhancement
• feature
• frontend  
• needs-review
• size/medium

👥 REVIEWERS AUTOMÁTICOS:
• @frontend-team (archivos UI modificados)
• @john-doe (CODEOWNER de /src/components/)
• @security-team (cambios en auth)
```

### PR Generado Completo
```
📝 PULL REQUEST CREADO:
=======================

🔗 URL: https://github.com/org/repo/pull/156
📋 TÍTULO: feat(dashboard): implement comprehensive user dashboard

📄 DESCRIPCIÓN COMPLETA:
## 🚀 Feature: User Dashboard

### 📋 Descripción
Este PR implementa un dashboard completo para usuarios que proporciona una vista unificada de todas sus actividades, métricas y configuraciones personales.

### ✨ Cambios Principales
- ✅ Componente UserDashboard con diseño responsive
- ✅ Widget system para métricas personalizables  
- ✅ Integración con API de analytics
- ✅ Sistema de notificaciones en tiempo real
- ✅ Configuración de preferencias de usuario
- ✅ Tests unitarios e integración completos (95% coverage)

### 🧪 Testing Realizado
- [x] Unit tests para todos los componentes (95% coverage)
- [x] Integration tests para API calls
- [x] E2E tests para flujos principales
- [x] Visual regression tests
- [x] Performance testing (Lighthouse 95+)
- [x] Cross-browser testing (Chrome, Firefox, Safari)
- [x] Mobile responsiveness verified

### 📸 Screenshots
![Dashboard Overview](./screenshots/dashboard-overview.png)
![Widget Configuration](./screenshots/widget-config.png)

### 🔗 Issues Relacionados
Closes #123: User needs personalized dashboard
Closes #124: Add real-time notifications
Related to #125: Improve user engagement

### 🚨 Breaking Changes
**Ninguno** - Completamente backward compatible

### 📊 Performance Impact
- Bundle size: +25KB (+3.2% - within acceptable limits)
- Load time: <100ms additional
- Lighthouse score: 95+ maintained
- Memory usage: +2MB (optimized)

### 🔒 Security Considerations
- ✅ User data properly scoped
- ✅ API calls authenticated
- ✅ XSS protection implemented
- ✅ CSRF tokens validated

### 📝 Checklist
- [x] Código revisado por el autor
- [x] Documentación actualizada
- [x] Tests pasando (100%)
- [x] No merge conflicts
- [x] Performance verificado
- [x] Security review completado
- [x] Accessibility guidelines followed (WCAG 2.1)
- [x] Browser compatibility tested
```

### Validaciones Pre-PR
```
🔍 VALIDACIONES PRE-PR:
======================

✅ Git Status: Branch clean and ready
✅ Branch Sync: Up to date with base branch (main)
✅ Conflicts: No merge conflicts detected
✅ CI/CD: All checks passing ✅
✅ Tests: 87 passing, 0 failing, 95% coverage
✅ Linting: ESLint clean, 0 errors
✅ Security: No vulnerabilities detected
✅ Performance: Bundle impact within limits
✅ Dependencies: All licenses compatible
⚠️ Size Warning: 2 large files detected (consider optimization)
✅ Documentation: All public APIs documented

🔐 SECURITY SCAN:
• No secrets detected in code
• API keys properly externalized
• Input validation implemented
• Output encoding verified

🚦 RESULTADO: ✅ READY TO CREATE PR
💡 Suggestion: Consider adding visual regression tests
```

## ⚙️ Templates Avanzados

### Template Feature Completo
```markdown
## 🚀 Feature: {feature_name}

### 📋 Descripción
{ai_generated_description}

### ✨ Cambios Principales
{major_changes_detailed}

### 🎯 Objetivos
- [ ] {objective_1}
- [ ] {objective_2}
- [ ] {objective_3}

### 🧪 Testing Strategy
- [ ] Unit tests (target: 90%+ coverage)
- [ ] Integration tests for new APIs
- [ ] E2E tests for critical user flows
- [ ] Performance benchmarks
- [ ] Security testing
- [ ] Accessibility validation

### 📱 Cross-Platform Testing
- [ ] Desktop (Chrome, Firefox, Safari, Edge)
- [ ] Mobile (iOS Safari, Chrome Mobile)
- [ ] Tablet responsiveness
- [ ] Dark/Light mode compatibility

### 🔗 Dependencies & Integration
{dependency_analysis}

### 📊 Metrics & Analytics
{metrics_tracking}

### 🚨 Breaking Changes
{breaking_changes_analysis}

### 🔄 Migration Guide
{migration_instructions}

### 📸 Visual Evidence
{screenshots_and_demos}

### 🔗 Related Issues
{linked_issues}

### 📝 Post-Merge Checklist
- [ ] Update documentation
- [ ] Announce in team channels
- [ ] Monitor performance metrics
- [ ] Gather user feedback
```

### Template Hotfix Crítico
```markdown
## 🔥 HOTFIX: {critical_issue}

### ⚠️ URGENCIA - PRODUCCIÓN AFECTADA
**Severidad:** {severity_level}
**Impacto:** {impact_description}
**Downtime:** {estimated_downtime}

### 🎯 Root Cause Analysis
**Problema identificado:**
{detailed_root_cause}

**Línea de tiempo:**
- {timestamp_1}: Issue reported
- {timestamp_2}: Investigation started
- {timestamp_3}: Root cause identified
- {timestamp_4}: Fix implemented

### 🔧 Solución Implementada
{fix_description_detailed}

### 🧪 Verificación Crítica
- [x] Issue reproduced in staging
- [x] Fix verified locally
- [x] No regression in critical paths
- [x] Performance impact assessed
- [x] Rollback plan prepared

### 🚀 Deployment Plan
- [ ] Deploy to staging ✅
- [ ] Verify fix in staging ✅  
- [ ] Deploy to production
- [ ] Monitor key metrics
- [ ] Confirm issue resolution

### 📊 Impact Assessment
- **Users affected:** {user_count}
- **Duration:** {duration}
- **Revenue impact:** {revenue_impact}
- **SLA impact:** {sla_impact}

### 🔄 Prevention Measures
{prevention_plan}

### 📞 Stakeholder Communication
- [ ] Engineering team notified
- [ ] Product team informed
- [ ] Customer support briefed
- [ ] Leadership updated
```

## 🚀 Integraciones Empresariales

### GitHub Enterprise
```json
{
  "github": {
    "enterprise": {
      "enabled": true,
      "serverUrl": "https://github.company.com",
      "apiVersion": "v3"
    },
    "branchProtection": {
      "enforceReviewers": true,
      "requiredChecks": ["ci/lint", "ci/test", "ci/security"],
      "dismissStaleReviews": true,
      "requireBranchUpToDate": true
    },
    "autoMerge": {
      "conditions": {
        "minApprovals": 2,
        "allChecksPass": true,
        "noRequestedChanges": true,
        "branchUpToDate": true
      }
    }
  }
}
```

### Jira Advanced Integration  
```json
{
  "jira": {
    "server": "https://company.atlassian.net",
    "project": "PROJ",
    "workflows": {
      "onPRCreate": {
        "transition": "In Review",
        "assignReviewer": true,
        "updateEstimate": true
      },
      "onPRMerge": {
        "transition": "Done",
        "logWork": true,
        "closeIssue": true
      }
    },
    "smartLinking": {
      "autoDetectTickets": true,
      "linkSubtasks": true,
      "updateParentStory": true
    }
  }
}
```

### Slack Enterprise
```json
{
  "slack": {
    "workspace": "company.slack.com",
    "channels": {
      "features": "#product-reviews",
      "hotfixes": "#critical-alerts", 
      "security": "#security-reviews",
      "releases": "#release-updates"
    },
    "notifications": {
      "onPRCreate": {
        "message": "🚀 New PR ready for review",
        "mentionReviewers": true,
        "includeScreenshots": true
      },
      "onPRApprove": {
        "message": "✅ PR approved",
        "mentionAuthor": true
      },
      "onPRMerge": {
        "message": "🎉 PR merged successfully",
        "announceFeatures": true
      }
    }
  }
}
```

## 📈 Métricas y Analytics

### Dashboard de PR Metrics
```
📊 PR ANALYTICS DASHBOARD:
=========================

📈 Estadísticas del Mes:
┌─────────────────┬─────────┬─────────────┬─────────────┐
│ Tipo            │ Count   │ Avg Review  │ Merge Rate  │
├─────────────────┼─────────┼─────────────┼─────────────┤
│ Features        │   23    │ 2.3 days    │    95.7%    │
│ Bugfixes        │   15    │ 1.1 days    │    100%     │
│ Hotfixes        │    3    │ 0.5 days    │    100%     │
│ Docs            │    8    │ 0.7 days    │    100%     │
│ Chores          │    5    │ 1.5 days    │    80%      │
└─────────────────┴─────────┴─────────────┴─────────────┘

🎯 Calidad Promedio:
• Descripción: 9.2/10
• Tests coverage: 87% promedio
• CI/CD success: 96%
• Auto-merge eligible: 65%

⚡ Performance:
• Tiempo creación: 45s promedio
• Detección automática: 92% precisión
• Template matching: 98% efectividad
```

### Alertas y Monitoring
```
🚨 ALERTAS CONFIGURADAS:
=======================

⚠️ Quality Gates:
• Test coverage < 80%
• Bundle size increase > 10%
• Performance degradation > 15%
• Security vulnerabilities detected

🔔 Notifications:
• PR stale > 3 days
• Conflicting PRs detected
• Large file additions (>1MB)
• Breaking changes without migration guide

📊 Automated Reports:
• Weekly PR summary
• Monthly team metrics
• Quarterly trend analysis
```

---

*Herramienta del ecosistema **Claude Power** - Automatiza tu workflow con IA* 🚀 