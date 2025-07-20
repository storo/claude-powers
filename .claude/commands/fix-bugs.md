# Fix Bugs Command

Auto-detecta, analiza y corrige bugs automáticamente usando IA avanzada, reduciendo bugs en producción hasta 90%.

## Descripción

El comando `/fix-bugs` representa el futuro de la corrección de bugs:

- **Detección automática** de bugs comunes y complejos
- **Análisis de root cause** para entender el problema real
- **Corrección inteligente** que preserva funcionalidad
- **Testing automático** de fixes antes de aplicar
- **Learning mode** que aprende de patrones del proyecto
- **Safe mode** con rollback automático si algo falla
- **Explicaciones detalladas** de cada fix aplicado
- **Prevention suggestions** para evitar bugs similares

## Usage

```
/fix-bugs [directory] [--types] [--confidence] [--mode] [--test-after]
```

### Parámetros

- `directory`: directory específico a analizar y corregir
- `--types`: Tipos de bugs a buscar (memory-leaks, null-pointers, race-conditions, etc.)
- `--confidence`: Nivel de confianza mínimo para aplicar fixes (low, medium, high)
- `--mode`: Modo de operación (safe, aggressive, learning, preview)
- `--test-after`: Ejecutar tests después de cada fix
- `--rollback-on-fail`: Rollback automático si tests fallan
- `--explain`: Explicar cada fix realizado
- `--prevent`: Sugerir cambios para prevenir bugs similares

### Examples

```
/fix-bugs
/fix-bugs src/ --types=memory-leaks,null-pointers --confidence=high
/fix-bugs --mode=safe --test-after --rollback-on-fail
/fix-bugs utils/ --mode=learning --explain
/fix-bugs --types=race-conditions --confidence=medium --prevent
/fix-bugs components/ --mode=preview --dry-run
```

## Tipos de Bugs Detectados y Corregidos

### 🚨 Memory Leaks
```javascript
// ❌ ANTES - Memory leak detectado
function DataProcessor() {
  const data = [];
  
  useEffect(() => {
    const interval = setInterval(() => {
      fetchData().then(newData => {
        data.push(...newData); // Memory leak: array crece indefinidamente
      });
    }, 1000);
    
    // Missing cleanup
  }, []);
  
  return <div>{data.length} items</div>;
}

// ✅ DESPUÉS - Fix automático aplicado
function DataProcessor() {
  const [data, setData] = useState([]);
  
  useEffect(() => {
    const interval = setInterval(() => {
      fetchData().then(newData => {
        setData(prevData => {
          // Limitar array size para prevenir memory leak
          const combined = [...prevData, ...newData];
          return combined.slice(-1000); // Mantener solo últimos 1000 items
        });
      });
    }, 1000);
    
    // Cleanup automáticamente agregado
    return () => clearInterval(interval);
  }, []);
  
  return <div>{data.length} items</div>;
}
```

### 🎯 Null Pointer Exceptions
```javascript
// ❌ ANTES - Potential null pointer
function UserProfile({ user }) {
  return (
    <div>
      <h1>{user.name}</h1> {/* Crash si user es null */}
      <img src={user.avatar.url} alt="Avatar" /> {/* Double null risk */}
      <p>Joined: {user.createdAt.toLocaleDateString()}</p>
    </div>
  );
}

// ✅ DESPUÉS - Null safety agregada automáticamente
function UserProfile({ user }) {
  // Null check agregado automáticamente
  if (!user) {
    return <div>Loading user...</div>;
  }
  
  return (
    <div>
      <h1>{user.name || 'Anonymous User'}</h1>
      <img 
        src={user.avatar?.url || '/default-avatar.png'} 
        alt="Avatar" 
        onError={(e) => { e.target.src = '/default-avatar.png'; }}
      />
      <p>
        Joined: {user.createdAt ? 
          new Date(user.createdAt).toLocaleDateString() : 
          'Unknown'
        }
      </p>
    </div>
  );
}
```

