# 🧪 JupyterLite Local Testing Guide

## Quick Start

### Option 1: Command Line
```bash
cd jupyterlite-chaos-lab
./test-local.sh
```

Then open your browser to: **http://localhost:8000**

### Option 2: VS Code (Easiest!)
1. Press **⇧⌘P** (Command Palette)
2. Type: **"Tasks: Run Task"**
3. Select: **"🚀 Test JupyterLite & Open Browser"**

This will automatically:
- Start the local server
- Open your browser to the test site
- Let you edit in VS Code and test in browser!

---

## Your Workflow

### 1. Edit in VS Code
- Open `.ipynb` files
- Use GitHub Copilot for suggestions
- Write your code with full intellisense

### 2. Test Locally
- Run the task: **🚀 Test JupyterLite & Open Browser**
- Your browser opens with the exact GitHub Pages environment
- Test all your notebooks

### 3. Iterate
- Make changes in VS Code → Save
- Refresh browser to see updates
- **No commit-push-test cycle needed!**

### 4. Commit with Confidence
Once everything works locally:
```bash
cd jupyterlite-chaos-lab
git add content/
git commit -m "Your message"
git push origin main
```

**Zero surprises on GitHub Pages!** ✨

---

## Keyboard Shortcuts

Add these to your workflow:

- **⇧⌘P** → Tasks: Run Task → 🚀 Test JupyterLite
- **⌘S** → Save file in VS Code
- **⌘R** → Refresh browser to see changes
- **Ctrl+C** in terminal → Stop server

---

## Troubleshooting

### Port already in use?
```bash
# Kill any process on port 8000
lsof -ti:8000 | xargs kill -9
```

### Browser not opening?
Manually go to: **http://localhost:8000**

### Changes not showing?
1. Make sure you saved in VS Code (⌘S)
2. Do a hard refresh in browser (⇧⌘R)
3. Check the terminal for any errors

---

## Why This Works

✅ **100% identical** to GitHub Pages environment  
✅ Uses **Pyodide** (same as production)  
✅ Same **package availability** as deployed site  
✅ **Zero compatibility surprises**  
✅ Edit with **VS Code + Copilot**, test in **browser**

This is the **best of both worlds**! 🎉
