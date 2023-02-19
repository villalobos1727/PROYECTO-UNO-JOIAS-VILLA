<?php
    require_once 'head.php';
    require_once 'menu.php';


?>

    <section class="first-section" id="home">
        
        <div class="conteudo-principal">
            <h1></h1>
            <h2>Deixe-nos realizar Seu Sonho,Temos As Melhores Joias</h2>
            <div class="btn">
                
            </div>
        </div>    
    </section>    

    <section class="sobre-nos" id="sobrenos"> 
        <div class="main">
            <div class="contentsobre">
                <h2>Sobre nós</h2>
                <p>Nossa joalheria é unica somos epecialistas em realizar sonhos,nossa empresa nasceu do sonho de 3 amigas que são apaixonada por joias e beleza,nossos produtos são confeccionados com tecnologia e obra prima,tudo com um toque único nossas peças são feitas sob encomenda,deixe-nos realizar seus sonhos. 
                </p>
            </div>     
            <div class="img-joias">
                <img src="./img/VJ.png" alt="PÉROLA">
            </div>
        </div>    
    </section>

    <section class="joias" id="joias">
        <h2>Nossas Joias</h2>

            <div class="container-fluid itens-">
                <div class="row">

                    <div class="col-md-3">
                        <div class="pulseira feminina">
                            <a href="feminina.php"> <img src="./img/feminina.webp" alt="pulseira" style=width:300px;height:300px;></a>
                            <div class="info">
                                <h3>Coleção feminina</h3>                                
                               
                            </div>   
                        </div>
                    </div>


                    <div class="col-md-3">
                        <div class="pulseira masculina">
                            <a href="masculino.php"><img src="./img/masculino.jpg" alt="pulseira" style=width:300px;height:300px;></a>
                            <div class="info">
                                <h3>coleção masculina</h3>
                                
                            </div>                         
                        </div>
                    </div>

                <div class="col-md-3">
                    <div class="pulseira bebe">
                    <a href="infantil.php"><img src="./img/infantil.jpeg" alt="colar" style=width:300px;height:300px;></a>
                        <div class="info">
                            <h3>Coleção infantil</h3>
                            
                        </div>                 
                    </div>
                </div>

                <div class="col-md-3">
                    <div class="acessorios">
                    <a href="acessorios.php"><img src="./img/acessorio.webp" alt="anél" style=width:300px;height:300px;></a>
                        <div class="info">
                            <h3>Acessorios</h3>
                            ,
                        </div>                 
                    </div>
                </div>

            </div>


                       </div>

    </section>

   <?php

   require_once 'footer.php';

   ?>