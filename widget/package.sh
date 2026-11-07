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

PACKAGE_NAME=$(jq -r .KPlugin.Name package/metadata.json)

tar -czvf "${PACKAGE_NAME}.tar.gz" -C "package/" .
