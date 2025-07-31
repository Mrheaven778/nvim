# Configuración de Neovim para Laravel

Esta configuración está optimizada para desarrollo backend con Laravel y incluye debugging completo con Xdebug.

## Características

### 🚀 Laravel
- **Laravel.nvim**: Integración completa con Laravel
- **Artisan commands**: Ejecuta comandos de Artisan desde Neovim
- **Route navigation**: Navega entre rutas y controladores
- **Blade syntax**: Resaltado de sintaxis para plantillas Blade
- **Snippets**: Snippets predefinidos para Laravel

### 🐛 Debugging
- **Xdebug 3**: Configurado y listo para usar
- **DAP (Debug Adapter Protocol)**: Debugging visual
- **Breakpoints**: Puntos de interrupción visuales
- **Variable inspection**: Inspección de variables en tiempo real
- **Step debugging**: Debugging paso a paso

### 🔧 PHP Tools
- **PHPActor**: Refactoring y navegación de código
- **Intelephense**: Language server para PHP
- **PHP-CS-Fixer**: Formateo automático de código
- **PHPCS**: Linting de código PHP

## Atajos de Teclado

### Laravel
- `<leader>la` - Laravel Artisan commands
- `<leader>lr` - Laravel Routes
- `<leader>lm` - Laravel Related files
- `<leader>lc` - Laravel Commands

### PHP
- `<leader>pm` - PHPActor Context Menu
- `<leader>pn` - PHPActor New Class
- `<leader>pi` - PHPActor Import Class
- `<leader>pt` - PHPActor Transform

### Debugging
- `<F5>` - Iniciar/Continuar debugging
- `<F10>` - Step Over
- `<F11>` - Step Into
- `<F12>` - Step Out
- `<leader>b` - Toggle Breakpoint
- `<leader>B` - Conditional Breakpoint
- `<leader>du` - Toggle Debug UI
- `<leader>de` - Evaluate Expression

### Laravel Debugging
- `<leader>lda` - Debug Artisan Command
- `<leader>ldf` - Debug Current File
- `<leader>ldl` - Listen for Xdebug

### Testing
- `<leader>tt` - Run Nearest Test
- `<leader>tf` - Run File Tests
- `<leader>ts` - Toggle Test Summary
- `<leader>to` - Show Test Output

### Composer
- `<leader>ci` - Composer Install
- `<leader>cu` - Composer Update
- `<leader>cr` - Composer Require

## Configuración de Xdebug

Xdebug ya está configurado en `/opt/homebrew/etc/php/8.4/conf.d/ext-xdebug.ini`:

```ini
zend_extension="xdebug.so"
xdebug.mode=debug,develop
xdebug.start_with_request=yes
xdebug.client_host=127.0.0.1
xdebug.client_port=9003
xdebug.log=/tmp/xdebug.log
xdebug.idekey=VSCODE
```

## Uso del Debugging

### 1. Configurar tu proyecto Laravel

En tu proyecto Laravel, asegúrate de que el archivo `.env` tenga:

```env
APP_DEBUG=true
```

### 2. Iniciar el servidor de desarrollo

```bash
php artisan serve
```

### 3. Configurar breakpoints

- Abre un archivo PHP en Neovim
- Coloca el cursor en la línea donde quieres el breakpoint
- Presiona `<leader>b` para crear un breakpoint

### 4. Iniciar debugging

- Presiona `<leader>ldl` para escuchar conexiones de Xdebug
- Haz una petición HTTP a tu aplicación Laravel
- El debugging se iniciará automáticamente

### 5. Controles de debugging

- `<F5>` - Continuar ejecución
- `<F10>` - Ejecutar siguiente línea (step over)
- `<F11>` - Entrar en función (step into)
- `<F12>` - Salir de función (step out)
- `<leader>de` - Evaluar expresión

## Snippets Disponibles

### PHP
- `route` - Crear una ruta de Laravel
- `controller` - Crear un controlador
- `model` - Crear un modelo
- `migration` - Crear una migración

### Blade
- `extends` - @extends directive
- `section` - @section directive
- `include` - @include directive
- `foreach` - @foreach loop

## Comandos Útiles

### Laravel Commands (`:Laravel`)
- `:Laravel artisan` - Ejecutar comando Artisan
- `:Laravel routes` - Ver rutas
- `:Laravel related` - Archivos relacionados

### Mason Commands
- `:Mason` - Abrir Mason (gestor de LSP/tools)
- `:MasonInstall <tool>` - Instalar herramienta
- `:MasonUpdate` - Actualizar herramientas

### DAP Commands
- `:DapToggleBreakpoint` - Toggle breakpoint
- `:DapContinue` - Continuar debugging
- `:DapStepOver` - Step over
- `:DapStepInto` - Step into
- `:DapStepOut` - Step out

## Troubleshooting

### Xdebug no conecta
1. Verifica que Xdebug esté cargado: `php -m | grep xdebug`
2. Revisa el log: `tail -f /tmp/xdebug.log`
3. Verifica el puerto: `netstat -an | grep 9003`

### LSP no funciona
1. Verifica que las herramientas estén instaladas: `:Mason`
2. Reinicia el LSP: `:LspRestart`
3. Revisa los logs: `:LspLog`

### Snippets no aparecen
1. Verifica que LuaSnip esté cargado: `:Lazy`
2. Reinicia Neovim
3. Verifica el filetype: `:set ft?`

## Estructura de Archivos

```
~/.config/nvim/
├── init.lua                 # Configuración principal
├── lua/
│   ├── config/
│   │   ├── keymaps.lua     # Atajos de teclado
│   │   └── laravel-debug.lua # Configuración de debugging Laravel
│   └── plugins/
│       ├── laravel.lua     # Plugins de Laravel
│       ├── debug.lua       # Configuración de debugging
│       ├── php.lua         # Herramientas PHP
│       ├── blade.lua       # Soporte para Blade
│       └── snippets.lua    # Snippets personalizados
└── README-Laravel.md       # Esta documentación
```

¡Tu Neovim está listo para desarrollo Laravel con debugging completo! 🎉
