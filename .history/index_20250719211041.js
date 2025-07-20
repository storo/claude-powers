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

AVAILABLE COMMANDS:
  install           Install slash commands in current project
  version           Show package version
  help              Show this help

EXAMPLES:
  npx @claude-powers/slash-commands install
  npx claude-powers install-commands

AVAILABLE SLASH COMMANDS:

🔥 Main Commands:
  /generate-tests    Automatic tests with 90%+ coverage
  /fix-bugs         Auto bug fixing (90% reduction)
  /performance-turbo Automatic optimization (60%+ improvement)
  /security-fortress Impenetrable security fortress
  /explain-code     Personal code teacher

🛠️ Base Commands:
  /find-bugs        Find bugs in code
  /find-unused-code Find unused code
  /auto-commit      Automatic commits with AI
  /create-pr        Intelligent pull requests
  /code-review      Automatic code review
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