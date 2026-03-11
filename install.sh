#!/bin/bash
# GTM Engineer Playbook — Skill Installer
# Copies all skills into your Claude Code project's .claude/skills/ directory

set -e

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
SKILLS_SOURCE="$SCRIPT_DIR/.claude/skills/gtm-playbook"

# Detect target directory
if [ -d ".claude/skills" ]; then
    TARGET=".claude/skills/gtm-playbook"
elif [ -d "$HOME/.claude/skills" ]; then
    TARGET="$HOME/.claude/skills/gtm-playbook"
else
    echo "Creating .claude/skills/ in current directory..."
    mkdir -p ".claude/skills"
    TARGET=".claude/skills/gtm-playbook"
fi

echo "Installing GTM Playbook skills..."
echo ""

# Copy all skill directories
cp -r "$SKILLS_SOURCE"/* "$TARGET/" 2>/dev/null || {
    mkdir -p "$TARGET"
    cp -r "$SKILLS_SOURCE"/* "$TARGET/"
}

# Count installed skills
SKILL_COUNT=$(find "$TARGET" -name "SKILL.md" | wc -l | tr -d ' ')

echo "Installed $SKILL_COUNT skills to $TARGET/"
echo ""
echo "Skills installed:"
for skill_dir in "$TARGET"/*/; do
    if [ -f "$skill_dir/SKILL.md" ]; then
        skill_name=$(basename "$skill_dir")
        echo "  - $skill_name"
    fi
done

echo ""
echo "You're ready to go. Try saying:"
echo '  "build my ICP"'
echo '  "research this company"'
echo '  "score this lead"'
echo '  "build an outreach sequence"'
echo ""
echo "All skills write output to docs/ in your project root."
echo "Skills chain together — ICP Architect feeds Signal Scanner feeds Qualification Scorer."
