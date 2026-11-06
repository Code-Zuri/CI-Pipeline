
#!/usr/bin/env bash
set -euo pipefail

echo "Preparando Laravel para preproduccion..."

if [ ! -f artisan ]; then
  echo "ERROR: No se encontro artisan"
  exit 1
fi

if [ ! -f vendor/autoload.php ]; then
  echo "ERROR: Faltan dependencias PHP"
  exit 1
fi

if [ ! -f public/build/manifest.json ]; then
  echo "ERROR: Faltan recursos compilados"
  exit 1
fi

if [ ! -f .env ]; then
  echo "ERROR: Configura .env de preproduccion"
  exit 1
fi

if ! grep -Eq '^APP_ENV=staging$' .env; then
  echo "ERROR: APP_ENV debe ser staging"
  exit 1
fi

if ! grep -Eq '^APP_DEBUG=false$' .env; then
  echo "ERROR: APP_DEBUG debe ser false"
  exit 1
fi

if ! grep -Eq '^APP_KEY=base64:.+' .env; then
  echo "ERROR: Configura una APP_KEY valida"
  exit 1
fi

mkdir -p storage/framework/cache/data
mkdir -p storage/framework/sessions
mkdir -p storage/framework/views
mkdir -p storage/logs
mkdir -p bootstrap/cache

if [ ! -w storage ] || [ ! -w bootstrap/cache ]; then
  echo "ERROR: Permisos de escritura insuficientes"
  exit 1
fi

php artisan config:clear
php artisan config:cache
php artisan view:cache

echo "Preparacion inicial completada."
echo "Pendiente: validar base de datos, migraciones"
echo "y funcionamiento de la aplicacion."
