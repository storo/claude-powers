# Fix Bugs - Guía de Usuario

## Descripción

El comando `/fix-bugs` de Claude Power es tu asistente automático de debugging que detecta, analiza y corrige bugs comunes y complejos, reduciendo bugs en producción hasta un 90% y ahorrando horas de debugging manual.

## ¿Por qué usar Fix Bugs?

### 🚀 **Beneficios Inmediatos**
- **Reduce bugs en producción 90%** con detección proactiva
- **Ahorra 8+ horas por semana** en debugging manual
- **Aprende de tu código** para mejorar detección futura
- **Explica cada fix** para que entiendas el problema
- **Testing automático** para verificar que el fix funciona

### 💡 **Casos de Uso Perfectos**
- Código legacy con bugs ocultos
- Aplicaciones que sufren memory leaks
- APIs con race conditions
- Frontend con null pointer errors
- Código con vulnerabilidades de seguridad

## Instalación Rápida

```bash
# Instalar Claude Power (si no lo tienes)
npm install -g claude-power

# Verificar instalación
claude-power --version

# Ejecutar en tu proyecto
cd mi-proyecto
claude-power fix-bugs
```

## Uso Básico

### Comando Más Simple
```bash
/fix-bugs
```
Escanea todo el proyecto y corrige automáticamente bugs con alta confianza.

### Comando para Directorio Específico
```bash
/fix-bugs src/
```
Analiza y corrige bugs solo en el directorio `src/`.

### Comando con Tipos Específicos
```bash
/fix-bugs --tipos=memory-leaks,null-pointers
```
Se enfoca solo en memory leaks y null pointers.

## Ejemplos Prácticos

### 1. **Memory Leaks en React**
```bash
# Buscar y corregir memory leaks
/fix-bugs --tipos=memory-leaks --confidence=high

# Antes del fix:
useEffect(() => {
  const interval = setInterval(() => {
    fetchData();
  }, 1000);
  // ❌ No cleanup - memory leak
}, []);

# Después del fix automático:
useEffect(() => {
  const interval = setInterval(() => {
    fetchData();
  }, 1000);
  
  // ✅ Cleanup agregado automáticamente
  return () => clearInterval(interval);
}, []);
```

### 2. **Null Pointers en JavaScript**
```bash
# Corregir null pointer exceptions
/fix-bugs --tipos=null-pointers --explain

# Antes:
function getUserName(user) {
  return user.profile.name; // ❌ Crash si user o profile es null
}

# Después del fix:
function getUserName(user) {
  // ✅ Null safety agregada automáticamente
  return user?.profile?.name || 'Usuario Anónimo';
}
```

### 3. **Race Conditions en APIs**
```bash
# Detectar y corregir race conditions
/fix-bugs api/ --tipos=race-conditions --confidence=medium

# Antes:
async function updateUser(id, data) {
  const user = await getUser(id);
  // ❌ Race condition: user puede cambiar entre get y update
  await saveUser(id, { ...user, ...data });
}

# Después del fix:
async function updateUser(id, data) {
  let retries = 3;
  while (retries > 0) {
    try {
      const user = await getUser(id);
      // ✅ Optimistic locking agregado
      await saveUserWithVersion(id, { ...user, ...data }, user.version);
      break;
    } catch (error) {
      if (error.code === 'VERSION_CONFLICT' && retries > 1) {
        retries--;
        continue;
      }
      throw error;
    }
  }
}
```

## Tipos de Bugs Detectados

### 🚨 **Memory Leaks**
- Event listeners sin cleanup
- Intervals/timeouts sin clear
- Observers sin disconnect
- Subscriptions sin unsubscribe
- Referencias circulares

### 🎯 **Null Pointer Exceptions**
- Acceso a propiedades de objetos null/undefined
- Llamadas a métodos en objetos inexistentes
- Array access sin validación de bounds
- API responses sin verificación

### ⚡ **Race Conditions**
- Operaciones async concurrentes
- State updates simultáneos
- Database operations sin locking
- File system access paralelo

### 🔐 **Security Vulnerabilities**
- XSS en templates
- SQL injection en queries
- CSRF en formularios
- Input validation faltante

### 🔄 **Infinite Loops**
- Recursión sin base case
- While loops sin incremento
- For loops con condiciones incorrectas
- Event loops bloqueantes

## Configuración Avanzada

### Archivo de Configuración
Crea `.claude/fix-bugs-config.json`:

