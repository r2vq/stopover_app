#!/bin/sh
DIRECTORY=".git"
if [ ! -d "$DIRECTORY" ]; then
    echo "Run install from root project directory!"
    exit 1
fi

cat <<EOF >.git/hooks/pre-commit
get_line_count() {
	echo "\$1" | sed '/^[[:space:]]*$/d' | wc -l
}

echo "Linting..."
# edge case - no files being linted
violations=\`flutter analyze | grep '^[ ]*error'\`
line_count=\$(get_line_count \$violations)
if [ "\$((line_count))" -ne 0 ]; then 
	echo "\$violations"
	echo "Please correct errors before committing!"
	exit 1
else 
	echo "Success!"
fi

EOF

chmod u+x .git/hooks/pre-commit