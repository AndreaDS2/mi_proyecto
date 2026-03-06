# Script de automatización 
Write-Host "Iniciando el entorno de desarrollo..." -ForegroundColor Cyan

# 1. Limpieza y dependencias
Write-Host "Paso 1: Obteniendo paquetes (pub get)..."
flutter pub get

# 2. Análisis de código
Write-Host "Paso 2: Ejecutando análisis de código..."
flutter analyze

# 3. Lanzamiento
Write-Host "Paso 3: Lanzando la aplicación..."
flutter run