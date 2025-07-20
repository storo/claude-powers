# Find Bugs Command

Searches for common bug patterns and issues in source code.

## Description

The `/find-bugs` command analyzes code looking for common patterns that may indicate bugs or potential issues, including:

- Incorrect null/undefined comparisons
- Mutability issues in arrays/objects
- Potential race conditions
- Memory leaks
- Subtle syntax errors
- Common anti-patterns
- Type issues in TypeScript
- Common logic errors

## Usage

```
/find-bugs [directory] [--types] [--severity]
```

### Parameters

- `directory` (optional): Specific directory to analyze. By default analyzes the entire project.
- `--types`: Specific types of bugs to search for (js, ts, react, node, etc.)
- `--severity`: Severity level (high, medium, low, all)

### Examples

```
/find-bugs
/find-bugs src/components --types=react
/find-bugs backend --severity=high
/find-bugs . --types=ts --severity=medium
```

## Detected Patterns

### JavaScript/TypeScript
- `== null` or `== undefined` (use `===`)
- Undeclared variables or without type
- Async functions without await
- Promises without catch
- Memory leaks in event listeners
- Closures with circular references

### React
- Hooks with missing dependencies
- Direct state mutations
- Duplicate or non-unique keys
- useEffect without cleanup
- Unvalidated props

### Node.js
- Unclosed files
- Streams without error handling
- Process exit without cleanup
- Missing environment variables

### General
- Duplicate code
- Very long functions (>50 lines)
- Potential infinite loops
- Always true/false conditions

## Configuration

The command uses a configuration file `.claude/find-bugs-config.json` to customize rules:

```json
{
  "severity": "medio",
  "rules": {
    "javascript": true,
    "typescript": true,
    "react": true,
    "node": true,
    "performance": true,
    "security": true
  },
  "exclude": [
    "node_modules",
    "dist",
    "build",
    "*.test.js",
    "*.spec.js"
  ],
  "customPatterns": []
}
```

## Salida

El comando genera un reporte detallado con:

1. **Resumen**: Número total de issues encontrados por categoría
2. **Issues por archivo**: Lista detallada con línea y descripción
3. **Sugerencias**: Recomendaciones de fixes automáticos
4. **Métricas**: Estadísticas del código analizado

### Formato de salida

```
🐛 FIND BUGS REPORT
===================

📊 RESUMEN:
- Alto: 3 issues
- Medio: 7 issues  
- Bajo: 12 issues
- Total: 22 issues

🔍 DETALLES:

📁 src/components/UserForm.tsx
  ❌ [ALTO] Línea 23: Comparación con == null (usar ===)
  ⚠️  [MEDIO] Línea 45: Hook useEffect sin dependencies
  💡 [BAJO] Línea 67: Función muy larga (78 líneas)

📁 src/utils/api.js  
  ❌ [ALTO] Línea 12: Promise sin catch
  ⚠️  [MEDIO] Línea 34: Variable no declarada 'response'

🛠️  SUGERENCIAS DE FIX:
- Ejecutar: /fix-bugs --auto para fixes automáticos
- Revisar manually: 3 issues de alta prioridad
``` 