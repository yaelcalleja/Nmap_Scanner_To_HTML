# NMAP SCANNER TO HTML

A bash script to automate the nmap services scanning and transform the XML exit
to a clean and easy to read HTML report, showing only the open ports and they services

## The problem to solve:

Nmap is a usefull tool with the power to scann entire networks, but when the info comes
out, is dificult to read and have some details that usually we dont use to much.

There's when this tool comes to help, giving the result of the scann on a more user friendly
way.

## Dependendies

-`nmap`
-`xmlsarlet` (Or any tool for xml files)
-`bash`


## Instalation

```Bash
git clone https://github.com/yaelcalleja/Nmap_Scanner_To_HTML
cd Nmap_Scanner_To_HTML
```

## To use it:

Give permition to the script to execute

```bash
chmod 755 nmap-parser.sh
```

Simply execute the script with the IP to scann an a file name for the raw data.

```Bash
./nmap-parser.sh <IP_TO_SCANN> <raw_file.raw>`
```

## Example of a report

![Html Report Image](/assets/htmlreport.png)



Feel free to use it :)
