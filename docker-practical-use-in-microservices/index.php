<html>
    <head>
        <title>PHP Example Page</title>
    </head>
    <body>

        <?php
        ini_set("display_errors", 1);
        header('Content-Type: text/html; charset=iso-8859-1');


        echo 'PHP Version: ' . phpversion() . '<br>';

        $servername = "192.168.0.11"; // ip example
        $username = "root";
        $password = "pass123";
        $database = "mydata";

        // Create Connection
        $link = new mysqli($servername, $username, $password, $database);

        /* Check connection */
        if (mysqli_connect_errno()) {
            printf("Connect failed: %s\n", mysqli_connect_error());
            exit();
        }

        $valor_rand1 =  rand(1, 999);
        $valor_rand2 = strtoupper(substr(bin2hex(random_bytes(4)), 1));
        $host_name = gethostname();


        $query = "INSERT INTO client (Id, FirstName, LastName, Adrees, City, Host) VALUES ('$valor_rand1' , '$valor_rand2', '$valor_rand2', '$valor_rand2', '$valor_rand2','$host_name')";


        if ($link->query($query) === TRUE) {
        echo "New record created successfully";
        } else {
        echo "Error: " . $link->error;
        }

        ?>
    </body>
</html>