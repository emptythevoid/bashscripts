qpdf "$1" --json > json.json
grep '"fullname":' json.json | sort | uniq -d
