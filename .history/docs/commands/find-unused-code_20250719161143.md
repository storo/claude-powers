# Comando /find-unused-code

Detecta y analiza código, variables, funciones, imports y archivos que no se utilizan en tu proyecto para optimización y limpieza.

## 📋 Descripción

El comando `/find-unused-code` es una herramienta avanzada de análisis estático que identifica código sin uso para:

- **Optimizar bundle size**: Reducir el tamaño final de la aplicación
- **Mejorar performance**: Eliminar código que ralentiza la carga
- **Facilitar mantenimiento**: Limpiar código legacy y obsoleto
- **Prevenir confusión**: Remover código que ya no tiene propósito
- **Ahorrar espacio**: Liberar espacio en el repositorio

## 🎯 Análisis Completo

### Categorías de Detección

#### 🔢 Variables No Utilizadas
```javascript
// ❌ DETECTADO: Variable declarada sin uso
const unusedVariable = computeExpensiveValue();
const result = otherFunction();

// ❌ DETECTADO: Destructuring parcial
const { used, unused } = getData();
console.log(used); // unused nunca se usa

// ❌ DETECTADO: Parámetros de función
function process(data, unusedParam) {
  return data.map(item => item.value);
}
```

#### ⚙️ Funciones Sin Referencias
```javascript
// ❌ DETECTADO: Función nunca llamada
function calculateDiscount(price, rate) {
  return price * (1 - rate);
}

// ❌ DETECTADO: Arrow function sin uso
const formatCurrency = (amount) => `$${amount.toFixed(2)}`;

// ❌ DETECTADO: Método de clase sin invocar
class Utils {
  static formatDate(date) { // Nunca llamado
    return date.toISOString();
  }
}
```

#### 📦 Imports/Exports Innecesarios
```javascript
// ❌ DETECTADO: Import sin uso
import { useState, useEffect, useCallback } from 'react';
import lodash from 'lodash';
import moment from 'moment';

// Solo useState se usa en el componente
function Component() {
  const [count, setCount] = useState(0);
  return <div>{count}</div>;
}

// ❌ DETECTADO: Export sin referencias externas
export const unusedUtility = () => {};
export default UnusedComponent; // Nunca importado
```

#### 🧩 Componentes React
```jsx
// ❌ DETECTADO: Componente nunca renderizado
function UnusedButton({ onClick, children }) {
  return <button onClick={onClick}>{children}</button>;
}

// ❌ DETECTADO: Hook personalizado sin uso
function useUnusedHook() {
  const [state, setState] = useState(null);
  return [state, setState];
}

// ❌ DETECTADO: Context sin provider/consumer
const UnusedContext = createContext();
```

#### 📁 Archivos Sin Referencias
```
❌ DETECTADO: Archivos completamente sin uso
src/
├── components/
│   ├── OldButton.tsx        ← Sin imports
│   └── DeprecatedModal.tsx  ← Sin referencias
├── utils/
│   ├── legacy.js           ← Archivo obsoleto
│   └── helpers-old.js      ← Version antigua
└── hooks/
    └── useOldApi.ts        ← Hook legacy
```

#### 🎨 CSS/Estilos No Utilizados
```css
/* ❌ DETECTADO: Class no aplicada */
.unused-button-style {
  background: red;
  padding: 10px;
}

/* ❌ DETECTADO: ID sin referencias */
#unique-modal {
  position: fixed;
  top: 50%;
}

/* ❌ DETECTADO: Keyframes no usados */
@keyframes unused-animation {
  from { opacity: 0; }
  to { opacity: 1; }
}

/* ❌ DETECTADO: Variables CSS sin uso */
:root {
  --unused-color: #ff0000;
}
```

#### 📦 Dependencias No Utilizadas
```json
{
  "dependencies": {
    "moment": "^2.29.4",      // ❌ No importado
    "lodash": "^4.17.21",     // ❌ Sin uso real
    "uuid": "^9.0.0"          // ❌ Solo en tests
  },
  "devDependencies": {
    "unused-plugin": "^1.0.0" // ❌ No en configs
  }
}
```

## 🎛️ Parámetros Avanzados

### Sintaxis Completa
```
/find-unused-code [directorio] [opciones]
```

### Opciones Detalladas

