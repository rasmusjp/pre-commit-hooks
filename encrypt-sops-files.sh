#!/usr/bin/env bash

EXIT_CODE=0

for file in "$@"; do
	if [[ -f "$file" ]]; then
		if ! grep -q '"data":\s"ENC\[[A-Z0-9_]*,data:.*,type:.*\]"' "$file"; then
			echo "File $file is not encrypted, encrypting..."
			sops --encrypt --in-place "$file"
			EXIT_CODE=1
		fi
	fi
done

exit $EXIT_CODE
