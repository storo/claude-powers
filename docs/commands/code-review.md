# Comando /code-review

Realiza revisiones automáticas y exhaustivas de código usando análisis IA avanzado para elevar la calidad, seguridad y mantenibilidad del proyecto.

## 📋 Descripción Completa

El comando `/code-review` es la herramienta más avanzada del ecosistema Claude Power, diseñada para proporcionar revisiones de código de nivel profesional utilizando IA de última generación:

- **Análisis holístico** que evalúa múltiples dimensiones de calidad
- **Inteligencia contextual** que adapta criterios según el tipo de proyecto
- **Sugerencias actionables** con ejemplos específicos de mejora
- **Métricas cuantificables** para tracking de progreso
- **Integración empresarial** con herramientas de desarrollo existentes
- **Reportes profesionales** listos para stakeholders técnicos y de negocio

## 🎯 Metodología de Análisis

### Framework de Evaluación Multidimensional

#### 🏗️ Calidad del Código (25% del score)
```
📊 MÉTRICAS EVALUADAS:
• Complejidad Ciclomática: ≤10 por función (óptimo)
• Complejidad Cognitiva: ≤15 por función (límite)
• Longitud de Función: ≤50 líneas (recomendado)
• Profundidad de Anidamiento: ≤4 niveles (máximo)
• Cohesión de Módulos: >0.7 (alta cohesión)
• Acoplamiento: <0.3 (bajo acoplamiento)

🔍 PRINCIPIOS EVALUADOS:
• SOLID Principles compliance
• DRY (Don't Repeat Yourself)
• KISS (Keep It Simple, Stupid)
• YAGNI (You Aren't Gonna Need It)
• Clean Code practices
```

#### 🏛️ Arquitectura y Patrones (20% del score)
```
🎨 PATRONES DE DISEÑO:
• MVC/MVP/MVVM implementation
• Component composition patterns
• Service layer architecture
• Repository pattern usage
• Factory/Builder patterns
• Observer/Publisher-Subscriber

🚫 ANTI-PATRONES DETECTADOS:
• God Object (>300 LOC o >10 responsabilidades)
• Spaghetti Code (alta complejidad + bajo acoplamiento)
• Golden Hammer (overuse de una solución)
• Copy-Paste Programming
• Magic Numbers/Strings
• Singleton overuse
```

#### ⚡ Performance y Optimización (20% del score)
```
🔬 ANÁLISIS DE RENDIMIENTO:
• Complejidad algorítmica (Big O analysis)
• Memory allocation patterns
• I/O operation efficiency
• Database query optimization
• Bundle size impact
• Runtime performance bottlenecks

💡 OPTIMIZACIONES DETECTADAS:
• Lazy loading opportunities
• Memoization candidates
• Caching strategies
• Resource compression
• Code splitting opportunities
• Dead code elimination
```

#### 🔒 Seguridad (25% del score)
```
🛡️ ESTÁNDARES DE SEGURIDAD:
• OWASP Top 10 compliance
• CWE Top 25 vulnerability check
• SANS Top 25 programming errors
• Input validation completeness
• Output encoding practices
• Authentication/Authorization patterns

🚨 VULNERABILIDADES COMUNES:
• SQL Injection risks
• Cross-Site Scripting (XSS)
• Cross-Site Request Forgery (CSRF)
• Insecure Direct Object References
• Security Misconfiguration
• Sensitive Data Exposure
• Broken Authentication/Session Management
```

#### 🧪 Testing (15% del score)
```
📈 MÉTRICAS DE TESTING:
• Code Coverage: Target 80%+ (Statement, Branch, Function)
• Test Quality Score: Assertion strength, Edge cases
• Test Maintainability: DRY, clear naming, isolation
• Test Performance: Execution time, resource usage

🎯 TIPOS DE TESTING EVALUADOS:
• Unit Testing completeness
• Integration Testing strategy
• End-to-End Testing coverage
• Performance Testing presence
• Security Testing implementation
• Accessibility Testing (WCAG compliance)
```