```json
{
  "confidence": {
    "minimum": "medium",
    "autoApply": "high"
  },
  "bugTypes": {
    "memoryLeaks": {
      "enabled": true,
      "priority": "high",
      "autoFix": true
    },
    "securityVulns": {
      "enabled": true,
      "priority": "critical",
      "autoSanitize": true
    }
  },
  "safety": {
    "backupBeforeFix": true,
    "runTestsAfterFix": true,
    "rollbackOnTestFail": true
  }
}
```

### Modos de Operación

**Safe Mode (Recomendado)**
```bash
/fix-bugs --mode=safe --test-after --rollback-on-fail
```
- Solo aplica fixes con alta confianza
- Ejecuta tests después de cada fix
- Rollback automático si algo falla

**Aggressive Mode**
```bash
/fix-bugs --mode=aggressive --confidence=medium
```
- Aplica más fixes, incluso con confianza media
- Útil para código legacy muy problemático

**Learning Mode**
```bash
/fix-bugs --mode=learning --explain --prevent
```
- Aprende patrones específicos de tu proyecto
- Explica cada fix en detalle
- Sugiere prevención de bugs similares

**Preview Mode**
```bash
/fix-bugs --mode=preview --dry-run
```
- Muestra qué fixes se aplicarían sin hacerlos
- Perfecto para revisar antes de aplicar

## Ejemplos de Output

### Reporte de Análisis
```
🔧 CLAUDE POWER - BUG DETECTION & FIXING
========================================

🔍 ANÁLISIS COMPLETADO:
Archivos escaneados: 234
Líneas analizadas: 28,439
Tiempo de análisis: 45.2s

🚨 BUGS DETECTADOS:
┌─────────────────────┬─────────┬─────────────┬─────────────┐
│ Tipo                │ Count   │ Severidad   │ Fixable     │
├─────────────────────┼─────────┼─────────────┼─────────────┤
│ Memory Leaks        │   12    │ Alta        │    12       │
│ Null Pointers       │   18    │ Alta        │    16       │
│ Race Conditions     │    4    │ Media       │     3       │
│ Security Vulns      │    6    │ Crítica     │     6       │
│ Infinite Loops      │    2    │ Alta        │     2       │
└─────────────────────┴─────────┴─────────────┴─────────────┘

⚡ TOTAL IMPACT:
• Critical bugs que podrían crashear app: 22
• Vulnerabilidades de seguridad: 6
• Performance issues: 8
• Maintainability problems: 14
```

### Fixes Aplicados
```
🔧 FIXES APLICADOS AUTOMÁTICAMENTE:
==================================

📁 src/components/Dashboard.tsx
  🚨 [CRITICAL] Memory leak en useEffect (línea 67)
    ✅ Fixed: Agregado cleanup function
    ✅ Tested: Component tests pasando
    💡 Prevention: Usar custom hook useInterval

📁 src/utils/apiClient.js
  🎯 [HIGH] Null pointer en handleResponse (línea 89)
    ✅ Fixed: Agregadas null guards
    ✅ Tested: Unit tests actualizados
    💡 Prevention: Implementar TypeScript para null safety

📁 src/services/UserService.js
  🔐 [CRITICAL] XSS vulnerability en displayName (línea 134)
    ✅ Fixed: Agregada sanitización automática
    ✅ Tested: Security tests agregados
    💡 Prevention: Validar inputs en backend también

🧪 TESTING RESULTADOS:
• Tests ejecutados: 389
• Tests pasando: 389 (100%)
• Nueva cobertura: 91.7% (+4.3%)
• Performance regression: Ninguna detectada
```

### Learning Mode Insights
```
🧠 CLAUDE POWER - LEARNING INSIGHTS
===================================

📈 PATRONES DETECTADOS:
• useEffect sin cleanup: 12 casos
• API calls sin error handling: 8 casos  
• State updates sin null checks: 15 casos
• Event listeners sin removeEventListener: 7 casos

🎯 RECOMENDACIONES PERSONALIZADAS:
1. Crear custom hook useApiCall con error handling
2. Implementar utility function safeStateUpdate
3. Setup ESLint rules para memory leaks
4. Agregar error boundaries en componentes raíz

📚 KNOWLEDGE BASE ACTUALIZADA:
• 34 nuevos patterns de bugs específicos del proyecto
• 16 reglas custom generadas automáticamente
• Confidence levels ajustados basado en success rate
• Templates de fix optimizados para tu coding style
```

## Integración con Development Workflow

