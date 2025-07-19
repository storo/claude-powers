# Generate Tests - Guía de Usuario

## Descripción

El comando `/generate-tests` de Claude Power automatiza completamente la generación de tests, permitiendo obtener una cobertura de tests del 90%+ con casos edge comprehensivos en minutos en lugar de horas.

## ¿Por qué usar Generate Tests?

### 🚀 **Beneficios Inmediatos**
- **Ahorra 70% del tiempo** en escritura de tests
- **Identifica casos edge** que los humanos suelen olvidar  
- **Mejora cobertura** automáticamente hasta 95%+
- **Tests mantenibles** con naming claro y estructura lógica
- **Multiple frameworks** soportados out-of-the-box

### 💡 **Casos de Uso Perfectos**
- Proyectos nuevos que necesitan test suite completo
- Legacy code que carece de tests
- Componentes complejos con muchos casos edge
- APIs que requieren testing exhaustivo
- Aplicaciones que necesitan compliance con coverage

## Instalación Rápida

```bash
# Instalar Claude Power (si no lo tienes)
npm install -g claude-power

# Verificar instalación
claude-power --version

# Ejecutar en tu proyecto
cd mi-proyecto
claude-power generate-tests
```

## Uso Básico

### Comando Más Simple
```bash
/generate-tests
```
Analiza todo el proyecto y genera tests faltantes con configuración por defecto.

### Comando para Archivo Específico
```bash
/generate-tests src/components/UserProfile.tsx
```
Genera tests completos solo para ese archivo.

### Comando con Cobertura Objetivo
```bash
/generate-tests --coverage=95%
```
Genera tests hasta alcanzar 95% de cobertura.

## Ejemplos Prácticos

### 1. **Componente React Nuevo**
```bash
# Generar tests para componente recién creado
/generate-tests src/components/ProductCard.tsx --framework=jest

# Resultado: 
# - src/components/__tests__/ProductCard.test.tsx
# - 24 unit tests generados
# - 8 casos edge incluidos
# - 96% cobertura alcanzada
```

### 2. **API Backend Completa**
```bash
# Generar tests de integration para API
/generate-tests api/ --tipo=integration --mocks=auto

# Resultado:
# - Tests para todos los endpoints
# - Mocks automáticos de DB
# - Casos de error manejados
# - Validación de schemas
```

### 3. **E2E para Flow Crítico**
```bash
# Generar E2E tests para checkout
/generate-tests --tipo=e2e --framework=playwright --edge-cases=comprehensive

# Resultado:
# - Tests de flujo completo
# - Casos de error de payment
# - Tests de diferentes browsers
# - Screenshots automáticos
```

## Configuración Avanzada

### Archivo de Configuración
Crea `.claude/generate-tests-config.json` para personalizar:

```json
{
  "defaultFramework": "jest",
  "defaultCoverage": 90,
  "testTypes": {
    "unit": {
      "enabled": true,
      "edgeCases": "comprehensive"
    },
    "integration": {
      "enabled": true,
      "apiMocking": true
    },
    "e2e": {
      "enabled": false,
      "framework": "playwright"
    }
  }
}
```

### Configuración por Proyecto
```bash
# React con TypeScript
/generate-tests --framework=jest --patterns=bdd --typescript=true

# Vue con Vitest  
/generate-tests --framework=vitest --coverage=95% --mocks=auto

# Node.js API
/generate-tests api/ --tipo=integration --database=in-memory
```

## Frameworks Soportados

### Frontend
- **Jest** + React Testing Library (React)
- **Vitest** (Vue, Svelte)  
- **Cypress** (E2E)
- **Playwright** (E2E moderno)

### Backend
- **Jest** (Node.js)
- **Mocha** + Chai (Node.js clásico)
- **PyTest** (Python)
- **RSpec** (Ruby)

### Mobile
- **Detox** (React Native)
- **Espresso** (Android)
- **XCTest** (iOS)

