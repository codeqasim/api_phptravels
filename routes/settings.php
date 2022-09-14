<?php

// ======================== MAIN SETTINGS 
$router->post('settings', function() {

    // INCLUDE CONFIG
    include "./config.php";

    // VALIDATION
    required('user_id'); 

    updated("business_name");
    updated("site_offline");
    updated("offline_message");
    updated("home_title");
    updated("meta_description");

    updated("guest_booking");
    updated("user_registration");
    updated("user_registration");
    updated("supplier_registration");
    updated("agent_registration");
    updated("javascript");

    updated("multi_language");
    updated("default_language");
    updated("multi_currency");

    updated("social_facebook");
    updated("social_twitter");
    updated("social_linkedin");
    updated("social_instagram");
    updated("social_google");

    // UPDATE SETTINGS
    $data = $db->update("users", $data , [ "user_id" => $_POST['user_id'], ]);

    $data = $db->select("settings","*", [ "user_id" => $_POST['user_id'], ]);

    $respose = array ( "status"=>true, "message"=>"user app details", "data"=> $data );

    echo json_encode($respose);

});
// ======================== APP


?>