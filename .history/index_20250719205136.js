#!/usr/bin/env node

/**
 * Claude Powers - Slash Commands
 * Entry point for the package
 */

const fs = require('fs');
const path = require('path');

// Función principal para manejar comandos CLI
function main() {
  const args = process.argv.slice(2);
  const command = args[0];
  
  switch (command) {
    case 'install':
    case 'install-commands':
      require('./scripts/install.js');
      break;
      
    case 'version':
    case '--version':
    case '-v':
      const packageJson = require('./package.json');
      console.log(`v${packageJson.version}`);
      break;
      
    case 'help':
    case '--help':
    case '-h':
    default:
      showHelp();
      break;
  }
}

function showHelp() {
  console.log(`
🚀 Claude Powers - Slash Commands v1.0.0

COMANDOS DISPONIBLES:
  install           Instalar comandos slash en el proyecto actual
  version           Mostrar versión del package
  help              Mostrar esta ayuda

EJEMPLOS:
  npx @claude-powers/slash-commands install
  npx claude-powers install-commands

COMANDOS SLASH DISPONIBLES:

🔥 Comandos Principales:
  /generate-tests    Tests automáticos con 90%+ cobertura
  /fix-bugs         Auto-reparación de bugs (90% reducción)
  /performance-turbo Optimización automática (60%+ mejora)
  /security-fortress Fortaleza de seguridad impenetrable
  /explain-code     Profesor personal de código

🛠️ Comandos Base:
  /find-bugs        Buscar bugs en el código
  /find-unused-code Encontrar código sin uso
  /auto-commit      Commits automáticos con IA
  /create-pr        Pull requests inteligentes
  /code-review      Revisión automática de código
  `);
}

// Ejecutar si se llama directamente
if (require.main === module) {
  main();
}

module.exports = {
  main,
  install: () => require('./scripts/install.js')
}; 