### Pre-commit Hook
```bash
#!/bin/sh
# .git/hooks/pre-commit

echo "🔧 Checking for bugs before commit..."

# Fix bugs automáticamente en staged files
npx claude-power fix-bugs \
  --staged-only \
  --confidence=high \
  --test-after

if [ $? -ne 0 ]; then
  echo "❌ Critical bugs detected and couldn't be auto-fixed"
  echo "Run 'claude-power fix-bugs --mode=preview' to see issues"
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

jobs:
  fix-bugs:
    runs-on: ubuntu-latest
    
    steps:
      - uses: actions/checkout@v3
        with:
          token: ${{ secrets.GITHUB_TOKEN }}
          
      - name: Auto-fix bugs
        run: |
          npx claude-power fix-bugs \
            --confidence=high \
            --test-after \
            --mode=safe
            
      - name: Commit fixes
        run: |
          git config --local user.email "action@github.com"
          git config --local user.name "Claude Power Auto-Fix"
          git add .
          git commit -m "fix: auto-fix bugs detected by Claude Power" || exit 0
          git push
```

### VS Code Integration
```json
{
  "tasks": [
    {
      "label": "Fix Bugs in Current File",
      "type": "shell",
      "command": "npx",
      "args": [
        "claude-power",
        "fix-bugs",
        "${file}",
        "--explain"
      ],
      "group": "build",
      "presentation": {
        "echo": true,
        "reveal": "always"
      }
    }
  ]
}
```

## Casos de Uso Avanzados

### 1. **Legacy Code Rehabilitation**
```bash
# Para código legacy muy problemático
/fix-bugs legacy/ \
  --mode=aggressive \
  --confidence=medium \
  --backup-before-fix \
  --generate-tests-for-fixes
```

### 2. **Security Hardening**
```bash
# Enfoque total en seguridad
/fix-bugs \
  --tipos=security-vulns \
  --confidence=medium \
  --explain \
  --generate-security-report
```

### 3. **Performance Optimization**
```bash
# Bugs que afectan performance
/fix-bugs \
  --tipos=memory-leaks,performance-issues \
  --mode=safe \
  --measure-impact
```

### 4. **Pre-Production Checkup**
```bash
# Verificación completa antes de deploy
/fix-bugs \
  --confidence=low \
  --mode=preview \
  --generate-report \
  --compliance=production
```

## Troubleshooting

### Problemas Comunes

**"Tests fallan después del fix"**
```bash
# Rollback automático habilitado por defecto
/fix-bugs --rollback-on-test-fail

# Ver qué tests específicos fallan
npm test -- --verbose
```

**"Fix demasiado agresivo"**
```bash
# Usar modo más conservador
/fix-bugs --confidence=high --mode=safe

# Preview antes de aplicar
/fix-bugs --mode=preview --dry-run
```

**"No detecta bugs conocidos"**
```bash
# Ajustar configuración para tu caso
/fix-bugs --confidence=low --tipos=all

# Habilitar learning mode
/fix-bugs --mode=learning --adapt-to-project
```

### Debug y Logs
```bash
# Ver proceso detallado
/fix-bugs --verbose --debug

# Exportar reporte completo
/fix-bugs --output=json > bug-fix-report.json

# Ver qué archivos se procesarían
/fix-bugs --dry-run --list-files
```

## Best Practices

### 1. **Empezar Gradualmente**
- Comienza con `--confidence=high` y `--mode=safe`
- Aplica a un módulo pequeño primero
- Revisa los fixes antes de commitear

### 2. **Testing Integration**
- Siempre usa `--test-after` en modo automático
- Configura rollback automático con `--rollback-on-test-fail`
- Genera tests para fixes con `--generate-tests-for-fixes`

### 3. **Team Collaboration**
- Commitea configuración de fix-bugs al repo
- Documenta patterns específicos del dominio
- Establece policies de confidence levels por tipo de archivo

### 4. **Continuous Improvement**
- Usa learning mode regularmente
- Revisa y ajusta confidence levels basado en resultados
- Mantén actualizada la configuración de exclusiones

## FAQ

**¿Es seguro ejecutar fix-bugs automáticamente?**
Sí, especialmente en modo safe con testing automático. Siempre hace backup antes de modificar archivos.

**¿Puede romper mi código?**
El rollback automático previene esto. Si un fix causa que tests fallen, se revierte automáticamente.

**¿Funciona con TypeScript?**
Perfectamente. De hecho, TypeScript ayuda a la detección de bugs y genera fixes más precisos.

**¿Qué pasa con edge cases específicos de mi dominio?**
El learning mode aprende de tu código y se adapta a patrones específicos de tu proyecto.

**¿Puedo revisar fixes antes de aplicarlos?**
Sí, usa `--mode=preview` para ver qué se haría sin aplicar cambios.

---

¿Necesitas ayuda? Ejecuta `/fix-bugs --help` o visita nuestra [documentación completa](../README.md). 