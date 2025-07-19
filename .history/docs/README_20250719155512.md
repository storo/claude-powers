# Claude Power - Comandos Slash

Un package de comandos slash profesionales para Claude Code que potencia tu flujo de desarrollo con herramientas avanzadas de análisis y debugging.

## 🚀 Características

- **Búsqueda de Bugs**: Detección automática de patrones problemáticos en el código
- **Análisis Inteligente**: Soporte para JavaScript, TypeScript, React, Node.js y más
- **Configuración Flexible**: Personalizable según las necesidades del proyecto
- **Reportes Detallados**: Salidas claras con sugerencias de mejora
- **Fácil Instalación**: Package npm listo para usar

## 📦 Instalación

### Instalación Global
```bash
npm install -g @claude-power/slash-commands
```

### Instalación en Proyecto
```bash
npm install @claude-power/slash-commands
npx claude-power install
```

### Instalación Manual
```bash
git clone https://github.com/claude-power/slash-commands
cd slash-commands
npm run install-commands
```

## 🛠️ Comandos Disponibles

### `/find-bugs`
Busca patrones comunes de bugs y problemas en el código.

**Uso básico:**
```
/find-bugs
```

**Uso avanzado:**
```
/find-bugs src/components --tipos=react --severidad=alto
```

[Ver documentación completa](./commands/find-bugs.md)

## ⚙️ Configuración

El package utiliza archivos de configuración en `.claude/` para personalizar el comportamiento:

- `.claude/find-bugs-config.json` - Configuración para búsqueda de bugs
- `.claude/commands/` - Definiciones de comandos

### Ejemplo de Configuración

```json
{
  "severity": "medio",
  "rules": {
    "javascript": true,
    "typescript": true,
    "react": true,
    "node": true
  },
  "exclude": ["node_modules", "dist", "*.test.js"]
}
```

## 📋 Roadmap

### Comandos Planificados

- `/fix-bugs` - Auto-corrección de bugs detectados
- `/analyze-performance` - Análisis de rendimiento
- `/security-scan` - Escaneo de vulnerabilidades
- `/code-review` - Revisión automática de código
- `/generate-tests` - Generación de tests unitarios
- `/refactor-suggest` - Sugerencias de refactoring

## 🤝 Contribuir

1. Fork el repositorio
2. Crea una branch (`git checkout -b feature/nueva-funcionalidad`)
3. Commit tus cambios (`git commit -am 'Añadir nueva funcionalidad'`)
4. Push a la branch (`git push origin feature/nueva-funcionalidad`)
5. Crea un Pull Request

## 📝 Licencia

MIT License - ver [LICENSE](../LICENSE) para más detalles.

## 🎯 Brand

Colores principales: `#009a7f` (color oficial de terapeutas ocupacionales en Chile)

---

**Claude Power Team** - Potenciando el desarrollo con IA 🚀 