#!/bin/bash

# JupyterLite Local Testing Script
# This serves your JupyterLite content exactly as GitHub Pages will

cd "$(dirname "$0")"

echo "🧪 Starting JupyterLite test server..."
echo ""
echo "📂 Serving from: $(pwd)"
echo "🌐 URL: http://localhost:8000"
echo ""
echo "📝 How to use:"
echo "   1. Edit notebooks in VS Code"
echo "   2. Save your changes"
echo "   3. Refresh browser to see updates"
echo "   4. Test everything works before committing!"
echo ""
echo "Press Ctrl+C to stop the server"
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo ""

# Start simple HTTP server
python3 -m http.server 8000