## Ejemplos de Output

### Tests Generados para React Component
```javascript
// Auto-generado para UserProfile.tsx
describe('UserProfile Component', () => {
  const mockUser = {
    id: '123',
    name: 'Juan Pérez',
    email: 'juan@ejemplo.com'
  };

  describe('Rendering', () => {
    it('should render user name correctly', () => {
      render(<UserProfile user={mockUser} />);
      expect(screen.getByText('Juan Pérez')).toBeInTheDocument();
    });

    it('should render user email correctly', () => {
      render(<UserProfile user={mockUser} />);
      expect(screen.getByText('juan@ejemplo.com')).toBeInTheDocument();
    });
  });

  describe('Edge Cases', () => {
    it('should handle missing user gracefully', () => {
      render(<UserProfile user={null} />);
      expect(screen.getByText('Usuario no encontrado')).toBeInTheDocument();
    });

    it('should handle extremely long names', () => {
      const userWithLongName = { 
        ...mockUser, 
        name: 'A'.repeat(100) 
      };
      render(<UserProfile user={userWithLongName} />);
      expect(screen.getByText(/A{50}\.\.\.$/)).toBeInTheDocument();
    });
  });

  describe('Accessibility', () => {
    it('should have proper ARIA labels', () => {
      render(<UserProfile user={mockUser} />);
      expect(screen.getByRole('img')).toHaveAttribute('alt', 'Avatar de Juan Pérez');
    });
  });
});
```

### Tests de API Generados
```javascript
// Auto-generado para user.controller.js
describe('User Controller Integration', () => {
  let app;
  let mockDB;

  beforeEach(async () => {
    mockDB = await setupInMemoryDB();
    app = createTestApp({ database: mockDB });
  });

  describe('POST /users', () => {
    it('should create user with valid data', async () => {
      const userData = {
        name: 'Juan Pérez',
        email: 'juan@ejemplo.com',
        password: 'SecurePass123!'
      };

      const response = await request(app)
        .post('/users')
        .send(userData)
        .expect(201);

      expect(response.body).toMatchObject({
        name: 'Juan Pérez',
        email: 'juan@ejemplo.com'
      });
      expect(response.body.password).toBeUndefined();
    });

    it('should reject invalid email format', async () => {
      const invalidData = {
        name: 'Juan Pérez',
        email: 'email-invalido',
        password: 'SecurePass123!'
      };

      await request(app)
        .post('/users')
        .send(invalidData)
        .expect(400);
    });

    it('should handle database connection errors gracefully', async () => {
      await mockDB.disconnect();

      await request(app)
        .post('/users')
        .send({ name: 'Test', email: 'test@test.com', password: 'pass' })
        .expect(503);
    });
  });
});
```

## Métricas y Reportes

### Reporte de Cobertura
```bash
📊 COBERTURA GENERADA:
• Statements: 94.2%
• Branches: 91.8%  
• Functions: 100%
• Lines: 93.6%

🧪 TESTS CREADOS:
• Unit tests: 156
• Integration tests: 23
• E2E tests: 8
• Total: 187 tests

⏱️ TIEMPO AHORRADO:
• Estimado manual: 15.6 horas
• Tiempo con Claude Power: 12 minutos
• Ahorro: 98.7%
```

### Dashboard de Calidad
El comando genera un dashboard HTML con:
- Cobertura por archivo
- Casos edge detectados
- Complejidad de tests
- Sugerencias de mejora
- Comparación antes/después

## Integración con CI/CD

### GitHub Actions
```yaml
name: Auto Generate Tests

on:
  push:
    branches: [main, develop]

jobs:
  generate-tests:
    runs-on: ubuntu-latest
    
    steps:
      - uses: actions/checkout@v3
      
      - name: Generate missing tests
        run: |
          npx claude-power generate-tests \
            --coverage=90% \
            --auto-commit
            
      - name: Run generated tests
        run: npm test -- --coverage
        
      - name: Upload coverage
        uses: codecov/codecov-action@v3
```