#### 📚 Documentación (10% del score)
```
📖 DOCUMENTACIÓN EVALUADA:
• API Documentation (JSDoc, OpenAPI)
• Code Comments quality vs noise ratio
• README completeness and clarity
• Architecture documentation
• Setup/Contributing guidelines
• Change logs and versioning

💭 CALIDAD DE COMENTARIOS:
• Why vs What commenting
• Outdated comments detection
• TODO/FIXME tracking
• Complex algorithm explanation
• Business logic documentation
```

## 🛠️ Parámetros y Configuración Avanzada

### Sintaxis Completa
```
/code-review [directorio] [opciones]
```

### Opciones Detalladas

| Opción | Valores | Descripción | Impacto en Análisis |
|--------|---------|-------------|-------------------|
| `--aspectos` | `calidad,arquitectura,performance,seguridad,testing,docs` | Aspectos específicos a evaluar | Focaliza el análisis |
| `--severidad` | `estricto,moderado,relajado` | Nivel de exigencia en criterios | Ajusta thresholds |
| `--formato` | `detailed,summary,actionable,report,json` | Formato de output | Cambia presentación |
| `--profundidad` | `surface,deep,comprehensive` | Nivel de análisis | Tiempo vs detalle |
| `--contexto` | `startup,enterprise,legacy,greenfield` | Contexto del proyecto | Ajusta pesos y criterios |
| `--tech-stack` | `react,vue,angular,node,python,java` | Stack tecnológico | Reglas específicas |
| `--focus` | `maintainability,scalability,performance,security` | Foco prioritario | Redistribuye pesos |
| `--baseline` | `path/to/baseline.json` | Comparar con baseline anterior | Muestra evolución |
| `--exclude` | `pattern1,pattern2` | Patrones de exclusión adicionales | Filtrado refinado |
| `--team-size` | `1-5,6-15,16+` | Tamaño del equipo | Adapta complejidad |

### Ejemplos de Uso Avanzado

```bash
# Análisis completo para startup MVP
/code-review --contexto=startup --focus=speed,functionality --severidad=relajado

# Review de seguridad para enterprise
/code-review --aspectos=seguridad,calidad --contexto=enterprise --severidad=estricto

# Análisis de performance para app crítica
/code-review backend/ --focus=performance,scalability --profundidad=comprehensive

# Review de arquitectura para refactoring
/code-review --aspectos=arquitectura,calidad --formato=actionable --baseline=last-review.json

# Análisis específico para React components
/code-review src/components/ --tech-stack=react --aspectos=calidad,testing --formato=detailed

# Review de migración de código legacy
/code-review --contexto=legacy --focus=maintainability --profundidad=deep --team-size=6-15

# Análisis de nuevo proyecto greenfield
/code-review --contexto=greenfield --aspectos=arquitectura,calidad --severidad=estricto
```

## 📊 Interpretación de Resultados

### Sistema de Puntuación

#### Escala General (0-10)
```
🎯 CLASIFICACIÓN POR SCORE:
• 9.0-10.0: Excelente (Best-in-class)
• 8.0-8.9:  Muy Bueno (Above average)
• 7.0-7.9:  Bueno (Industry standard)
• 6.0-6.9:  Aceptable (Needs improvement)
• 5.0-5.9:  Por debajo del estándar (Requires action)
• 0-4.9:    Crítico (Immediate attention required)
```

#### Interpretación por Aspecto

**🏗️ Calidad del Código**
```
Score 8.5-10.0: Código excepcional
- Funciones pequeñas y enfocadas
- Naming conventions excellentes
- Baja complejidad y alto maintainability
- Principios SOLID bien aplicados

Score 7.0-8.4: Código sólido con áreas de mejora
- Mayoría de funciones bien diseñadas
- Algunas oportunidades de refactoring
- Consistencia general buena

Score 5.0-6.9: Código funcional pero necesita trabajo
- Varias funciones complejas
- Inconsistencias en patrones
- Refactoring necesario

Score <5.0: Código problemático
- Alta complejidad generalizada
- Difícil de mantener y extender
- Refactoring urgente requerido
```

