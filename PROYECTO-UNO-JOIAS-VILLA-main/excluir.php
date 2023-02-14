<?php  
  require_once 'head.php';
  include_once 'conexao.php';
  session_start();
  ob_start();

  $id = filter_input(INPUT_GET, "matricula", FILTER_SANITIZE_NUMBER_INT);

  if (empty($id)) {
      $_SESSION['msg'] = "Erro: Cliente não encontrado!";
      header("Location: relcliente.php");
      exit();
  }


  //EXCLUSÃO PERMANENTE
 /* $sql = "DELETE from cliente where matricula = $id LIMIT 1";
  $resultado= $conn->prepare($sql);
  $resultado->execute(); */

  //INATIVANDO O CLIENTE
  $sql = "UPDATE cliente set status='I' where cpf = $id LIMIT ";
  $resultado= $conn->prepare($sql);
  $resultado->execute();



  if(($resultado) AND ($resultado->rowCount() != 0)){
    echo "<script>
    alert('Cliente excluido com sucesso!');
    parent.location = 'relcliente.php';
    </script>";

  }else{
    echo "<script>
    alert('Exclusão não realizada!');
    parent.location = 'relcliente.php';
    </script>";
  }

?>


