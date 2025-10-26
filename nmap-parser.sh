#!/bin/bash


# Este programa parsea los resultado de nmap y construye un documento html

TITLE="Nmap service scan results"
ACTUAL_DATE="$(date)"
TIME_STAMP="The scan was performed on: $ACTUAL_DATE by the user $USERNAME"

nmap_exec() {
  echo "[INFO] Executing nmap on the network $1 please wait..."
  sudo nmap -sV $1 >$2
  echo "[OK] File $2 generated succesfully"
}
# We generate the nmap report
generate_.raw_file() {
    if [ $(find $2 -mmin -30) ]; then
        while  true; do
            echo "[INFO] A file named $2 already exist or have less than 30 min crated."
            read -p "Override? [y/n]: "
            case  "$REPLY" in
                y)  # Executing nmap
                    nmap_exec $1 $2 
                    # Partitioning the raw file
                    echo "[INFO] Partitioning the $2 file"
                    csplit $2 '/^$/' '{*}' >/dev/null
                    echo "[OK] The file $2 was partitioned in the next files: $(ls xx*)"
                    break
                    ;;
                n)
                    echo "[INFO] Using the next file: $2"
                    break
                    ;;
            esac
        done
    else
        # Generating the file
        nmap_exec $1 $2
        # Cutting the file nmap_exec.raw
        echo "[INFO] Partitioning the $2 file"
        csplit $2 '/^$/' '{*}' >/dev/null
        echo "[OK] The file $2 was partitioned in the next files: $(ls xx*)"
    fi
}

generate_.raw_file $1 $2 
echo "[INFO] Generating HTML report"
# Importing the file with the html script
source function_html.sh
# Generating the html file
generate_html > results_nmap.html 
echo "[OK] Results_nmap.html generated succesfully"

# Removing trash files

echo "[INFO] Removing unnecessary files"
rm xx*

# Opening the html file with firefox

read -p "Open file with firefox? [y/n]"
case "$REPLY" in
    y) firefox ~/Nmap_Scanner_To_HTML/results_nmap.html
        ;;
    n) "[OK] Exiting"
        ;;
esac
