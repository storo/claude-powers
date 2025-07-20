# Find Bugs Command

Busca patrones comunes de bugs y problemas en el código fuente.

## Descripción

El comando `/find-bugs` analiza el código en busca de patrones comunes que pueden indicar bugs o problemas potenciales, incluyendo:

- Comparaciones con null/undefined incorrectas
- Problemas de mutabilidad en arrays/objetos
- Race conditions potenciales
- Memory leaks
- Errores de sintaxis sutiles
- Anti-patrones comunes
- Problemas de tipo en TypeScript
- Errores de lógica común

## Uso

```
/find-bugs [directorio] [--tipos] [--severidad]
```

### Parámetros

- `directorio` (opcional): Directorio específico a analizar. Por defecto analiza todo el proyecto.
- `--tipos`: Tipos específicos de bugs a buscar (js, ts, react, node, etc.)
- `--severidad`: Nivel de severidad (alto, medio, bajo, todos)

### Ejemplos

```
/find-bugs
/find-bugs src/components --tipos=react
/find-bugs backend --severidad=alto
/find-bugs . --tipos=ts --severidad=medio
```

## Patrones Detectados

### JavaScript/TypeScript
- `== null` o `== undefined` (usar `===`)
- Variables no declaradas o sin tipo
- Funciones async sin await
- Promises sin catch
- Memory leaks en event listeners
- Closures con referencias circulares

### React
- Hooks con dependencias faltantes
- State mutations directas
- Keys duplicadas o no únicas
- useEffect sin cleanup
- Props no validadas

### Node.js
- Archivos no cerrados
- Streams sin manejo de errores
- Process exit sin cleanup
- Variables de entorno faltantes

### General
- Código duplicado
- Funciones muy largas (>50 líneas)
- Ciclos infinitos potenciales
- Condiciones siempre true/false

## Configuración

El comando utiliza un archivo de configuración `.claude/find-bugs-config.json` para personalizar las reglas:

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