| Opción | Valores | Descripción | Ejemplo |
|--------|---------|-------------|---------|
| `--tipos` | `variables,funciones,imports,exports,archivos,css,deps,react` | Categorías específicas a analizar | `--tipos=variables,imports` |
| `--severidad` | `alto,medio,bajo,todos` | Nivel mínimo de impacto | `--severidad=alto` |
| `--incluir` | `test-files,config-files,type-files` | Categorías especiales a incluir | `--incluir=test-files` |
| `--min-size` | `number` | Tamaño mínimo en líneas | `--min-size=10` |
| `--max-items` | `number` | Máximo items por categoría | `--max-items=20` |
| `--output` | `console,json,html,csv` | Formato de salida | `--output=json` |
| `--bundle-impact` | `true,false` | Calcular impacto en bundle | `--bundle-impact=true` |
| `--suggestions` | `true,false` | Mostrar sugerencias de fix | `--suggestions=true` |

### Ejemplos Prácticos

```bash
# Análisis completo del proyecto
/find-unused-code

# Solo variables y funciones en src/
/find-unused-code src/ --tipos=variables,funciones

# Dependencias con alto impacto en bundle
/find-unused-code --tipos=deps --severidad=alto --bundle-impact=true

# Componentes React no utilizados
/find-unused-code components/ --tipos=react --min-size=5

# CSS no utilizado con sugerencias
/find-unused-code styles/ --tipos=css --suggestions=true

# Análisis completo incluyendo archivos de test
/find-unused-code --incluir=test-files --output=json

# Archivos grandes sin referencias
/find-unused-code --tipos=archivos --min-size=50 --severidad=alto

# Imports y exports innecesarios
/find-unused-code src/ --tipos=imports,exports --max-items=50
```

## 📊 Interpretación de Resultados

### Niveles de Severidad

#### 🔴 Alto (Crítico)
- **Archivos** > 50 líneas sin referencias
- **Dependencias** que impactan > 50KB en bundle
- **Funciones** complejas sin uso
- **CSS** con muchas reglas sin aplicar

#### 🟡 Medio (Importante)
- **Archivos** 10-50 líneas sin uso
- **Variables** en múltiples archivos
- **Imports** de librerías grandes
- **Funciones** medianas sin llamadas

#### 🟢 Bajo (Menor)
- **Variables** simples sin uso
- **Imports** pequeños innecesarios
- **CSS** rules individuales
- **Parámetros** de función sin usar

### Métricas de Impacto

```
💾 ANÁLISIS DE IMPACTO:

📦 Bundle Size:
• Reducción estimada: 127KB (-15.3%)
• Archivos eliminables: 8 files
• Dependencies removibles: 3 packages

⚡ Performance:
• Menos JS parsing: ~45ms
• Menos CSS processing: ~12ms
• Reducción de memory usage: ~8MB

🧹 Código:
• Líneas eliminables: 1,247 LOC
• Archivos limpiables: 23 files
• Complejidad reducida: -18%
```

## ⚙️ Configuración Avanzada

### Configuración Completa

```json
{
  "severity": "medio",
  "analysis": {
    "variables": {
      "enabled": true,
      "includeParameters": true,
      "includeDestructuring": true,
      "ignorePattern": "^_"
    },
    "functions": {
      "enabled": true,
      "minComplexity": 2,
      "includeArrowFunctions": true,
      "ignoreMethods": ["constructor", "render"]
    },
    "imports": {
      "enabled": true,
      "includeTypeImports": true,
      "ignoreFrameworks": ["react", "next"],
      "analyzeReExports": true
    },
    "exports": {
      "enabled": true,
      "analyzeEntryPoints": true,
      "ignorePublicAPI": false
    },
    "files": {
      "enabled": true,
      "minSize": 5,
      "analyzeTests": false,
      "includeAssets": false
    },
    "css": {
      "enabled": true,
      "includeVariables": true,
      "analyzeKeyframes": true,
      "checkDynamicClasses": true
    },
    "dependencies": {
      "enabled": true,
      "analyzeBundleImpact": true,
      "includeDevDeps": true,
      "checkScripts": true
    }
  },
  "intelligence": {
    "crossFileAnalysis": true,
    "dynamicImportDetection": true,
    "jsxAnalysis": true,
    "typeScriptSupport": true
  }
}
```

### Patrones de Exclusión

```json
{
  "smartIgnore": {
    "entryPoints": ["index.*", "main.*", "_app.*"],
    "publicAPI": ["export.*public", "API_.*"],
    "frameworkPatterns": [
      "Next.js getStaticProps",
      "React.FC props",
      "Express middleware"
    ],
    "testPatterns": [".*\\.test\\.", ".*\\.spec\\."],
    "configPatterns": [".*\\.config\\.", ".*rc\\."]
  }
}
```

## 🚀 Integración con Workflow

