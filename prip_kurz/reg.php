<?php

// zahrneme def. konstant
require "const.php";

// zahrnuti navigace
require "nav/nav.php";
?>

<h1>Registrace</h1>

<?php

// pokud form. odeslan, pak zaznam ulozime do DB
if (isset($_POST["email"])) { // isset() vraci true
                              // pokud hodnota je nastavena
    echo "formular odeslan".BR;
    echo "email:".$_POST["email"].BR;
    echo "heslo:".$_POST["heslo"].BR;
    echo "telefon:".$_POST["telefon"].BR;
    echo BR.BR;

    // TODO - sestavime SQL INSERT into uzivatele...
    $sql = "insert into uzivatele(email, heslo, telefon)\n"
    ."values('".$_POST["email"]."', '".$_POST["heslo"]
        ."', '".$_POST["telefon"]."')";
    
    echo $sql.BR;

    // pripojeni k DB (WB - Tools - ...)
    $host="localhost";
    $port=3306;
    $socket="";
    $user="root";
    $password="root";
    $dbname="prip_kurz";

    $con = new mysqli($host, $user, $password, $dbname, $port, $socket)
        or die ('Could not connect to the database server' . mysqli_connect_error());
    
    // vykonani insertu
    if(mysqli_query($con, $sql)) {
        echo "provedeno".BR;
    } else {
        echo "chyba:".mysqli_error($con).BR;
    }
    
    

//$con->close();


    exit(); // ukonceni .php 

} /*else {
    echo "formular zatim nebyl odeslan";
}*/

?>

<form method="POST" action="pokus14.1.php">
    <input type="hidden" name="action" value="submited"/>
    <!-- id -- nutne mit sekvenci -->
    <label for="email">*Email:</label>

    <input id="email" type="email" name="email" required />
    <br/>
    <label for="heslo">*Heslo:</label>

    <input id="heslo" type="password" name="heslo" required />
    <br/>
    <label for="heslo">Telefon:</label>

    <input id="telefon" type="tel" name="telefon"
        pattern="[0-9]{3}[0-9]{3}[0-9]{3}"/>
    <br/>
    <input type="submit" value="Zaregistrovat">
</form>