**🏛️ Arquitectura**
```
Score 8.5-10.0: Arquitectura ejemplar
- Clara separación de responsabilidades
- Patrones apropiados implementados
- Escalable y mantenible
- Bajo acoplamiento, alta cohesión

Score 7.0-8.4: Arquitectura sólida
- Buena estructura general
- Algunos anti-patrones menores
- Fácil de navegar y entender

Score 5.0-6.9: Arquitectura aceptable
- Estructura básica presente
- Varios problemas de organización
- Algunos anti-patrones presentes

Score <5.0: Arquitectura problemática
- Falta de estructura clara
- Anti-patrones dominantes
- Difícil de navegar y modificar
```

### Análisis de Tendencias

```
📈 TRACKING DE EVOLUCIÓN:
========================

Comparación Temporal (últimos 6 meses):
┌─────────────────┬─────────┬─────────┬─────────┐
│ Aspecto         │ Ene-23  │ Mar-23  │ Jun-23  │
├─────────────────┼─────────┼─────────┼─────────┤
│ Calidad         │  7.2    │  7.8    │  8.5    │
│ Arquitectura    │  6.9    │  7.1    │  7.8    │
│ Performance     │  8.1    │  8.7    │  9.1    │
│ Seguridad       │  6.5    │  6.8    │  7.2    │
│ Testing         │  5.9    │  7.2    │  7.9    │
│ Documentación   │  5.5    │  6.1    │  6.8    │
└─────────────────┴─────────┴─────────┴─────────┘

🎯 INSIGHTS:
• Mejora constante en todas las áreas
• Mayor progreso en Testing (+2.0 puntos)
• Documentación sigue siendo área de oportunidad
• Performance mantiene excellence level
```

## ⚙️ Configuración Contextual Avanzada

### Configuración por Contexto de Proyecto

#### Startup/MVP Context
```json
{
  "startup": {
    "focus": ["speed", "mvp", "functionality", "time-to-market"],
    "relaxedStandards": ["documentation", "comprehensive-testing", "complex-architecture"],
    "priorities": ["functionality", "performance", "basic-security"],
    "adjustments": {
      "documentation": { "weight": 5, "thresholds": { "minCommentRatio": 0.05 } },
      "testing": { "targetCoverage": 60, "requiredTypes": ["unit"] },
      "architecture": { "weight": 15, "allowSimplePatterns": true },
      "performance": { "focus": ["core-features"], "bundleSize": "1MB" }
    },
    "allowedTechnicalDebt": ["todo-comments", "simple-structure", "basic-error-handling"]
  }
}
```

#### Enterprise Context
```json
{
  "enterprise": {
    "focus": ["security", "maintainability", "scalability", "compliance", "documentation"],
    "strictStandards": ["all"],
    "priorities": ["security", "quality", "documentation", "testing", "architecture"],
    "adjustments": {
      "security": { "weight": 30, "enforceAllStandards": true },
      "quality": { "weight": 30, "strictThresholds": true },
      "documentation": { "weight": 15, "requireComprehensive": true },
      "testing": { "targetCoverage": 90, "requiredTypes": ["unit", "integration", "e2e"] },
      "architecture": { "weight": 25, "enforcePatterns": true }
    },
    "requiredCompliance": ["SOX", "GDPR", "HIPAA"],
    "auditTrail": true
  }
}
```

#### Legacy Code Context
```json
{
  "legacy": {
    "focus": ["refactoring", "testing", "documentation", "modernization", "stability"],
    "graduatedApproach": true,
    "priorities": ["quality", "testing", "security", "documentation"],
    "adjustments": {
      "architecture": { "relaxed": true, "evolutionaryRefactoring": true },
      "performance": { "focus": ["critical-paths", "obvious-wins"] },
      "testing": { "retroactiveStrategy": true, "characterizationTests": true }
    },
    "modernizationPath": {
      "phase1": ["testing", "documentation"],
      "phase2": ["refactoring", "patterns"],
      "phase3": ["architecture", "performance"]
    }
  }
}
```