### ⚡ Race Conditions
```javascript
// ❌ ANTES - Race condition en async operations
async function updateUserData(userId, newData) {
  const user = await fetchUser(userId);
  const updated = { ...user, ...newData };
  
  // Race condition: user podría haber cambiado entre fetch y save
  await saveUser(userId, updated);
}

// ✅ DESPUÉS - Race condition eliminada
async function updateUserData(userId, newData) {
  let retries = 3;
  
  while (retries > 0) {
    try {
      const user = await fetchUser(userId);
      const updated = { ...user, ...newData, version: user.version + 1 };
      
      // Optimistic locking agregado automáticamente
      await saveUserWithVersion(userId, updated, user.version);
      return updated;
    } catch (error) {
      if (error.code === 'VERSION_CONFLICT' && retries > 1) {
        retries--;
        // Exponential backoff agregado
        await new Promise(resolve => setTimeout(resolve, Math.pow(2, 3 - retries) * 100));
        continue;
      }
      throw error;
    }
  }
}
```

### 🔄 Infinite Loops / Recursion
```javascript
// ❌ ANTES - Potential infinite recursion
function calculateFactorial(n) {
  if (n === 0) return 1;
  return n * calculateFactorial(n - 1); // No protection against negative numbers
}

// ✅ DESPUÉS - Safe recursion con guards
function calculateFactorial(n) {
  // Input validation agregada automáticamente
  if (typeof n !== 'number' || !Number.isInteger(n)) {
    throw new Error('Input must be a non-negative integer');
  }
  
  if (n < 0) {
    throw new Error('Factorial is not defined for negative numbers');
  }
  
  // Stack overflow protection
  if (n > 170) {
    throw new Error('Number too large: factorial would exceed JavaScript number limits');
  }
  
  if (n === 0 || n === 1) return 1;
  return n * calculateFactorial(n - 1);
}
```

### 🌐 Async/Await Issues
```javascript
// ❌ ANTES - Unhandled promise rejections
async function processData() {
  const data = await fetchData(); // Unhandled if it throws
  data.forEach(async item => {
    await processItem(item); // Won't wait for completion
  });
  
  console.log('All done!'); // Executes immediately
}

// ✅ DESPUÉS - Proper async handling
async function processData() {
  try {
    const data = await fetchData();
    
    // Promise.all agregado para concurrent processing
    await Promise.all(
      data.map(async item => {
        try {
          return await processItem(item);
        } catch (error) {
          console.error(`Failed to process item ${item.id}:`, error);
          // Continue processing other items
          return null;
        }
      })
    );
    
    console.log('All processing completed!');
  } catch (error) {
    console.error('Failed to fetch data:', error);
    throw new Error(`Data processing failed: ${error.message}`);
  }
}
```

### 🔐 Security Vulnerabilities
```javascript
// ❌ ANTES - XSS vulnerability
function UserComment({ comment }) {
  return (
    <div 
      dangerouslySetInnerHTML={{ __html: comment.text }} // XSS risk
    />
  );
}

// ✅ DESPUÉS - XSS protection agregada
import DOMPurify from 'dompurify';

function UserComment({ comment }) {
  // Sanitización automática agregada
  const sanitizedText = DOMPurify.sanitize(comment.text, {
    ALLOWED_TAGS: ['b', 'i', 'em', 'strong', 'a'],
    ALLOWED_ATTR: ['href'],
    ALLOWED_URI_REGEXP: /^https?:\/\//
  });
  
  return (
    <div 
      dangerouslySetInnerHTML={{ __html: sanitizedText }}
    />
  );
}
```

## Configuración

`.claude/fix-bugs-config.json`:

