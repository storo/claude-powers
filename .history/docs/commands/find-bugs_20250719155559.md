# Comando /find-bugs

Detecta automáticamente patrones problemáticos, bugs potenciales y anti-patrones en tu código.

## 📋 Descripción

El comando `/find-bugs` realiza un análisis estático profundo del código para identificar:

- **Bugs de lógica**: Comparaciones incorrectas, condiciones siempre verdaderas/falsas
- **Problemas de rendimiento**: Ciclos ineficientes, memory leaks potenciales
- **Anti-patrones**: Código duplicado, funciones muy largas, alta complejidad
- **Errores de sintaxis sutiles**: Variables no declaradas, imports faltantes
- **Problemas específicos por tecnología**: React hooks, Node.js streams, etc.

## 🎯 Uso

### Sintaxis
```
/find-bugs [directorio] [opciones]
```

### Parámetros

| Parámetro | Tipo | Descripción | Por defecto |
|-----------|------|-------------|-------------|
| `directorio` | string | Directorio o archivo a analizar | `.` (raíz) |
| `--tipos` | string | Tipos de análisis (js,ts,react,node) | todos |
| `--severidad` | string | Nivel mínimo (alto,medio,bajo) | medio |
| `--config` | string | Archivo de configuración personalizado | `.claude/find-bugs-config.json` |
| `--output` | string | Formato de salida (console,json,html) | console |
| `--fix` | boolean | Mostrar sugerencias de fix | false |

### Ejemplos de Uso

```bash
# Análisis completo del proyecto
/find-bugs

# Analizar solo componentes React
/find-bugs src/components --tipos=react

# Buscar solo bugs críticos
/find-bugs --severidad=alto

# Análisis con sugerencias de fix
/find-bugs src/utils --fix

# Exportar reporte en JSON
/find-bugs --output=json > bug-report.json

# Análisis específico de un archivo
/find-bugs src/components/UserForm.tsx --tipos=react,ts
```

## 🔍 Patrones Detectados

### JavaScript/TypeScript

#### Comparaciones Problemáticas
```javascript
// ❌ DETECTADO: Comparación con ==
if (value == null) { }
// ✅ SUGERIDO: Usar ===
if (value === null) { }

// ❌ DETECTADO: Comparación con undefined
if (typeof variable == 'undefined') { }
// ✅ SUGERIDO: Verificación directa
if (variable === undefined) { }
```

#### Problemas de Async/Await
```javascript
// ❌ DETECTADO: Async sin await
async function fetchData() {
    return fetch('/api/data'); // Missing await
}

// ❌ DETECTADO: Promise sin catch
fetch('/api/data').then(response => response.json());
```

#### Memory Leaks Potenciales
```javascript
// ❌ DETECTADO: Event listener sin cleanup
useEffect(() => {
    window.addEventListener('resize', handleResize);
    // Missing cleanup
}, []);

// ❌ DETECTADO: Interval sin clear
setInterval(() => {
    updateData();
}, 1000);
```

### React Específico

#### Hooks Problems
```jsx
// ❌ DETECTADO: useEffect sin dependencies
useEffect(() => {
    fetchUserData(userId);
}); // Missing dependency array

// ❌ DETECTADO: State mutation directa
const [items, setItems] = useState([]);
items.push(newItem); // Direct mutation

// ❌ DETECTADO: Key no única
{items.map((item, index) => 
    <div key={index}>{item.name}</div> // Index as key
)}
```

#### Performance Issues
```jsx
// ❌ DETECTADO: Recreación de objeto en render
function Component({ data }) {
    const config = { theme: 'dark' }; // Recreated each render
    return <Child config={config} />;
}

// ❌ DETECTADO: Function recreación
function Parent() {
    const handleClick = () => doSomething(); // Recreated each render
    return <Child onClick={handleClick} />;
}
```

### Node.js Específico

#### File System Issues
```javascript
// ❌ DETECTADO: Archivo no cerrado
const fs = require('fs');
fs.createReadStream('file.txt'); // Stream not closed

// ❌ DETECTADO: Error no manejado
process.on('uncaughtException', () => {
    // Empty handler
});
```

#### Environment Variables
```javascript
// ❌ DETECTADO: Env var sin default
const port = process.env.PORT; // Should have default

// ❌ DETECTADO: Sensitive data en código
const apiKey = 'abc123'; // Should use env var
```

## ⚙️ Configuración Avanzada

### Archivo de Configuración

Crea o edita `.claude/find-bugs-config.json`:

