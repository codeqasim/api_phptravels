<?php

use Mailgun\Mailgun;

// ======================== LOGIN
$router->post('app', function() {

    // INCLUDE CONFIG
    include "./config.php";

    // VALIDATION
    required('email'); required('password');

    $data = $db->select("users","*", [
        "email" => $_POST['email'],
        "password" => md5($_POST['password']),
    ]);

    if(isset($data[0])) { 
    
        $user_data = (object)$data[0]; $respose = array ( "status"=> true, "message"=>"user details", "data"=> $user_data );

        // SAVE ACTIVITY LOGS
        $log_user_id = $user_data->id;
        $log_type = "login";
        $log_desc = $user_data;

        // LOG SEND EMAIL
        $log_mail = true;
        $log_mail_name = $user_data->first_name;
        $log_send_email = $user_data->email;
        $log_mail_subject = "User Login";
        $log_mail_title = "Account Login";
        $log_mail_content = "This is to inform you that you just logged at our portal with IP ". get_client_ip();
        
        include "./logs.php";

    } else {
    $respose = array ( "status"=>false, "message"=>"no user found", "data"=> null );
}

echo json_encode($respose);

});
// ======================== LOGIN


?>