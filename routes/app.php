<?php

use Mailgun\Mailgun;

// ======================== LOGIN
$router->post('app', function() {

    // INCLUDE CONFIG
    include "./config.php";

    // VALIDATION
    required('user_id'); 

    $data = $db->select("settings","*", [
        "user_id" => $_POST['user_id'],
    ]);

    $respose = array ( "status"=>true, "message"=>"user app details", "data"=> $data );

echo json_encode($respose);

});
// ======================== LOGIN


?>