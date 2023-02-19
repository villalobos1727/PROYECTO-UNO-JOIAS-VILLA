<?php

$host = "localhost";
$user = "root";
$pass = "";
$dbname = "joias";
$port = 3306;

try{
    
    $conn = new PDO("mysql:host=$host;port=$port;dbname=" . $dbname, $user, $pass);
  
	//	echo "Conexão com banco de dados realizado com sucesso!";
}catch(PDOException $erro){
    echo "Erro: Conexão com banco de dados não realizada".$erro; 
}

?>