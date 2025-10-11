#!/usr/bin/env bash
set -e

echo "🧠 Verificando microservicios..."

# Lista de microservicios y sus repositorios
declare -A repos=(
  ["gateway-inscripciones-topicos"]="https://github.com/BenjaminRo-Dev/gateway-inscripciones-topicos.git"
  ["s-carreras"]="https://github.com/BenjaminRo-Dev/s-carreras.git"
  ["inscripciones"]="https://github.com/BenjaminRo-Dev/inscripciones.git"
  ["academia-service"]="https://github.com/Willxd123/academia-service.git"
  ["grupos-service"]="https://github.com/Willxd123/grupos-service.git"
  ["materias-service"]="https://github.com/Willxd123/materias-service.git"
  ["perfil-service"]="https://github.com/Willxd123/perfil-service.git"
)

# Clonar si no existen
for dir in "${!repos[@]}"; do
  if [ ! -d "$dir" ]; then
    echo "📦 Clonando $dir..."
    git clone "${repos[$dir]}" "$dir"
  else
    echo "✅ $dir ya existe, omitiendo clonación."
  fi

  # Crear .env dentro del repo si no existe
  if [ -d "$dir" ]; then
    if [ -f "$dir/.env" ]; then
      echo "✅ $dir: .env ya existe."
    elif [ -f "$dir/.env.example" ]; then
      echo "⚙️  Creando $dir/.env desde $dir/.env.example..."
      cp "$dir/.env.example" "$dir/.env"
    else
      echo "⚠️  $dir: no se encontró .env.example; omitiendo."
    fi
  fi

done

echo "🚀 Levantando contenedores..."
docker compose up -d

echo "✨ Todo listo."
