#!/usr/bin/env node

const fs = require('fs');
const path = require('path');
const { execSync } = require('child_process');

console.log('🚀 Claude Power - Instalando comandos slash...\n');

/**
 * Instala los comandos slash en el directorio del proyecto
 */
function installCommands() {
  const projectRoot = process.cwd();
  const claudeDir = path.join(projectRoot, '.claude');
  const commandsDir = path.join(claudeDir, 'commands');
  
  // Crear directorios si no existen
  if (!fs.existsSync(claudeDir)) {
    fs.mkdirSync(claudeDir, { recursive: true });
    console.log('✅ Creado directorio .claude/');
  }
  
  if (!fs.existsSync(commandsDir)) {
    fs.mkdirSync(commandsDir, { recursive: true });
    console.log('✅ Creado directorio .claude/commands/');
  }
  
  // Copiar archivos de comandos
  const packageDir = __dirname.includes('node_modules') 
    ? path.join(__dirname, '..')
    : path.join(__dirname, '..');
    
  const sourceCommandsDir = path.join(packageDir, '.claude', 'commands');
  const sourceConfigDir = path.join(packageDir, '.claude');
  
  try {
    // Copiar comandos
    if (fs.existsSync(sourceCommandsDir)) {
      const commandFiles = fs.readdirSync(sourceCommandsDir);
      commandFiles.forEach(file => {
        const source = path.join(sourceCommandsDir, file);
        const dest = path.join(commandsDir, file);
        fs.copyFileSync(source, dest);
        console.log(`✅ Instalado comando: ${file}`);
      });
    }
    
    // Copiar configuraciones si no existen
    const configFiles = [
      'find-bugs-config.json', 
      'find-unused-code-config.json',
      'auto-commit-config.json',
      'create-pr-config.json',
      'code-review-config.json',
      'generate-tests-config.json',
      'fix-bugs-config.json',
      'performance-turbo-config.json',
      'security-fortress-config.json',
      'explain-code-config.json'
    ];
    configFiles.forEach(configFile => {
      const source = path.join(sourceConfigDir, configFile);
      const dest = path.join(claudeDir, configFile);
      
      if (fs.existsSync(source) && !fs.existsSync(dest)) {
        fs.copyFileSync(source, dest);
        console.log(`✅ Instalada configuración: ${configFile}`);
      }
    });
    
    console.log('\n🎉 Instalación completada exitosamente!');
    console.log('\n📋 Comandos disponibles:');
    console.log('\n🔥 Super Poderes:');
    console.log('  /generate-tests - Tests automáticos con 90%+ cobertura');
    console.log('  /fix-bugs - Auto-reparación de bugs (90% reducción)');
    console.log('  /performance-turbo - Optimización automática (60%+ mejora)');
    console.log('  /security-fortress - Fortaleza de seguridad impenetrable');
    console.log('  /explain-code - Profesor personal de código');
    console.log('\n🛠️ Comandos Base:');
    console.log('  /find-bugs - Buscar bugs en el código');
    console.log('  /find-unused-code - Encontrar código sin uso');
    console.log('  /auto-commit - Commits automáticos con IA');
    console.log('  /create-pr - Pull requests inteligentes');
    console.log('  /code-review - Revisión automática de código');
    console.log('\n💡 Uso:');
    console.log('  /find-bugs');
    console.log('  /find-bugs src/ --tipos=react --severidad=alto');
    console.log('  /find-unused-code');
    console.log('  /find-unused-code src/ --tipos=variables,funciones');
    console.log('  /auto-commit --interactive');
    console.log('  /create-pr --tipo=feature --reviewers=@team');
    console.log('  /code-review --aspectos=calidad,seguridad');
    console.log('\n📖 Documentación completa: docs/README.md');
    
  } catch (error) {
    console.error('❌ Error durante la instalación:', error.message);
    process.exit(1);
  }
}

/**
 * Verifica si Claude Code está disponible
 */
function checkClaudeAvailability() {
  try {
    // Intentar verificar si estamos en un entorno Claude
    if (process.env.CLAUDE_ENV || process.env.CURSOR_ENV) {
      console.log('✅ Entorno Claude/Cursor detectado');
      return true;
    }
    
    console.log('⚠️  No se detectó Claude Code, pero los comandos se instalarán de todas formas');
    return true;
  } catch (error) {
    console.log('⚠️  No se pudo verificar el entorno Claude');
    return true;
  }
}

/**
 * Muestra información de ayuda
 */
function showHelp() {
  console.log(`
🚀 Claude Power - Instalador de Comandos Slash

USO:
  node scripts/install.js [opciones]

OPCIONES:
  --help, -h     Mostrar esta ayuda
  --force, -f    Forzar reinstalación
  --dry-run      Mostrar qué se haría sin ejecutar

EJEMPLOS:
  node scripts/install.js
  npm run install-commands
  npx claude-power install-commands
  `);
}

// Procesar argumentos de línea de comandos
const args = process.argv.slice(2);

if (args.includes('--help') || args.includes('-h')) {
  showHelp();
  process.exit(0);
}

if (args.includes('--dry-run')) {
  console.log('🔍 DRY RUN - Mostrando qué se haría:');
  console.log('  - Crear directorio .claude/');
  console.log('  - Crear directorio .claude/commands/');
  console.log('  - Copiar comando find-bugs.md');
  console.log('  - Copiar comando find-unused-code.md');
  console.log('  - Copiar comando auto-commit.md');
  console.log('  - Copiar comando create-pr.md');
  console.log('  - Copiar comando code-review.md');
  console.log('  - Copiar configuración find-bugs-config.json');
  console.log('  - Copiar configuración find-unused-code-config.json');
  console.log('  - Copiar configuración auto-commit-config.json');
  console.log('  - Copiar configuración create-pr-config.json');
  console.log('  - Copiar configuración code-review-config.json');
  process.exit(0);
}

// Ejecutar instalación
checkClaudeAvailability();
installCommands(); 