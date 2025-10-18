# 📘 Guía de Configuración para Profesores

## Pasos para Publicar tu Laboratorio JupyterLite

### 1️⃣ Crear Repositorio en GitHub

1. Ve a [github.com](https://github.com) e inicia sesión
2. Haz clic en el botón verde **"New"** o **"+"** → **"New repository"**
3. Configura el repositorio:
   - **Repository name:** `jupyterlite-chaos-lab` (o el nombre que prefieras)
   - **Description:** "Laboratorio interactivo de sistemas caóticos"
   - **Public** (para que sea accesible)
   - ✅ Add a README file (o úsalo que está en esta carpeta)
   - Licencia: Elige una apropiada (MIT, GPL, etc.)
4. Haz clic en **"Create repository"**

### 2️⃣ Subir los Archivos

**Opción A: Usando la Interfaz Web de GitHub (más fácil)**

1. En tu repositorio nuevo, haz clic en **"Add file"** → **"Upload files"**
2. Arrastra todos los archivos de la carpeta `jupyterlite-chaos-lab`:
   - `README.md`
   - `jupyter-lite.json`
   - `.gitignore`
   - `requirements.txt`
   - Carpeta `content/` (con los notebooks)
   - Carpeta `.github/` (con el workflow)
3. Escribe un mensaje de commit: "Initial setup of chaos lab"
4. Haz clic en **"Commit changes"**

**Opción B: Usando Git en Terminal**

```bash
cd /Users/usuario/Documents/More/PentaUC/PentaWorkspace/jupyterlite-chaos-lab

# Inicializar git (si no está inicializado)
git init

# Agregar todos los archivos
git add .

# Hacer commit
git commit -m "Initial setup of chaos lab"

# Conectar con GitHub (reemplaza USUARIO y REPO con tus datos)
git remote add origin https://github.com/USUARIO/REPO.git

# Cambiar a rama main si es necesario
git branch -M main

# Subir los archivos
git push -u origin main
```

### 3️⃣ Activar GitHub Pages

1. En tu repositorio, ve a **Settings** (Configuración)
2. En el menú lateral izquierdo, busca **"Pages"** (en la sección "Code and automation")
3. En **"Build and deployment"**:
   - **Source:** Selecciona **"GitHub Actions"**
4. ¡Eso es todo! No necesitas hacer nada más

### 4️⃣ Esperar el Despliegue

1. Ve a la pestaña **"Actions"** en tu repositorio
2. Verás un workflow llamado "Build and Deploy JupyterLite" ejecutándose
3. Espera 2-5 minutos (la primera vez puede tardar más)
4. Cuando aparezca un ✅ verde, ¡está listo!

### 5️⃣ Acceder al Laboratorio

Tu laboratorio estará disponible en:

```
https://USUARIO.github.io/NOMBRE-DEL-REPO/
```

Por ejemplo:
```
https://JuakongDF.github.io/jupyterlite-chaos-lab/
```

**¡Comparte este link con tus estudiantes!** 🎉

---

## 🔄 Actualizar el Contenido

### Para agregar o modificar notebooks:

1. **Opción fácil (Interfaz web):**
   - Ve a tu repositorio → carpeta `content/`
   - Haz clic en **"Add file"** → **"Upload files"**
   - Sube el notebook modificado
   - Commit cambios

2. **Opción avanzada (Git):**
   ```bash
   cd jupyterlite-chaos-lab
   
   # Copia el notebook actualizado a content/
   cp "/ruta/al/notebook.ipynb" content/
   
   # Commit y push
   git add content/
   git commit -m "Actualizar notebook de caos"
   git push
   ```

3. **Despliegue automático:**
   - GitHub Actions detectará el cambio
   - Reconstruirá automáticamente el sitio (2-3 minutos)
   - Los estudiantes verán la versión actualizada

---

## ⚠️ Importante: Mantener las Soluciones Privadas

El archivo `.gitignore` está configurado para **NO subir** archivos que empiecen con `SOL_`:

```
**/SOL_*.ipynb
```

Esto significa que `SOL_mapa_logistico_ext.ipynb` **nunca** se publicará en el sitio web, aunque esté en tu carpeta `content/` local.

### Para compartir soluciones con otros profesores:

1. Crea un repositorio PRIVADO separado
2. Sube ahí los archivos `SOL_*.ipynb`
3. Invita solo a colaboradores específicos

---

## 🐛 Solución de Problemas

### El sitio no se construye

1. Ve a **Actions** → selecciona el workflow fallido
2. Revisa los logs para ver el error
3. Errores comunes:
   - Olvidaste activar GitHub Pages
   - El archivo `.github/workflows/deploy.yml` no está en el lugar correcto
   - Hay un error de sintaxis en `jupyter-lite.json`

### Los widgets no funcionan

- JupyterLite en el navegador puede tener limitaciones con algunos widgets
- `ipywidgets` básicos funcionan bien
- `bqplot` interactivo puede ser limitado
- Considera usar widgets de Plotly como alternativa

### Los estudiantes no pueden guardar su trabajo

- **Esto es normal:** JupyterLite funciona completamente en el navegador
- Los cambios NO se guardan automáticamente
- Instrucciones para estudiantes:
  1. `File > Download` para guardar el notebook localmente
  2. Para retomarlo: arrastra el archivo `.ipynb` de vuelta al navegador

### Agregar más paquetes de Python

Edita `requirements.txt` y agrega los paquetes necesarios. Sin embargo, **solo paquetes disponibles en Pyodide** funcionarán:
- Lista completa: https://pyodide.org/en/stable/usage/packages-in-pyodide.html

---

## 📊 Monitoreo de Uso

GitHub no proporciona estadísticas detalladas de visitantes para Pages, pero puedes:

1. Ver el número de visitas básico en **Insights** → **Traffic**
2. Agregar Google Analytics si necesitas más detalles
3. Pedirle a los estudiantes feedback directo

---

## 🎨 Personalización

### Cambiar el título de la aplicación

Edita `jupyter-lite.json`:

```json
{
  "jupyter-config-data": {
    "appName": "Tu Título Aquí",
    ...
  }
}
```

### Agregar notebooks adicionales

Simplemente coloca archivos `.ipynb` en la carpeta `content/` y haz commit.

### Cambiar el tema visual

En `jupyter-lite.json`, cambia:

```json
"@jupyterlab/apputils-extension:themes": {
  "theme": "JupyterLab Dark"  // o "JupyterLab Light"
}
```

---

## 📚 Recursos Adicionales

- [Documentación oficial de JupyterLite](https://jupyterlite.readthedocs.io/)
- [Ejemplos de JupyterLite](https://github.com/jupyterlite/demo)
- [Pyodide - Python en el navegador](https://pyodide.org/)
- [GitHub Pages docs](https://docs.github.com/en/pages)

---

## 💡 Consejos para la Clase

1. **Prueba el laboratorio tú mismo primero** en diferentes navegadores
2. **Ten un plan B:** Descarga el notebook por si hay problemas de internet
3. **Enseña a los estudiantes a descargar su trabajo** al final de la clase
4. **Comparte el link con anticipación** para que puedan explorar en casa
5. **Considera hacer un video corto** mostrando cómo usar JupyterLite

---

**¿Preguntas?** Abre un Issue en el repositorio o contacta al administrador del curso.
