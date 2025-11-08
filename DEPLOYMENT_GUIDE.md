# Deployment Guide: Adding Student Submissions to JupyterLite

This guide explains how to add student submissions from the `chaos-student-submissions` repository to your JupyterLite deployment on GitHub Pages.

## 📋 Overview

- **Main JupyterLite repo**: `jupyterlite-chaos-lab` (deployed to GitHub Pages)
- **Student submissions repo**: `chaos-student-submissions` (private)
- **Deployment**: Vercel/GitHub Pages at https://juakongdf.github.io/chaos-lab/

## 🔄 Workflow Options

### Option 1: Manual Sync (Recommended for now)

Since `chaos-student-submissions` is private, manually sync submissions before deploying:

```bash
# 1. Update student submissions repo
cd ~/Documents/chaos-student-submissions
git pull

# 2. Sync to JupyterLite
cd ~/Documents/More/PentaUC/PentaWorkspace/jupyterlite-chaos-lab
./sync-student-submissions.sh

# 3. Test locally
jupyter lite build --contents content --output-dir test-dist
python3 -m http.server 8000  # Test at http://localhost:8000/test-dist/lab/

# 4. Commit and push to GitHub
git add content/Entregas_Estudiantes_Nov8/
git commit -m "Update student submissions from Nov 8"
git push origin main
```

### Option 2: Automated Sync with GitHub Actions (Advanced)

To automate this, you need to set up GitHub Actions with SSH keys or Personal Access Tokens:

1. **Generate SSH Deploy Key**:
   ```bash
   ssh-keygen -t ed25519 -C "jupyterlite-deploy" -f ~/.ssh/jupyterlite_deploy
   ```

2. **Add to chaos-student-submissions**:
   - Go to Settings → Deploy keys → Add deploy key
   - Paste the **public key** (`~/.ssh/jupyterlite_deploy.pub`)
   - ✅ Enable "Allow write access" if needed

3. **Add to jupyterlite-chaos-lab**:
   - Go to Settings → Secrets and variables → Actions → New repository secret
   - Name: `SUBMISSIONS_DEPLOY_KEY`
   - Value: Contents of **private key** (`~/.ssh/jupyterlite_deploy`)

4. **Update `.github/workflows/deploy.yml`**:
   ```yaml
   - name: Clone student submissions
     run: |
       mkdir -p ~/.ssh
       echo "${{ secrets.SUBMISSIONS_DEPLOY_KEY }}" > ~/.ssh/id_ed25519
       chmod 600 ~/.ssh/id_ed25519
       ssh-keyscan github.com >> ~/.ssh/known_hosts
       git clone git@github.com:JuakongDF/chaos-student-submissions.git /tmp/submissions
       
   - name: Copy submissions to content
     run: |
       mkdir -p content/Entregas_Estudiantes_Nov8
       cp /tmp/submissions/submissions/Nov8/*.ipynb content/Entregas_Estudiantes_Nov8/
   ```

## 📁 Directory Structure

```
jupyterlite-chaos-lab/
├── content/
│   ├── ENTREGA.ipynb
│   ├── OCTUBRE/
│   ├── Entregas_Estudiantes_Nov8/    ← Student submissions go here
│   │   ├── Student1_notebook.ipynb
│   │   ├── Student2_notebook.ipynb
│   │   └── ...
│   ├── PLANIFICACION_PROYECTO.ipynb
│   └── PROYECTO_INVESTIGACION_NOVIEMBRE.ipynb
├── sync-student-submissions.sh        ← Sync script
└── test-local.sh                      ← Local testing
```

## 🚀 Deployment Checklist

- [ ] Pull latest from `chaos-student-submissions`
- [ ] Run `sync-student-submissions.sh`
- [ ] Test locally (`jupyter lite build` + local server)
- [ ] Review student notebooks in browser
- [ ] Commit changes to `jupyterlite-chaos-lab`
- [ ] Push to GitHub (triggers automatic deployment)
- [ ] Verify at https://juakongdf.github.io/chaos-lab/

## 🔧 Sync Script Usage

```bash
# Default (looks in ~/Documents/chaos-student-submissions)
./sync-student-submissions.sh

# Custom path
./sync-student-submissions.sh /path/to/chaos-student-submissions
```

## 📝 Notes

- Student notebooks appear in JupyterLite file browser under "Entregas_Estudiantes_Nov8"
- All Python packages in `requirements.txt` are pre-installed (numpy, matplotlib, plotly, etc.)
- Changes to student submissions require rebuilding and redeploying
- Local testing is recommended before pushing to production

## 🐛 Troubleshooting

**Issue**: Student notebooks not showing up
- Check that files were copied: `ls content/Entregas_Estudiantes_Nov8/`
- Rebuild: `jupyter lite build --contents content`
- Clear browser cache and reload

**Issue**: Sync script can't find repo
- Verify clone location: `ls ~/Documents/chaos-student-submissions`
- Or specify path: `./sync-student-submissions.sh /correct/path`

**Issue**: GitHub Pages not updating
- Check GitHub Actions tab for build errors
- Verify gh-pages branch was updated
- Wait 2-3 minutes for GitHub Pages to rebuild