```json
{
  "confidence": {
    "minimum": "medium",
    "autoApply": "high",
    "requireConfirmation": "low"
  },
  "bugTypes": {
    "memoryLeaks": {
      "enabled": true,
      "priority": "high",
      "patterns": ["event-listeners", "intervals", "observers", "subscriptions"]
    },
    "nullPointers": {
      "enabled": true,
      "priority": "high",
      "addGuards": true,
      "defaultValues": true
    },
    "raceConditions": {
      "enabled": true,
      "priority": "medium",
      "addLocking": true,
      "retryLogic": true
    },
    "infiniteLoops": {
      "enabled": true,
      "priority": "high",
      "maxIterations": 10000,
      "stackProtection": true
    },
    "asyncIssues": {
      "enabled": true,
      "priority": "medium",
      "promiseHandling": true,
      "errorBoundaries": true
    },
    "securityVulns": {
      "enabled": true,
      "priority": "critical",
      "autoSanitize": true,
      "validateInputs": true
    },
    "performanceIssues": {
      "enabled": false,
      "priority": "low",
      "inefficientAlgorithms": true,
      "memoryOptimization": true
    }
  },
  "safety": {
    "backupBeforeFix": true,
    "runTestsAfterFix": true,
    "rollbackOnTestFail": true,
    "maxFilesPerRun": 10,
    "requireUserConfirmation": false
  },
  "learning": {
    "enabled": true,
    "storePatterns": true,
    "adaptToProject": true,
    "suggestPreventions": true
  },
  "testing": {
    "generateTestsForFixes": true,
    "runExistingTests": true,
    "performanceRegression": true,
    "securityRegression": true
  }
}
```

## Salida del Comando

### Análisis de Bugs
```
🔧 CLAUDE POWER - BUG DETECTION & FIXING
========================================

🔍 ANÁLISIS COMPLETADO:
files escaneados: 127
Líneas analizadas: 15,847
Tiempo de análisis: 23.4s

🚨 BUGS DETECTADOS:
┌─────────────────────┬─────────┬─────────────┬─────────────┐
│ Tipo                │ Count   │ Severidad   │ Fixable     │
├─────────────────────┼─────────┼─────────────┼─────────────┤
│ Memory Leaks        │    8    │ Alta        │     8       │
│ Null Pointers       │   15    │ Alta        │    15       │
│ Race Conditions     │    3    │ Media       │     3       │
│ Infinite Loops      │    2    │ Alta        │     2       │
│ Async Issues        │   12    │ Media       │    11       │
│ Security Vulns      │    4    │ Crítica     │     4       │
│ Performance Issues  │    7    │ Baja        │     5       │
└─────────────────────┴─────────┴─────────────┴─────────────┘

🎯 CONFIDENCE LEVELS:
• High Confidence: 32 bugs (auto-fix available)
• Medium Confidence: 15 bugs (review recommended)
• Low Confidence: 3 bugs (manual review required)

⚡ TOTAL IMPACT:
• Critical bugs that could crash app: 19
• Security vulnerabilities: 4
• Performance degradations: 7
• Maintainability issues: 20
```

### Fixes Aplicados
```
🔧 FIXES APLICADOS AUTOMÁTICAMENTE:
==================================

📁 src/components/UserDashboard.tsx
  🚨 [CRITICAL] Memory leak en useEffect (línea 45)
    ✅ Fixed: Agregado cleanup en return statement
    ✅ Tested: Unit tests pasando
    💡 Prevention: Usar custom hook useInterval para intervals

📁 src/utils/dataProcessor.js  
  🎯 [HIGH] Null pointer en processUserData (línea 78)
    ✅ Fixed: Agregadas null guards y valores default
    ✅ Tested: Integration tests pasando
    💡 Prevention: Usar TypeScript para null safety

📁 src/services/ApiService.js
  ⚡ [MEDIUM] Race condition en updateUser (línea 134)
    ✅ Fixed: Implementado optimistic locking
    ✅ Tested: Race condition tests agregados
    💡 Prevention: Implementar state management con Redux Toolkit

📁 src/hooks/useAuth.ts
  🔐 [CRITICAL] XSS vulnerability en user input (línea 23)
    ✅ Fixed: Agregada sanitización con DOMPurify
    ✅ Tested: Security tests agregados
    💡 Prevention: Validación de input en backend también

🧪 TESTING RESULTADOS:
• Tests ejecutados: 247
• Tests pasando: 247 (100%)
• Nueva cobertura: 94.2% (+3.1%)
• Tiempo de ejecución: 12.3s
• Performance regression: Ninguna detectada

📊 MÉTRICAS POST-FIX:
• Bugs críticos eliminados: 19 → 0 (100% reducción)
• Vulnerabilidades de seguridad: 4 → 0 (100% reducción)
• Warnings estáticos: 87 → 23 (73% reducción)
• Complejidad ciclomática promedium: 8.2 → 6.4 (22% mejora)

💡 PREVENCIÓN SUGERIDA:
1. Configurar ESLint rules para memory leaks
2. Implementar TypeScript strict mode
3. Agregar pre-commit hooks para security scanning
4. Setup automated dependency vulnerability scanning
5. Implementar error boundaries en React components
```

