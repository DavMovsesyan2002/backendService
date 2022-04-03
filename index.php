<?php
error_reporting(E_ALL);
ini_set('display_errors', 1);
header("Access-Control-Allow-Origin: *");
header("Access-Control-Allow-Headers: *");
header("Access-Control-Allow-Methods: *");

include 'DbConnect.php';
$objDb = new DbConnect;
$conn = $objDb->connect();

$method = $_SERVER['REQUEST_METHOD'];

class DeliveryClass {
    private $array = [];
    private $result = array();
    public function fastDelivery($values,$weight) {
           $price = 200;
           $date =  date('Y-m-d');
           $this->array = $values;
           if(isset($this->array[0])){
               if(date('H') < 18){
                    $response = [
                             'price' => ($this->array[0]['km'] % $price) * $weight,
                             'date' => date('Y-m-d', strtotime($date. ' + 5 days')),
                             'error' => '',
                             ];
               }else{
                $response = 'после 18.00 заявки не принимаются';
               }
           }else{
                $response = 'не найдено';
           }
        return $response;
    }
    public function slowDelivery($values,$weight) {
           $price = 150;
           $date =  date('Y-m-d');
           $this->array = $values;
           if(isset($this->array[0])){
               $response = [
               'price' => ($this->array[0]['km'] % $price) * $weight,
               'date' => date('Y-m-d', strtotime($date. ' + 8 days')),
               'error' => '',
               ];
           }else{
                $response = 'не найдено';
           }
        return $response;
    }
}

switch($method) {
    case "POST":
        $form = json_decode( file_get_contents('php://input') );
        $sql = "SELECT * FROM Fast_delivery WHERE targetKladr = '$form->where'";

        $path = explode('/', $_SERVER['REQUEST_URI']);

        if(isset($path[3]) && is_numeric($path[3])) {
            $sql .= " WHERE id = :id";
            $stmt = $conn->prepare($sql);
            $stmt->bindParam(':id', $path[3]);
            $stmt->execute();
            $result = $stmt->fetch(PDO::FETCH_ASSOC);
        } else {
            $stmt = $conn->prepare($sql);
            $stmt->execute();
            $result = $stmt->fetchAll(PDO::FETCH_ASSOC);
        }

        $delivery = new DeliveryClass;

        if($form->delivery === 'slow'){
           $response = $delivery->slowDelivery($result, $form->weight);
        }else{
           $response = $delivery->fastDelivery($result, $form->weight);
        }
        echo json_encode($response);
        break;
}