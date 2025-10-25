table_nmap() {
    for i in xx*; do 
        host_ip=$(grep -E 'Nmap scan report' $i | grep -E -o '[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}')
        if [ $host_ip ]; then
                echo "<tr>"
                echo "  <td>$host_ip</td>"
            # Obtaining the open ports
            open_ports=$(grep -h -E '^[0-9]{1,5}/(tcp|udp) open' $i | grep -E -o '^[0-9]{1,5}/(tcp|udp)')
            if [ "$open_ports" ]; then
                echo "  <td>$open_ports</td>"
            else
                echo "<td>No open ports or unreachble</td>"
            fi
            # Obtaining the service
            services=$(grep -h -E '^[0-9]{1,5}/(tcp|udp) open' $i | grep -E -o '  [a-z].?[a-z].?[a-z].?  ')
            if [ "$services" ]; then
                echo "  <td>$services</td>"
            else
                echo "<td>Not executing service or unreachble</td>"
            echo "</tr>"
            fi
        fi
    done
}
generate_html() {
  cat << EOF

<html>
    <head>
        <title>$TITLE</title>
        <style>
    table {
        font-family: arial, sans-serf;
        border-collapse: collapse;
        width: 100%;
    }

    td, th {
        border: 1px solid #dddddd;
        text-align: left;
        padding: 8px;
    }

    tr:nth-child(even) {
        background-color: #dddddd;
    }
        </style>
    </head>
    <body>
        <h1>Results from nmap service scanning</h1>
        <p1>$TIME_STAMP</p1>
        <h2>Service scanning</h2>
        <table>
            <tr>
                <th>Host IP</th>
                <th>Open ports</th>
                <th>Service</th>
            </tr>
            $(table_nmap)
        </table>
    </body>
</html>

EOF
}