### Configuración por Stack Tecnológico

#### React/Frontend Stack
```json
{
  "react": {
    "specificRules": {
      "hooksRules": {
        "exhaustiveDeps": true,
        "rulesOfHooks": true,
        "customHookPatterns": true
      },
      "componentPatterns": {
        "compositionOverInheritance": true,
        "propTypes": true,
        "renderPropPatterns": true,
        "higherOrderComponents": true
      },
      "stateManagement": {
        "immutability": true,
        "stateShape": true,
        "contextOverprop-drilling": true
      },
      "performancePatterns": {
        "memoization": true,
        "lazyLoading": true,
        "bundleSplitting": true,
        "virtualization": true
      }
    },
    "antiPatterns": [
      "prop-drilling", 
      "god-components", 
      "render-props-overuse",
      "inline-object-creation",
      "direct-dom-manipulation"
    ],
    "performanceMetrics": {
      "firstContentfulPaint": "1.5s",
      "largestContentfulPaint": "2.5s",
      "firstInputDelay": "100ms",
      "cumulativeLayoutShift": "0.1"
    }
  }
}
```

#### Node.js/Backend Stack
```json
{
  "node": {
    "specificRules": {
      "asyncPatterns": {
        "promiseUsage": true,
        "asyncAwaitPatterns": true,
        "errorFirstCallbacks": true,
        "eventEmitterPatterns": true
      },
      "errorHandling": {
        "globalErrorHandlers": true,
        "gracefulShutdown": true,
        "errorLogging": true,
        "operationalVsProgrammerErrors": true
      },
      "memoryManagement": {
        "streamUsage": true,
        "bufferManagement": true,
        "memoryLeaks": true,
        "garbageCollection": true
      },
      "securityPatterns": {
        "inputValidation": true,
        "sqlInjectionPrevention": true,
        "xssProtection": true,
        "authenticationPatterns": true
      }
    },
    "antiPatterns": [
      "callback-hell",
      "sync-in-async",
      "memory-leaks",
      "blocking-event-loop",
      "unhandled-promise-rejections"
    ],
    "performanceMetrics": {
      "responseTime": "200ms",
      "throughput": "1000 req/s",
      "memoryUsage": "512MB",
      "cpuUsage": "70%"
    }
  }
}
```

## 🚀 Casos de Uso Empresariales

### Code Review en Pull Requests

