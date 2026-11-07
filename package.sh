  #!/usr/bin/env bash

prompt() {
    while true; do
        echo -e "$1 [y/n]: "
        read -r yn
        case ${yn} in
            [Yy]*) return 0 ;;
            [Nn]*) return  1 ;;
        esac
    done
}

PACKAGE_NAME=$(jq -r .KPlugin.Id package/metadata.json)

(cd package && zip -r "../${PACKAGE_NAME}.kwinscript" .)

prompt "Do you want to commit and push the changes to the git repository?" && \
git add . && \
git commit -m "Update package" && \
git push
