#!/bin/bash

# Script para inicializar el repositorio de Git para JupyterLite
# Uso: ./init-repo.sh

echo "🚀 Inicializando repositorio de JupyterLite..."
echo ""

# Verificar que estamos en el directorio correcto
if [ ! -f "jupyter-lite.json" ]; then
    echo "❌ Error: No se encuentra jupyter-lite.json"
    echo "   Asegúrate de ejecutar este script desde la carpeta jupyterlite-chaos-lab"
    exit 1
fi

# Inicializar git
echo "📦 Inicializando Git..."
git init

# Agregar todos los archivos
echo "➕ Agregando archivos..."
git add .

# Hacer el primer commit
echo "💾 Creando commit inicial..."
git commit -m "🎉 Initial setup: Chaos Lab with extended logistic map"

echo ""
echo "✅ Repositorio local inicializado"
echo ""
echo "📝 Próximos pasos:"
echo "   1. Crea un repositorio en GitHub: https://github.com/new"
echo "   2. Nombre sugerido: jupyterlite-chaos-lab"
echo "   3. Hazlo PÚBLICO"
echo "   4. NO agregues README, .gitignore ni licencia (ya los tienes)"
echo "   5. Copia el comando 'git remote add origin...' que GitHub te muestra"
echo "   6. Ejecuta ese comando aquí"
echo "   7. Ejecuta: git branch -M main"
echo "   8. Ejecuta: git push -u origin main"
echo ""
echo "🌐 Una vez subido, configura GitHub Pages:"
echo "   Settings → Pages → Source: GitHub Actions"
echo ""
echo "🎓 Tu laboratorio estará en:"
echo "   https://TU-USUARIO.github.io/jupyterlite-chaos-lab/"
echo ""
