<?php
    session_start();
    ob_start();

    require_once 'conexao.php';


    if(isset($_POST["excluir"])){

        $codigoproduto = $_POST["excluir"];
    
        $sqlexcluir = "DELETE from carrinho where codigoproduto = $codigoproduto";
        $resulexcluir=$conn->prepare($sqlexcluir);
        $resulexcluir->execute();
        $_SESSION["quant"]-=1;
}else{
    if(!isset($_SESSION['nome'])){
        $_SESSION["carrinho"] = true;
        echo "<script>
        alert('faça Login para Finalizar sua Compra!!!');
        parent.location = 'login.php';
        </script>";
    }
    else{
        //acessar pagamento;
        $data = date('y-m-d');
        $valor = $_SESSION["totalcompra"];
        $matricula = $_SESSION["matricula"];

        $sqlvenda = "INSERT into venda(data,valor,matricula)values(:data,:valor,:matricula)";
        $salvarvenda= $conn->prepare($sqlvenda);
        $salvarvenda->bindParam(':data',$data, PDO::PARAM_STR);
        $salvarvenda->bindParam(':valor', $valor, PDO::PARAM_STR);
        $salvarvenda->bindParam(':matricula', $matricula, PDO::PARAM_INT);
        $salvarvenda->execute();
        
        $venda = "Select LAST_INSERT_ID()";
        $resulvenda=$conn->prepare($venda);
        $resulvenda->execute();

        $linhavenda = $resulvenda->fetch(PDO::FETCH_ASSOC);

        $idvenda = ($linhavenda["LAST_INSERT_ID()"]);

        $busca = "select * from carrinho";
        $resulbusca=$conn->prepare($busca);
        $resulbusca->execute();

        if(($resulbusca) && ($resulbusca->rowCount()!=0)){
            while ($linha = $resulbusca->fetch(PDO::FETCH_ASSOC)) {
                extract($linha);

                $sqlitem = "insert into item(codigoproduto,idvenda,quantcompra,valor)
                values(:codigoproduto,:idvenda,:quantcompra,:valor)";
                $salvaritem= $conn->prepare($sqlitem);
                $salvaritem->bindParam(':codigoproduto',$codigoproduto, PDO::PARAM_INT);
                $salvaritem->bindParam(':idvenda', $idvenda, PDO::PARAM_INT);
                $salvaritem->bindParam(':quantcompra', $quantcompra, PDO::PARAM_INT);
                $salvaritem->bindParam(':valor', $valor, PDO::PARAM_STR);
                $salvaritem->execute();
                
                 /*fazer a atualizaçao do estoque*/

                 $estoque = "UPDATE produto set quantidade=(quantidade - $quantcompra)
                 where codigoproduto = $codigoproduto";
                 $atualiza= $conn->prepare($estoque);
                 $atualiza->execute();
                

            }
        }

        /*delete o carrinho*/

        $sqllimpa = "delete from carrinho";
        $limpa= $conn->prepare($sqllimpa);
        $limpa->execute();
        $_SESSION["quant"] = 0;

        


        header("location:index.php");
    }
}

?>
