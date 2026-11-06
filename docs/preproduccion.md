
# Configuración del ambiente de preproducción

## Proyecto
Laravel CI Pipeline - Actividad 12

## Objetivo
Establecer los requisitos para instalar y validar
un artefacto Laravel antes de su liberación
a producción.

## Requisitos del ambiente

- Sistema operativo: Ubuntu Linux
- PHP: 8.3 o superior compatible con Composer
- Composer: versión 2
- Node.js: 22 para compilar recursos en CI
- Servidor web: Apache o Nginx
- Base de datos: SQLite para pruebas
- Framework: Laravel 13
- Frontend: React, Inertia.js y Vite

## Extensiones PHP

- mbstring
- pdo_sqlite
- sqlite3
- bcmath
- fileinfo
- openssl
- tokenizer
- xml
- ctype
- json

## Variables de entorno

El archivo .env debe configurarse directamente
en preproducción y nunca incluirse en el artefacto.

APP_ENV=staging
APP_DEBUG=false
APP_URL=https://staging.example.com

DB_CONNECTION=sqlite

Las variables sensibles y APP_KEY deben
configurarse mediante mecanismos seguros.

## Preparación del proyecto

1. Descargar el artefacto de GitHub Actions.
2. Extraer el paquete en el servidor.
3. Configurar el archivo .env de preproducción.
4. Preparar la base de datos independiente.
5. Verificar los permisos de storage y bootstrap/cache.
6. Ejecutar las migraciones autorizadas.
7. Optimizar la configuración Laravel.
8. Comprobar el funcionamiento de la aplicación.

## Comandos de preparación

php artisan config:clear
php artisan migrate --force
php artisan config:cache
php artisan view:cache

## Criterios de aceptación

- El artefacto se genera correctamente.
- Incluye vendor y los recursos compilados.
- No contiene archivos .env ni credenciales.
- Puede instalarse en un ambiente independiente.
- La aplicación responde correctamente.
- Las pruebas y validaciones son satisfactorias.

## Estrategia de versionado

Se utiliza versionado semántico:

v1.0.0 - Primera versión liberable
v1.0.1 - Correcciones
v1.1.0 - Nuevas funcionalidades compatibles
v2.0.0 - Cambios incompatibles
