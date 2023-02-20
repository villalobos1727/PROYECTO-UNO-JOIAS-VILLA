<?php
    

    require_once 'head.php';
    require 'menu.php';
    include_once 'conexao.php';

    $pagatual = filter_input(INPUT_GET, "page", FILTER_SANITIZE_NUMBER_INT);
	$pag = (!empty($pagatual)) ? $pagatual : 1;

    $limitereg = 6;

    $inicio = ($limitereg * $pag) - $limitereg;

    $busca= "SELECT * from produto where idcategoria=3
    LIMIT $inicio , $limitereg";

    $resultado = $conn->prepare($busca);
    $resultado->execute();  
       
       
?>

<div class="container-fluid imagens">
        <div class="row">
            <div class="col-md-12 text-center">
            <h2>Coleção Infantil</h2>
         </div>

        <?php
        if (($resultado) AND ($resultado->rowCount() != 0)){
        while ($linha = $resultado->fetch(PDO::FETCH_ASSOC)) {
           
            extract($linha);             
        
        ?>    
            <div class="col-md-3">
                <div class="card" style="width: 25rem;">
                    <img class="card-img-top" src="<?php echo $foto; ?>">
                    <div class="card-body text-center">
                        <h3 class="card-text"><?php echo $nome; ?></h3>
                        <h4>Preço R$ <?php echo $valor; ?>,00</h4>
                       <form action="carrinho.php" method="post">
                            <h5>
                            <label>Quant</label>
                            <input type="number" name="quantcompra" value="1" style=width:45px;>
                            </h5>
                            <input type="hidden" name="codigoproduto" value="<?php echo $codigoproduto; ?>">
                            <input type="submit" class="btn btn-primary" value="comprar">                               

                        </form>
                    </div>
                </div> 
            </div>
        
    <?php         
    } 
}
?>

</div>
</div>

<?php
     //Contar os registros no banco
     $qtregistro = "SELECT COUNT(codigoproduto) AS registros FROM produto";
     $resultado = $conn->prepare($qtregistro);
     $resultado->execute();
     $resposta = $resultado->fetch(PDO::FETCH_ASSOC);

     //Quantidade de página que serão usadas - quantidade de registros
     //dividido pela quantidade de registro por página
     $qnt_pagina = ceil($resposta['registros'] / $limitereg);

      // Maximo de links      
      $maximo = 2;

      echo "<a href='relprodutos.php?page=1'>Primeira</a> ";
    // Chamar página anterior verificando a quantidade de páginas menos 1 e 
    // também verificando se já não é primeira página
    for ($anterior = $pag - $maximo; $anterior <= $pag - 1; $anterior++) {
        if ($anterior >= 1) {
            echo "  <a href='relprodutos.php?page=$anterior'>$anterior</a> ";
        }
    }

    //Mostrar a página ativa
    echo "$pag";

    //Chamar próxima página, ou seja, verificando a página ativa e acrescentando 1
    // a ela
    for ($proxima = $pag + 1; $proxima <= $pag + $maximo; $proxima++) {
        if ($proxima <= $qnt_pagina) {
            echo "<a href='relprodutos.php?page=$proxima'>$proxima</a> ";
        }
    }

    echo "<a href='relprodutos.php?page=$qnt_pagina'>Última</a> ";


?>

<?php
        require_once 'footer.php';

    ?>
 