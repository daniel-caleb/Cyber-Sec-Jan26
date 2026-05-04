#!/bin/bash

BASE="$HOME/linux_lab"
SCORE=0
TOTAL=22   # increased because we added a new check

echo "🔍 Checking Linux Lab Submission..."
echo "-----------------------------------"

# Part 1: Directories
for dir in projects documents scripts; do
    if [ -d "$BASE/$dir" ]; then
        echo "✅ Directory exists: $dir"
        ((SCORE++))
    else
        echo "❌ Missing directory: $dir"
    fi
done

# backup should be deleted later, so don't check existence here

# Part 2: Files
[ -f "$BASE/projects/project1.txt" ] && echo "✅ project1.txt exists" && ((SCORE++)) || echo "❌ project1.txt missing"
[ -f "$BASE/documents/notes.txt" ] && echo "✅ notes.txt exists" && ((SCORE++)) || echo "❌ notes.txt missing"
[ -f "$BASE/scripts/backup.sh" ] && echo "✅ backup.sh exists" && ((SCORE++)) || echo "❌ backup.sh missing"

# project2 should have been renamed then deleted
if [ ! -f "$BASE/projects/project2.txt" ] && [ ! -f "$BASE/projects/project2_old.txt" ]; then
    echo "✅ project2 handled correctly"
    ((SCORE++))
else
    echo "❌ project2 not handled correctly"
fi

# Part 3: File Content
grep -q "Project 1: Linux Basics" "$BASE/projects/project1.txt" 2>/dev/null && echo "✅ project1 content OK" && ((SCORE++)) || echo "❌ project1 content missing"

grep -q "echo \"Backing up files...\"" "$BASE/scripts/backup.sh" 2>/dev/null && echo "✅ backup.sh content OK" && ((SCORE++)) || echo "❌ backup.sh content missing"

# notes.txt should have at least 3 lines
if [ -f "$BASE/documents/notes.txt" ]; then
    LINES=$(wc -l < "$BASE/documents/notes.txt")
    if [ "$LINES" -ge 3 ]; then
        echo "✅ notes.txt has enough content"
        ((SCORE++))
    else
        echo "❌ notes.txt has insufficient content"
    fi
fi

# Part 4: File operations
[ -f "$BASE/projects/todo.txt" ] && echo "✅ todo.txt moved to projects" && ((SCORE++)) || echo "❌ todo.txt not moved"

# 🔥 NEW: Check history for copy command
HISTFILE="$HOME/.bash_history"

if [ -f "$HISTFILE" ]; then
    if grep -E "cp .*project1\.txt .*backup" "$HISTFILE" > /dev/null; then
        echo "✅ Copy command found in history"
        ((SCORE++))
    else
        echo "❌ No evidence of copying project1.txt to backup"
    fi
else
    echo "❌ No bash history file found"
fi

# Part 6: Backup directory removed
if [ ! -d "$BASE/backup" ]; then
    echo "✅ backup directory removed"
    ((SCORE++))
else
    echo "❌ backup directory still exists"
fi

# Part 7: Challenge
if [ -f "$BASE/log.txt" ]; then
    echo "✅ log.txt exists"
    ((SCORE++))

    grep -q "$BASE" "$BASE/log.txt" && echo "✅ log.txt contains path" && ((SCORE++)) || echo "❌ log.txt missing path"

    # check for listing (basic check: multiple lines)
    LINES=$(wc -l < "$BASE/log.txt")
    if [ "$LINES" -ge 2 ]; then
        echo "✅ log.txt contains file list"
        ((SCORE++))
    else
        echo "❌ log.txt missing file list"
    fi
else
    echo "❌ log.txt missing"
fi

# Final Score
echo "-----------------------------------"
echo "🎯 Score: $SCORE / $TOTAL"

if [ "$SCORE" -ge 18 ]; then
    echo "🏆 Excellent work!"
elif [ "$SCORE" -ge 12 ]; then
    echo "👍 Good attempt, but needs improvement."
else
    echo "⚠️ Needs more practice."
fi