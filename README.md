Automated nmap services scanner.

This script will execute the scann services of nmap and genarate a HTML file.

The HTML file will have all the filtered information of the scann, but to execute the script nicely
you have to specify the IP direction to scann and a file name to put all the raw information.


To use it:

Give permition to the script to execute

```bash
chmod 755 nmap-parser.sh
```

Execute:

```bash
./nmap-parser.sh <IP_TO_SCANN> <raw_file.raw>`
```

When the scann finished, the script it's going to create an html report with all the most 
important data of the scann.


Then the output will answer you if you wan to open the file with firefox.
In case you say yes the page made by firefox can look like this:

![Html Report Image](/assets/htmlreport.png)

If you choose no, the script stops and two files are created on the carpet, one with the 
raw data and the other one with the html report.

Feel free to use it :)