#### GitHub Actions Integration
```yaml
name: Automated Code Review

on:
  pull_request:
    branches: [main, develop]
    types: [opened, synchronize, reopened]

jobs:
  code-review:
    runs-on: ubuntu-latest
    permissions:
      contents: read
      pull-requests: write
      
    steps:
      - name: Checkout code
        uses: actions/checkout@v3
        with:
          fetch-depth: 0
          
      - name: Setup Node.js
        uses: actions/setup-node@v3
        with:
          node-version: '18'
          cache: 'npm'
          
      - name: Install dependencies
        run: npm ci
        
      - name: Run comprehensive code review
        id: review
        run: |
          npx claude-power code-review \
            --formato=json \
            --profundidad=comprehensive \
            --contexto=enterprise \
            --baseline=./.code-review/baseline.json \
            > review-results.json
            
      - name: Generate review summary
        id: summary
        run: |
          SCORE=$(jq -r '.overall_score' review-results.json)
          CRITICAL=$(jq -r '.critical_issues | length' review-results.json)
          echo "score=$SCORE" >> $GITHUB_OUTPUT
          echo "critical=$CRITICAL" >> $GITHUB_OUTPUT
          
      - name: Comment PR with results
        uses: actions/github-script@v6
        with:
          script: |
            const fs = require('fs');
            const review = JSON.parse(fs.readFileSync('review-results.json'));
            
            const scoreEmoji = score => {
              if (score >= 9) return '🟢';
              if (score >= 7) return '🟡';
              return '🔴';
            };
            
            const comment = `
            ## 👨‍💻 Automated Code Review Results
            
            ${scoreEmoji(review.overall_score)} **Overall Score:** ${review.overall_score}/10
            
            ### 📊 Aspect Breakdown:
            | Aspect | Score | Status |
            |--------|-------|--------|
            ${Object.entries(review.aspects).map(([aspect, data]) => 
              `| ${aspect} | ${data.score}/10 | ${scoreEmoji(data.score)} |`
            ).join('\n')}
            
            ### 🚨 Critical Issues: ${review.critical_issues.length}
            ${review.critical_issues.length > 0 ? 
              review.critical_issues.slice(0, 3).map(issue => `- ${issue.description}`).join('\n') : 
              'None found ✅'
            }
            
            ### 💡 Top Recommendations:
            ${review.top_recommendations.slice(0, 3).map(rec => `- ${rec}`).join('\n')}
            
            <details>
            <summary>📈 Detailed Metrics</summary>
            
            \`\`\`json
            ${JSON.stringify(review.metrics, null, 2)}
            \`\`\`
            </details>
            
            ---
            🤖 *Generated by Claude Power Code Review*
            `;
            
            github.rest.issues.createComment({
              issue_number: context.issue.number,
              owner: context.repo.owner,
              repo: context.repo.repo,
              body: comment
            });
            
      - name: Fail on critical issues
        if: steps.summary.outputs.critical > 0
        run: |
          echo "❌ Found ${{ steps.summary.outputs.critical }} critical issues"
          echo "Review must be addressed before merge"
          exit 1
          
      - name: Update baseline
        if: github.event_name == 'push' && github.ref == 'refs/heads/main'
        run: |
          mkdir -p .code-review
          cp review-results.json .code-review/baseline.json
          git config --local user.email "action@github.com"
          git config --local user.name "GitHub Action"
          git add .code-review/baseline.json
          git commit -m "chore: update code review baseline [skip ci]" || exit 0
          git push
```

### Continuous Quality Monitoring

#### Weekly Quality Reports
```bash
#!/bin/bash
# weekly-quality-report.sh

echo "📊 Generating Weekly Code Quality Report..."

# Run comprehensive review
npx claude-power code-review \
  --formato=report \
  --profundidad=comprehensive \
  --contexto=enterprise \
  --output=html > weekly-report.html

# Generate metrics comparison
npx claude-power code-review \
  --formato=json \
  --baseline=./reports/previous-week.json \
  --output=json > current-week.json

# Send to stakeholders
python3 scripts/send-quality-report.py \
  --html=weekly-report.html \
  --json=current-week.json \
  --recipients=engineering-leads@company.com

# Archive results
mkdir -p ./reports/$(date +%Y-%m-%d)
cp weekly-report.html ./reports/$(date +%Y-%m-%d)/
cp current-week.json ./reports/previous-week.json

echo "✅ Weekly quality report generated and sent"
```

### Technical Debt Management

#### Debt Tracking Dashboard
```javascript
// debt-tracker.js
const fs = require('fs');
const path = require('path');

class TechnicalDebtTracker {
  constructor() {
    this.debtItems = [];
    this.trends = [];
  }
  
  async analyzeProject() {
    const reviewResults = await this.runCodeReview();
    
    const debt = {
      complexity: this.extractComplexityDebt(reviewResults),
      architecture: this.extractArchitecturalDebt(reviewResults),
      security: this.extractSecurityDebt(reviewResults),
      testing: this.extractTestingDebt(reviewResults),
      documentation: this.extractDocumentationDebt(reviewResults)
    };
    
    this.calculateDebtCost(debt);
    this.generateActionPlan(debt);
    
    return debt;
  }
  
  calculateDebtCost(debt) {
    // Estimate cost in developer hours
    const costFactors = {
      complexity: 2.5,     // hours per complexity point
      architecture: 8,     // hours per architectural issue
      security: 12,        // hours per security issue
      testing: 1.5,        // hours per missing test
      documentation: 0.5   // hours per doc issue
    };
    
    debt.estimatedCost = Object.entries(debt).reduce((total, [type, issues]) => {
      if (Array.isArray(issues)) {
        return total + (issues.length * costFactors[type]);
      }
      return total;
    }, 0);
    
    debt.businessImpact = this.calculateBusinessImpact(debt);
  }
  
