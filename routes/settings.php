<?php

use Curl\Curl;

// ======================== MAIN SETTINGS 
$router->post('settings', function() {

    // INCLUDE CONFIG
    include "./config.php";

    if(isset($_POST['logo']) || !empty($_POST['logo'])) { $data['logo'] = $_POST['logo']; }
    if(isset($_POST['favicon']) || !empty($_POST['favicon'])) { $data['favicon'] = $_POST['favicon']; }
 
    $val = "business_name"; if(isset($_POST[$val]) || !empty($_POST[$val])) { $data[$val] = $_POST[$val]; }
    $val = "site_offline"; if(isset($_POST[$val]) || !empty($_POST[$val])) { $data[$val] = $_POST[$val]; }
    $val = "offline_message"; if(isset($_POST[$val]) || !empty($_POST[$val])) { $data[$val] = $_POST[$val]; }
    $val = "home_title"; if(isset($_POST[$val]) || !empty($_POST[$val])) { $data[$val] = $_POST[$val]; }
    $val = "meta_description"; if(isset($_POST[$val]) || !empty($_POST[$val])) { $data[$val] = $_POST[$val]; }
    
    $val = "guest_booking"; if(isset($_POST[$val]) || !empty($_POST[$val])) { $data[$val] = $_POST[$val]; }
    $val = "user_registration"; if(isset($_POST[$val]) || !empty($_POST[$val])) { $data[$val] = $_POST[$val]; }
    $val = "supplier_registration"; if(isset($_POST[$val]) || !empty($_POST[$val])) { $data[$val] = $_POST[$val]; }
    $val = "agent_registration"; if(isset($_POST[$val]) || !empty($_POST[$val])) { $data[$val] = $_POST[$val]; }
    $val = "javascript"; if(isset($_POST[$val]) || !empty($_POST[$val])) { $data[$val] = $_POST[$val]; }
    
    $val = "multi_language"; if(isset($_POST[$val]) || !empty($_POST[$val])) { $data[$val] = $_POST[$val]; }
    $val = "default_language"; if(isset($_POST[$val]) || !empty($_POST[$val])) { $data[$val] = $_POST[$val]; }
    $val = "multi_currency"; if(isset($_POST[$val]) || !empty($_POST[$val])) { $data[$val] = $_POST[$val]; }
    
    $val = "social_facebook"; if(isset($_POST[$val]) || !empty($_POST[$val])) { $data[$val] = $_POST[$val]; }
    $val = "social_twitter"; if(isset($_POST[$val]) || !empty($_POST[$val])) { $data[$val] = $_POST[$val]; }
    $val = "social_linkedin"; if(isset($_POST[$val]) || !empty($_POST[$val])) { $data[$val] = $_POST[$val]; }
    $val = "social_instagram"; if(isset($_POST[$val]) || !empty($_POST[$val])) { $data[$val] = $_POST[$val]; }
    $val = "social_google"; if(isset($_POST[$val]) || !empty($_POST[$val])) { $data[$val] = $_POST[$val]; }
    $val = "social_whatsapp"; if(isset($_POST[$val]) || !empty($_POST[$val])) { $data[$val] = $_POST[$val]; }
 
     // VALIDATION
     required('user_id');

    // UPDATE SETTINGS
    $data = $db->update("settings", $data , [ "user_id" => $_POST['user_id'], ]);

    if ($data->rowCount() == 1) {
    $respose = array ( "status"=>true, "message"=>"settings udpated", "data"=> $data );
    echo json_encode($respose);
    }
     
});

// ======================== MODULES
$router->post('modules', function() {
    
    // INCLUDE CONFIG
    include "./config.php";

    $data = $db->select("modules","*", [ 
        // "user_id" => $_POST['user_id'], 
    ]);

    $respose = array ( "status"=>true, "message"=>"modules data", "data"=> $data );
    echo json_encode($respose);

});


?>