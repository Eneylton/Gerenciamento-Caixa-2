<?php 

require __DIR__.'../../../vendor/autoload.php';

use App\Entidy\Maobra;
use App\Session\Login;
use App\Entidy\Movimentacao;

$previous = "javascript:history.go(-1)";
if (isset($_SERVER['HTTP_REFERER'])) {
  $previous = $_SERVER['HTTP_REFERER'];
}

$usuariologado = Login:: getUsuarioLogado();

$usuarios_id = $usuariologado['id'];

Login::requireLogin();

if(isset($_POST['idcaixa'])){

    $din1               = $_POST['dinheiro'];
    $din2               = str_replace(".", "", $din1);
    $preco1             = str_replace(",", ".",$din2);

    $cart1              = $_POST['credito'];
    $cart2              = str_replace(".", "", $cart1);
    $preco2             = str_replace(",", ".",$cart2);

    $deb1               = $_POST['debito'];
    $deb2               = str_replace(".", "", $deb1);
    $preco3             = str_replace(",", ".",$deb2);

    $deb1               = $_POST['pix'];
    $deb2               = str_replace(".", "", $deb1);
    $preco4             = str_replace(",", ".",$deb2);

    $transf1            = $_POST['transferencia'];
    $transf2            = str_replace(".", "", $transf1);
    $preco5             = str_replace(",", ".",$transf2);


    $maobra1            = $_POST['maobra'];
    $maobra2            = str_replace(".", "", $maobra1);
    $maobra5            = str_replace(",", ".",$maobra2);

    if(empty($_POST['mecanicos_id'])){
      $mec = 14;
    }else{
      $mec = $_POST['mecanicos_id'];
    }


    if(!empty($_POST['maobra'])){

      if($_POST['dinheiro']){

        $obra = new Maobra;

        $obra->dinheiro = $preco1;
        $obra->caixa_id = $_POST['idcaixa'];
        $obra->veiculo = $_POST['veiculo'];
        $obra->placa = $_POST['placa'];
        $obra->descricao = $_POST['descricao'];
        $obra->mecanicos_id = $mec;
        $obra->servico = "SERVIÇOS MECÊNANICOS";
        $obra->status = 0;
        $obra->tipo = 0;
        $obra->cadastar();
        
      }
    }

    $item = new Movimentacao;
    $item->catdespesas_id = $_POST['catdespesas_id'];
    $item->status = $_POST['status'];
    $item->tipo = $_POST['tipo'];
    $item->descricao = $_POST['descricao'];
    $item->dinheiro = $preco1;
    $item->cartao = $preco2;
    $item->debito = $preco3;
    $item->pix = $preco4;
    $item->transferencia = $preco5;
    $item->caixa_id = $_POST['idcaixa'];
    $item->veiculo = $_POST['veiculo'];
    $item->placa = $_POST['placa'];
    $item->mecanicos_id = $mec;
    $item->maobra =  $maobra5;
    $item->cadastar();

    header('location: movimentacao-list.php?id='.$_POST['idcaixa']);

    exit;
}

