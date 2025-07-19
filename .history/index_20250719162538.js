#!/usr/bin/env node

/**
 * Claude Power - Slash Commands
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
🚀 Claude Power - Slash Commands v1.0.0

COMANDOS DISPONIBLES:
  install           Instalar comandos slash en el proyecto actual
  version           Mostrar versión del package
  help              Mostrar esta ayuda

EJEMPLOS:
  npx @claude-power/slash-commands install
  npx claude-power install-commands
  
DOCUMENTACIÓN:
  https://github.com/claude-power/slash-commands

COMANDOS SLASH DISPONIBLES:
  /find-bugs        Buscar bugs en el código
  /find-unused-code Encontrar código sin uso
  /auto-commit      Commits automáticos con IA
  /create-pr        Pull requests inteligentes
  
🎯 Para más información, visita: docs/README.md
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