```json
{
  "severity": "medio",
  "rules": {
    "javascript": {
      "enabled": true,
      "checks": {
        "equalityChecks": true,
        "undeclaredVariables": true,
        "unusedVariables": true,
        "asyncAwait": true,
        "promiseHandling": true
      }
    },
    "typescript": {
      "enabled": true,
      "checks": {
        "typeErrors": true,
        "strictNullChecks": true,
        "noImplicitAny": true
      }
    },
    "react": {
      "enabled": true,
      "checks": {
        "hookDependencies": true,
        "stateMutations": true,
        "keyProps": true,
        "performanceAntiPatterns": true
      }
    },
    "performance": {
      "enabled": true,
      "thresholds": {
        "functionLength": 50,
        "cyclomaticComplexity": 10,
        "nestingDepth": 4
      }
    }
  },
  "exclude": [
    "node_modules/**",
    "dist/**",
    "build/**",
    "**/*.test.{js,ts,jsx,tsx}",
    "**/*.spec.{js,ts,jsx,tsx}"
  ],
  "customPatterns": [
    {
      "pattern": "debugger;",
      "message": "Debugger statement encontrado",
      "severity": "medio",
      "category": "desarrollo"
    }
  ]
}
```

### Patrones Personalizados

Agrega tus propios patrones de detección:

```json
{
  "customPatterns": [
    {
      "pattern": "eval\\(",
      "message": "Uso de eval() detectado - riesgo de seguridad",
      "severity": "alto",
      "category": "security",
      "fix": "Considera alternativas más seguras como JSON.parse()"
    },
    {
      "pattern": "innerHTML\\s*=",
      "message": "Uso de innerHTML puede ser vulnerable a XSS",
      "severity": "medio",
      "category": "security",
      "fix": "Usa textContent o métodos DOM seguros"
    }
  ]
}
```

## 📊 Formato de Salida

### Consola (Defecto)
```
🐛 CLAUDE POWER - FIND BUGS REPORT
==================================

📊 RESUMEN:
┌─────────────┬───────┐
│ Severidad   │ Count │
├─────────────┼───────┤
│ Alto        │   3   │
│ Medio       │   7   │ 
│ Bajo        │  12   │
│ Total       │  22   │
└─────────────┴───────┘

🔍 DETALLES POR ARCHIVO:

📁 src/components/UserForm.tsx (3 issues)
  ❌ [ALTO] Línea 23:12 - Comparación con == null
     > if (user == null) return;
     💡 Fix: Cambiar a if (user === null) return;
  
  ⚠️ [MEDIO] Línea 45:5 - Hook useEffect sin dependencies  
     > useEffect(() => { fetchUser(); });
     💡 Fix: Agregar array de dependencias: [userId]

📁 src/utils/api.js (2 issues)
  ❌ [ALTO] Línea 12:8 - Promise sin catch
     > fetch('/api/users').then(handleResponse);
     💡 Fix: Agregar .catch(handleError)

🛠️ SUGERENCIAS:
• Ejecuta /fix-bugs --auto para aplicar fixes automáticos (15 disponibles)
• Revisa manualmente 3 issues de alta prioridad
• Considera configurar ESLint para prevenir estos patrones

⏱️ Análisis completado en 2.3s - 45 archivos escaneados
```

### JSON Output
```json
{
  "summary": {
    "total": 22,
    "by_severity": {
      "alto": 3,
      "medio": 7,
      "bajo": 12
    },
    "files_scanned": 45,
    "execution_time": "2.3s"
  },
  "issues": [
    {
      "file": "src/components/UserForm.tsx",
      "line": 23,
      "column": 12,
      "severity": "alto",
      "category": "javascript",
      "rule": "equality-check",
      "message": "Comparación con == null",
      "code": "if (user == null) return;",
      "fix": {
        "suggested": "if (user === null) return;",
        "auto_fixable": true
      }
    }
  ]
}
```

## 🚀 Integración con Otros Comandos

```bash
# Pipeline de análisis completo
/find-bugs --output=json | /fix-bugs --input=stdin --auto
/find-bugs --severidad=alto | /generate-tests
/find-bugs src/ --tipos=react | /code-review --focus=bugs
```

## 📈 Métricas y KPIs

El comando reporta métricas útiles:

- **Cobertura**: % de archivos analizados
- **Densidad de bugs**: Issues por 100 líneas de código
- **Distribución por severidad**: Breakdown de tipos de problemas
- **Hotspots**: Archivos con más issues
- **Tendencias**: Comparación con análisis anteriores (si hay historial)

## 🎯 Casos de Uso

### CI/CD Integration
```yaml
# .github/workflows/code-quality.yml
- name: Scan for bugs
  run: |
    npx claude-power find-bugs --output=json --severidad=alto > bugs.json
    if [ $(jq '.summary.by_severity.alto' bugs.json) -gt 0 ]; then
      echo "❌ Critical bugs found!"
      exit 1
    fi
```

### Pre-commit Hook
```bash
#!/bin/sh
# .git/hooks/pre-commit
npx claude-power find-bugs --severidad=alto --output=console
if [ $? -ne 0 ]; then
  echo "❌ Fix critical bugs before committing"
  exit 1
fi
```

### VS Code Integration
```json
{
  "tasks": [
    {
      "label": "Find Bugs",
      "type": "shell", 
      "command": "npx claude-power find-bugs ${file}",
      "group": "build"
    }
  ]
}
```

---

*Parte del ecosistema **Claude Power** - Potenciando el desarrollo con IA* 🚀 