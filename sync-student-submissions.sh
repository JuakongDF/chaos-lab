#!/bin/bash

# Script to sync student submissions from chaos-student-submissions repo
# to JupyterLite content directory

# Colors for output
GREEN='\033[0;32m'
BLUE='\033[0;34m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

echo -e "${BLUE}╔════════════════════════════════════════════════════════╗${NC}"
echo -e "${BLUE}║   Student Submissions Sync for JupyterLite            ║${NC}"
echo -e "${BLUE}╚════════════════════════════════════════════════════════╝${NC}"
echo ""

# Default paths
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
CONTENT_DIR="$SCRIPT_DIR/content"
SUBMISSIONS_DEST="$CONTENT_DIR/Entregas_Estudiantes_Nov8"

# Path to your chaos-student-submissions repo (update this)
SUBMISSIONS_REPO="${1:-$HOME/Documents/chaos-student-submissions}"

# Check if submissions repo exists
if [ ! -d "$SUBMISSIONS_REPO" ]; then
    echo -e "${YELLOW}⚠️  Student submissions repo not found at: $SUBMISSIONS_REPO${NC}"
    echo ""
    echo "Options:"
    echo "  1. Clone the repo first:"
    echo "     cd ~/Documents && git clone https://github.com/JuakongDF/chaos-student-submissions.git"
    echo ""
    echo "  2. Or specify a different path:"
    echo "     ./sync-student-submissions.sh /path/to/chaos-student-submissions"
    echo ""
    exit 1
fi

# Check if submissions/Nov8 directory exists
SUBMISSIONS_SOURCE="$SUBMISSIONS_REPO/submissions/Nov8"
if [ ! -d "$SUBMISSIONS_SOURCE" ]; then
    echo -e "${YELLOW}⚠️  Nov8 submissions directory not found at: $SUBMISSIONS_SOURCE${NC}"
    exit 1
fi

echo -e "${GREEN}✓${NC} Found submissions repo: $SUBMISSIONS_REPO"
echo ""

# Create destination directory if it doesn't exist
mkdir -p "$SUBMISSIONS_DEST"

# Count .ipynb files in source
NOTEBOOK_COUNT=$(find "$SUBMISSIONS_SOURCE" -maxdepth 1 -name "*.ipynb" | wc -l | tr -d ' ')

echo "📊 Found $NOTEBOOK_COUNT student notebook(s) to sync"
echo ""

# Copy all .ipynb files
echo "Copying notebooks..."
cp -v "$SUBMISSIONS_SOURCE"/*.ipynb "$SUBMISSIONS_DEST/" 2>/dev/null

if [ $? -eq 0 ]; then
    echo ""
    echo -e "${GREEN}✓${NC} Successfully copied notebooks to: $SUBMISSIONS_DEST"
    echo ""
    echo "📝 Next steps:"
    echo "   1. Review the copied notebooks in: content/Entregas_Estudiantes_Nov8/"
    echo "   2. Rebuild JupyterLite: jupyter lite build --contents content --output-dir test-dist"
    echo "   3. Or use the test-local.sh script to rebuild and test"
    echo ""
else
    echo -e "${YELLOW}⚠️  No .ipynb files found or copy failed${NC}"
    exit 1
fi

# Show list of copied files
echo "📚 Copied notebooks:"
ls -1 "$SUBMISSIONS_DEST"/*.ipynb 2>/dev/null | xargs -n1 basename

echo ""
echo -e "${BLUE}═══════════════════════════════════════════════════════${NC}"
echo -e "${GREEN}✓ Sync complete!${NC}"
echo -e "${BLUE}═══════════════════════════════════════════════════════${NC}"
