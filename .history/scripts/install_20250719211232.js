#!/usr/bin/env node

const fs = require('fs');
const path = require('path');
const { execSync } = require('child_process');

console.log('🚀 Claude Powers - Installing slash commands...\n');

/**
 * Installs slash commands in the project directory
 */
function installCommands() {
  const projectRoot = process.cwd();
  const claudeDir = path.join(projectRoot, '.claude');
  const commandsDir = path.join(claudeDir, 'commands');
  
  // Create directories if they don't exist
  if (!fs.existsSync(claudeDir)) {
    fs.mkdirSync(claudeDir, { recursive: true });
    console.log('✅ Created .claude/ directory');
  }
  
  if (!fs.existsSync(commandsDir)) {
    fs.mkdirSync(commandsDir, { recursive: true });
    console.log('✅ Created .claude/commands/ directory');
  }
  
  // Copiar archivos de comandos
  const packageDir = __dirname.includes('node_modules') 
    ? path.join(__dirname, '..')
    : path.join(__dirname, '..');
    
  const sourceCommandsDir = path.join(packageDir, '.claude', 'commands');
  const sourceConfigDir = path.join(packageDir, '.claude');
  
  try {
    // Copy commands
    if (fs.existsSync(sourceCommandsDir)) {
      const commandFiles = fs.readdirSync(sourceCommandsDir);
      commandFiles.forEach(file => {
        const source = path.join(sourceCommandsDir, file);
        const dest = path.join(commandsDir, file);
        fs.copyFileSync(source, dest);
        console.log(`✅ Installed command: ${file}`);
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
        console.log(`✅ Installed configuration: ${configFile}`);
      }
    });
    
    console.log('\n🎉 Installation completed successfully!');
    console.log('\n📋 Available commands:');
    console.log('\n🔥 Super Powers:');
    console.log('  /generate-tests - Automatic tests with 90%+ coverage');
    console.log('  /fix-bugs - Auto bug fixing (90% reduction)');
    console.log('  /performance-turbo - Automatic optimization (60%+ improvement)');
    console.log('  /security-fortress - Impenetrable security fortress');
    console.log('  /explain-code - Personal code teacher');
    console.log('\n🛠️ Base Commands:');
    console.log('  /find-bugs - Find bugs in code');
    console.log('  /find-unused-code - Find unused code');
    console.log('  /auto-commit - Automatic commits with AI');
    console.log('  /create-pr - Intelligent pull requests');
    console.log('  /code-review - Automatic code review');
    console.log('\n💡 Usage examples:');
    console.log('  /generate-tests src/components/UserProfile.tsx --coverage=95%');
    console.log('  /fix-bugs --types=memory-leaks,null-pointers --confidence=high');
    console.log('  /performance-turbo --target=web --budget=strict');
    console.log('  /security-fortress --compliance=gdpr,owasp --harden=paranoid');
    console.log('  /explain-code src/algorithm.js --level=beginner --diagram=flowchart');
    console.log('\n💡 Additional commands:');
    console.log('  /find-bugs src/ --types=react --severity=high');
    console.log('  /auto-commit --interactive');
    console.log('  /create-pr --type=feature --reviewers=@team');

    
  } catch (error) {
    console.error('❌ Error during installation:', error.message);
    process.exit(1);
  }
}

/**
 * Checks if Claude Code is available
 */
function checkClaudeAvailability() {
  try {
    // Try to verify if we're in a Claude environment
    if (process.env.CLAUDE_ENV || process.env.CURSOR_ENV) {
      console.log('✅ Claude/Cursor environment detected');
      return true;
    }
    
    console.log('⚠️  Claude Code not detected, but commands will be installed anyway');
    return true;
  } catch (error) {
    console.log('⚠️  Could not verify Claude environment');
    return true;
  }
}

/**
 * Shows help information
 */
function showHelp() {
  console.log(`
🚀 Claude Powers - Slash Commands Installer

USAGE:
  node scripts/install.js [options]

OPTIONS:
  --help, -h     Show this help
  --force, -f    Force reinstallation
  --dry-run      Show what would be done without executing

EXAMPLES:
  node scripts/install.js
  npm run install-commands
  npx claude-powers install-commands
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