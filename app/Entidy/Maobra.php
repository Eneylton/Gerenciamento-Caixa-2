<?php

namespace App\Entidy;

use \App\Db\Database;

use \PDO;

class Maobra  
{

    public $id;
    public $cartao;
    public $dinheiro;
    public $debito;
    public $pix;
    public $transferencia;
    public $veiculo;
    public $placa;
    public $descricao;
    public $status;
    public $servicos;
    public $mecanicos_id;
    public $movimentacoes_id;

    public function cadastar()
    {


        $obdataBase = new Database('movimentacoes');

        $this->id = $obdataBase->insert([

            'cartao'                   => $this->cartao,
            'dinheiro'                 => $this->dinheiro,
            'debito'                   => $this->debito,
            'pix'                      => $this->pix,
            'transferencia'            => $this->transferencia,
            'veiculo'                  => $this->veiculo,
            'placa'                    => $this->placa,
            'descricao'                => $this->descricao,
            'status'                   => $this->status,
            'servicos'                 => $this->servicos,
            'mecanicos_id'             => $this->mecanicos_id,
            'movimentacoes_id'         => $this->movimentacoes_id
            

        ]);

        return true;
    }


    public function atualizar()
    {
        return (new Database('movimentacoes'))->update('id = ' . $this->id, [
            
            'cartao'                   => $this->cartao,
            'dinheiro'                 => $this->dinheiro,
            'debito'                   => $this->debito,
            'pix'                      => $this->pix,
            'transferencia'            => $this->transferencia,
            'veiculo'                  => $this->veiculo,
            'placa'                    => $this->placa,
            'descricao'                => $this->descricao,
            'status'                   => $this->status,
            'servicos'                 => $this->servicos,
            'mecanicos_id'             => $this->mecanicos_id,
            'movimentacoes_id'         => $this->movimentacoes_id
        ]);
    }

    public static function getList($fields = null, $table = null, $where = null, $order = null, $limit = null)
    {

        return (new Database('movimentacoes'))->select($fields, $table, $where, $order, $limit)
            ->fetchAll(PDO::FETCH_CLASS, self::class);
    }

    public static function getListOne($fields = null, $table = null, $where = null, $order = null, $limit = null)
    {

        return (new Database('movimentacoes'))->select($fields, $table, $where, $order, $limit)
        ->fetchObject(self::class);
    }



    public static function getQtd($fields = null, $table = null, $where = null, $order = null, $limit = null)
    {

        return (new Database('movimentacoes'))->select('COUNT(*) as qtd', 'movimentacoes', null, null)
            ->fetchObject()
            ->qtd;
    }


    public static function getID($fields, $table, $where, $order, $limit)
    {
        return (new Database('movimentacoes'))->select($fields, $table, 'id = ' . $where, $order, $limit)
            ->fetchObject(self::class);
    }


    public function excluir()
    {
        return (new Database('movimentacoes'))->delete('id = ' . $this->id);
    }


    public static function getUsuarioPorEmail($email)
    {

        return (new Database('movimentacoes'))->select('email = "' . $email . '"')->fetchObject(self::class);
    }
}