### Pre-commit Hook
```bash
#!/bin/sh
# .git/hooks/pre-commit

echo "🧪 Checking test coverage..."

# Generate tests for new files
npx claude-power generate-tests --new-files-only --coverage=85%

# Run tests
npm test -- --coverage --passWithNoTests

if [ $? -eq 0 ]; then
  echo "✅ Tests passed, commit proceeding"
else
  echo "❌ Tests failed, check generated tests"
  exit 1
fi
```

## Casos de Uso Avanzados

### 1. **Migration de Testing Framework**
```bash
# Migrar de Jest a Vitest
/generate-tests --migrate-from=jest --migrate-to=vitest

# Resultado: Convierte todos los tests existentes
```

### 2. **Testing de Performance**
```bash
# Incluir performance tests
/generate-tests --performance=true --budgets=strict

# Genera tests que verifican:
# - Tiempo de render < 16ms
# - Bundle size < 250KB  
# - Memory usage < 50MB
```

### 3. **Accessibility Testing**
```bash
# Tests de accesibilidad WCAG 2.1
/generate-tests --accessibility=AA --standards=wcag2.1

# Verifica:
# - ARIA labels correctos
# - Contraste de colores
# - Navegación por teclado
# - Screen reader compatibility
```

## Troubleshooting

### Problemas Comunes

**Error: "Framework not found"**
```bash
# Instalar dependencias necesarias
npm install --save-dev @testing-library/react @testing-library/jest-dom

# Luego re-ejecutar
/generate-tests --framework=jest
```

**Tests generados fallan**
```bash
# Ejecutar en modo debug
/generate-tests --debug --dry-run

# Ver qué tests se generarían sin crearlos
```

**Cobertura no alcanza objetivo**
```bash
# Generar con más casos edge
/generate-tests --edge-cases=paranoid --coverage=95%

# Incluir tests de integration
/generate-tests --tipo=unit,integration --coverage=90%
```

### Logs y Debug
```bash
# Ver logs detallados
/generate-tests --verbose

# Exportar reporte completo
/generate-tests --output=json > test-generation-report.json

# Ver qué archivos se procesarían
/generate-tests --dry-run --list-files
```

## Best Practices

### 1. **Configuración Inicial**
- Empieza con cobertura 80% y aumenta gradualmente
- Habilita solo unit tests inicialmente
- Configura tu framework antes de generar tests masivos

### 2. **Mantenimiento**
- Ejecuta `/generate-tests` después de crear nuevos archivos
- Revisa y ajusta tests generados para casos específicos
- Mantén el archivo de configuración actualizado

### 3. **Team Collaboration**
- Commitea la configuración de Claude Power al repo
- Documenta casos edge específicos del dominio
- Establece coverage targets por tipo de archivo

### 4. **Performance**
- Usa `--incremental` para proyectos grandes
- Genera tests por módulos en lugar de todo el proyecto
- Configura exclusiones para archivos que no necesitan tests

## FAQ

**¿Puede generar tests para código legacy?**
Sí, funciona especialmente bien con código legacy porque identifica casos edge que podrían no estar documentados.

**¿Los tests generados son mantenibles?**
Absolutamente. Están diseñados con naming descriptivo, buena estructura y comentarios explicativos.

**¿Funciona con TypeScript?**
Sí, detecta automáticamente TypeScript y genera tests tipados correctamente.

**¿Puedo personalizar los templates de tests?**
Sí, puedes crear templates personalizados en `.claude/test-templates/`.

**¿Qué pasa con tests existentes?**
Por defecto, no sobreescribe tests existentes. Usa `--force` para sobreescribir.

---

¿Necesitas ayuda? Ejecuta `/generate-tests --help` o visita nuestra [documentación completa](../README.md). 