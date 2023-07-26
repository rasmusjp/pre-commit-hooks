#!/usr/bin/env bash

EXIT_CODE=0

for file in "$@"; do
	if [[ -f "$file" ]]; then
		if ! grep -q '"ENC\[[A-Z0-9_]*,data:.*,type:.*\]"' "$file"; then
			echo "File $file is not encrypted, encrypting..."
			if [[ "$file" =~ \.yaml ]]; then
				sops --encrypt --in-place --input-type=yaml "$file"
			elif [[ "$file" =~ \.json ]]; then
				sops --encrypt --in-place --input-type=json "$file"
			elif [[ "$file" =~ \.env ]]; then
				sops --encrypt --in-place --input-type=dotenv "$file"
			else
				sops --encrypt --in-place "$file"
			fi
			EXIT_CODE=1
		fi
	fi
done

exit $EXIT_CODE