### Learning Mode Output
```
🧠 CLAUDE POWER - LEARNING MODE INSIGHTS
========================================

📈 PATRONES DETECTADOS EN TU PROYECTO:
• Uso frecuente de useEffect sin cleanup (8 casos)
• Patrón común: fetching data en componentes (12 casos)
• Anti-patrón: null checks inconsistentes (15 casos)
• Memory leak pattern: intervals sin clear (5 casos)

🎯 RECOMENDACIONES PERSONALIZADAS:
1. Crear custom hook useApiData para data fetching
2. Implementar utility function saflyAccess para null safety
3. Setup ESLint rule react-hooks/exhaustive-deps
4. Crear wrapper component para error boundaries

📚 KNOWLEDGE BASE ACTUALIZADA:
• Guardados 23 nuevos patrones de bugs específicos del proyecto
• Actualizada confianza en 12 tipos de fixes
• Aprendidas 8 nuevas estrategias de prevención
• Generadas 15 reglas ESLint personalizadas

🔄 ADAPTACIÓN AUTOMÁTICA:
• Confidence levels ajustados basado en success rate
• Templates de fix actualizados para tu coding style
• Exclusiones automáticas para false positives detectados
• Prioridades rebalanceadas según impacto en tu codebase
```

## Integraciones Avanzadas

### Pre-commit Hook
```bash
#!/bin/sh
# .git/hooks/pre-commit

echo "🔧 Running auto bug detection and fixing..."

# Run bug detection with high confidence auto-fix
npx claude-power fix-bugs \
  --staged-only \
  --confidence=high \
  --test-after \
  --rollback-on-fail

if [ $? -ne 0 ]; then
  echo "❌ Critical bugs detected that require manual review"
  echo "Run 'npx claude-power fix-bugs --mode=preview' to see issues"
  exit 1
fi

echo "✅ No critical bugs detected, commit proceeding"
```

### GitHub Actions
```yaml
name: Auto Bug Fix

on:
  push:
    branches: [develop, feature/*]
  pull_request:
    branches: [main, develop]

jobs:
  auto-fix-bugs:
    runs-on: ubuntu-latest
    
    steps:
      - uses: actions/checkout@v3
        with:
          token: ${{ secrets.GITHUB_TOKEN }}
          
      - name: Setup Node.js
        uses: actions/setup-node@v3
        
      - name: Install dependencies
        run: npm ci
        
      - name: Run auto bug fixes
        run: |
          npx claude-power fix-bugs \
            --confidence=high \
            --test-after \
            --mode=safe \
            --output=json > bug-fixes.json
            
      - name: Commit auto-fixes
        run: |
          if [ -s bug-fixes.json ]; then
            git config --local user.email "action@github.com"
            git config --local user.name "Claude Power Auto-Fix"
            git add .
            git commit -m "fix: auto-fix bugs detected by Claude Power
            
            $(cat bug-fixes.json | jq -r '.fixes[].description' | head -5)
            
            Co-authored-by: Claude Power <claude@anthropic.com>"
            git push
          fi
```

---

*Parte del ecosistema **Claude Power** - Bugs eliminados automáticamente* 🔧🚀 