  generateActionPlan(debt) {
    const plan = {
      immediate: [],  // < 1 sprint
      shortTerm: [],  // 1-3 sprints  
      longTerm: []    // > 3 sprints
    };
    
    // Prioritize by business impact and cost
    debt.security.forEach(issue => plan.immediate.push(issue));
    debt.complexity.filter(i => i.severity === 'critical')
                  .forEach(issue => plan.immediate.push(issue));
    
    debt.architecture.forEach(issue => plan.shortTerm.push(issue));
    debt.testing.forEach(issue => plan.shortTerm.push(issue));
    
    debt.documentation.forEach(issue => plan.longTerm.push(issue));
    
    return plan;
  }
}
```

## 📈 Métricas y KPIs Avanzados

### Dashboard de Calidad

```
📊 EXECUTIVE DASHBOARD - CODE QUALITY METRICS
=============================================

🎯 OVERALL HEALTH SCORE: 8.2/10 (Target: 8.5)

📈 TREND ANALYSIS (Last 6 months):
┌─────────────────┬─────────┬─────────┬─────────┬─────────┐
│ Metric          │ Q1 2024 │ Q2 2024 │ Q3 2024 │ Target  │
├─────────────────┼─────────┼─────────┼─────────┼─────────┤
│ Quality Score   │  7.8    │  8.1    │  8.2    │  8.5    │
│ Security Score  │  7.2    │  7.5    │  7.8    │  8.0    │
│ Test Coverage   │  82%    │  85%    │  87%    │  90%    │
│ Tech Debt Hours │  340h   │  290h   │  250h   │  200h   │
│ Bug Density     │ 2.1/KLOCᴀ2.0/KLOC│ 1.8/KLOC│ 1.5/KLOC│
│ Cycle Time      │ 3.2 days│ 2.8 days│ 2.5 days│ 2.0 days│
└─────────────────┴─────────┴─────────┴─────────┴─────────┘

💰 BUSINESS IMPACT:
• Technical Debt Cost: $125K (↓15% from Q2)
• Velocity Impact: +12% (due to quality improvements)
• Bug-related Downtime: 0.02% (↓50% from Q2)
• Developer Satisfaction: 8.1/10 (↑0.3 from Q2)

🏆 ACHIEVEMENTS:
• Zero critical security vulnerabilities (6 months)
• 15% reduction in technical debt
• 25% faster code review cycles
• 40% fewer production bugs
```

### ROI de Calidad de Código

```
💼 CODE QUALITY ROI ANALYSIS
============================

📊 Investment vs Returns (Yearly):
┌─────────────────────────┬──────────────┬──────────────┐
│ Investment Category     │ Cost         │ ROI          │
├─────────────────────────┼──────────────┼──────────────┤
│ Code Review Tools       │ $25K         │ 400%         │
│ Training & Education    │ $45K         │ 320%         │
│ Refactoring Time        │ $120K        │ 280%         │
│ Testing Infrastructure  │ $80K         │ 350%         │
│ Documentation Effort    │ $30K         │ 180%         │
├─────────────────────────┼──────────────┼──────────────┤
│ TOTAL INVESTMENT        │ $300K        │ 310%         │
└─────────────────────────┴──────────────┴──────────────┘

💡 COST AVOIDANCE:
• Bug Prevention: $450K saved
• Faster Development: $380K saved  
• Reduced Support: $280K saved
• Improved Retention: $320K saved
• Security Incidents: $150K saved

📈 PRODUCTIVITY GAINS:
• 35% faster feature development
• 60% reduction in debug time
• 45% fewer rollbacks
• 25% improvement in team velocity
```

---

*Herramienta del ecosistema **Claude Power** - Eleva la excelencia de tu código con IA* 🚀 