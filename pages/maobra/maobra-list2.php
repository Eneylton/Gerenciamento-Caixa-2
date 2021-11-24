<?php
require __DIR__ . '../../../vendor/autoload.php';

use App\Db\Pagination;
use App\Entidy\Caixa;
use App\Session\Login;

define('TITLE','Contas a pagar');
define('BRAND','Caixa');


Login::requireLogin();


$buscar = filter_input(INPUT_GET, 'buscar', FILTER_SANITIZE_STRING);

$condicoes = [
    strlen($buscar) ? 'id LIKE "%'.str_replace(' ','%',$buscar).'%" or 
                       data LIKE "%'.str_replace(' ','%',$buscar).'%"' : null
];

$condicoes = array_filter($condicoes);

$where = implode(' AND ', $condicoes);

$qtd = Caixa:: getQtd($where);

$pagination = new Pagination($qtd, $_GET['pagina'] ?? 1, 100);

$listar = Caixa::getList(' m.id AS id,
m.data AS data,
m.descricao AS descricao,
m.tipo AS tipo,
m.status AS status,
m.dinheiro AS dinheiro,
m.cartao AS cartao,
m.debito AS debito,
m.pix AS pix,
m.veiculo AS veiculo,
m.placa AS placa,
m.transferencia AS transferencia,
mc.nome AS mecanico,
ct.nome AS categoria','maobra AS m
INNER JOIN
mecanicos AS mc ON (m.mecanicos_id = mc.id)
INNER JOIN
catdespesas AS ct ON (m.catdespesas_id = ct.id)',$where, 'm.id desc',$pagination->getLimit());

include __DIR__ . '../../../includes/layout/header.php';
include __DIR__ . '../../../includes/layout/top.php';
include __DIR__ . '../../../includes/layout/menu.php';
include __DIR__ . '../../../includes/layout/content.php';
include __DIR__ . '../../../includes/maobra/maobra2-form-list.php';
include __DIR__ . '../../../includes/layout/footer.php';

?>

<script>
$(document).ready(function(){
    $('.editbtn').on('click', function(){
        $('#editmodal').modal('show');

        $tr = $(this).closest('tr');

        var data = $tr.children("td").map(function(){
            return $(this).text();
        }).get();

        $('#id').val(data[0]);
        $('#data').val(data[1]);
        $('#valor').val(data[2]);
        $('#forma_pagamento_id').val(data[3]);
       
    });
});
</script>