### GitHub Actions
```yaml
name: Code Cleanup Analysis

on:
  pull_request:
    branches: [main, develop]
  
jobs:
  unused-code-check:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v3
      
      - name: Setup Node.js
        uses: actions/setup-node@v3
        with:
          node-version: '18'
          
      - name: Install dependencies
        run: npm ci
        
      - name: Analyze unused code
        run: |
          npx claude-power find-unused-code \
            --output=json \
            --severidad=alto \
            > unused-report.json
            
      - name: Check critical issues
        run: |
          CRITICAL=$(jq '.summary.by_severity.alto' unused-report.json)
          if [ $CRITICAL -gt 0 ]; then
            echo "❌ $CRITICAL critical unused code issues found"
            jq '.issues[] | select(.severity == "alto")' unused-report.json
            exit 1
          fi
          
      - name: Comment PR
        uses: actions/github-script@v6
        with:
          script: |
            const fs = require('fs');
            const report = JSON.parse(fs.readFileSync('unused-report.json'));
            const comment = `
            ## 🧹 Unused Code Analysis
            
            - **Total unused items**: ${report.summary.total}
            - **Bundle impact**: ${report.summary.bundleImpact}KB
            - **Files cleanable**: ${report.summary.files}
            
            ${report.summary.total > 20 ? '⚠️ Consider cleanup before merge' : '✅ Code looks clean!'}
            `;
            github.rest.issues.createComment({
              issue_number: context.issue.number,
              owner: context.repo.owner,
              repo: context.repo.repo,
              body: comment
            });
```

### Pre-commit Hook
```bash
#!/bin/sh
# .git/hooks/pre-commit

echo "🔍 Checking for unused code..."

# Ejecutar análisis de código no usado
UNUSED_OUTPUT=$(npx claude-power find-unused-code \
  --tipos=variables,imports \
  --severidad=alto \
  --output=console 2>&1)

if [ $? -eq 0 ] && [ ! -z "$UNUSED_OUTPUT" ]; then
  echo "⚠️ Unused code detected:"
  echo "$UNUSED_OUTPUT"
  echo ""
  echo "💡 Consider running: /fix-unused --auto"
  echo "   Or: git commit --no-verify to skip this check"
  exit 1
fi

echo "✅ No critical unused code found"
```

### VS Code Configuration
```json
{
  "tasks": [
    {
      "label": "Find Unused Code",
      "type": "shell",
      "command": "npx",
      "args": [
        "claude-power",
        "find-unused-code",
        "${workspaceFolder}",
        "--suggestions=true"
      ],
      "group": "build",
      "presentation": {
        "echo": true,
        "reveal": "always",
        "focus": false,
        "panel": "shared",
        "showReuseMessage": true,
        "clear": false
      },
      "options": {
        "cwd": "${workspaceFolder}"
      }
    },
    {
      "label": "Unused Code - Quick Scan",
      "type": "shell",
      "command": "npx",
      "args": [
        "claude-power", 
        "find-unused-code",
        "${file}",
        "--tipos=variables,imports"
      ],
      "group": "build"
    }
  ],
  "keybindings": [
    {
      "key": "ctrl+shift+u",
      "command": "workbench.action.tasks.runTask",
      "args": "Find Unused Code"
    }
  ]
}
```

## 🎯 Casos de Uso Específicos

### Migración de Librerías
```bash
# Detectar uso de librería antigua antes de migrar
/find-unused-code --tipos=imports --severidad=todos | grep "moment"

# Verificar que toda la librería se puede remover
/find-unused-code --tipos=deps --bundle-impact=true
```

### Limpieza de Features Legacy
```bash
# Encontrar componentes de feature antigua
/find-unused-code src/features/old-feature/ --tipos=archivos,react

# Verificar dependencias específicas de la feature
/find-unused-code --tipos=deps | grep "old-feature-lib"
```

### Optimización de Bundle
```bash
# Identificar imports que más impactan el bundle
/find-unused-code --tipos=imports,deps --bundle-impact=true --severidad=alto

# Analizar CSS no utilizado
/find-unused-code styles/ --tipos=css --min-size=1
```

### Auditoría de Código
```bash
# Análisis completo para auditoría
/find-unused-code --output=html --incluir=test-files,config-files

# Generar reporte para stakeholders
/find-unused-code --output=csv --bundle-impact=true
```

## 📈 Métricas y KPIs

### Métricas de Limpieza
- **Dead Code Ratio**: % de código sin uso vs total
- **Bundle Impact**: KB reducibles del bundle final
- **Maintainability Index**: Mejora en mantenibilidad
- **Complexity Reduction**: Reducción de complejidad ciclomática

### Trending Analysis
```bash
# Comparar con análisis anterior
/find-unused-code --output=json > current-unused.json
diff previous-unused.json current-unused.json

# Establecer baseline para el proyecto
/find-unused-code --output=json > baseline-unused.json
```

---

*Herramienta del ecosistema **Claude Power** - Optimiza tu código con IA* 🚀 