<?php

use Medoo\Medoo;
use Mailgun\Mailgun;

// ======================== SIGNUP
$router->post('signup', function() {

    // INCLUDE CONFIG
    include "./config.php";

        // VALIDATION
        required('first_name'); required('last_name'); required('phone'); required('email'); required('password');

        $mob = $new_str = str_replace(' ', '', $_POST['phone']); 
        $phone = preg_replace('/[^A-Za-z0-9\-]/', '', $mob); // removes special chars.
        $mail_code = rand(100000, 999999);
 
        // EMAIL EXIST VALIDATION
        $exist_mail = $db->select('users', [ 'email', ], [ 'email' => $_POST['email'], ]);
        if (isset($exist_mail[0]['email'])) { 
            $respose = array ( "status"=>false, "message"=>"email already exist.", "data"=> "" );
            echo json_encode($respose);
            die;
        }

        // GENERATE RANDOM CODE FOR EMAIL
        $mail_code = rand(100000, 999999);

        // UUID
        $rand = rand(100, 99);
        $date = date('Ymdhis');
        $user_id = $date.$rand;

        $password = md5($_POST['password']);
        $date = date('Y-m-d H:i:s');

        // REF ID CHECK
        if (isset($_POST['agency_id']) && (!empty($_POST['agency_id']))) { $agency_id = $_POST['agency_id']; } else { $agency_id = ""; }

        $db->insert("users", [
            "user_id" => $user_id,
            "agency_id" => $agency_id,
            "first_name" => $_POST['first_name'],
            "last_name" => $_POST['last_name'],
            "email" => $_POST['email'],
            "phone" => $phone,
            "email_code" => $mail_code,
            "password" => $password,
            "created_at" => $date,
        ]);

        $user_id = $db->id();
        $user_info = $db->select("users","*", [ "id" => $user_id ]);

        $respose = array ( "status"=>true, "message"=>"account registered successfully.", "data"=> $user_info );
        echo json_encode($respose);

        require_once "./mail.php";
        $mail = [
            'name'=>"qasim",
            'email'=>$_POST['email'],
            'subject'=>'Account Activation',
            'content_title'=>'Account Activation',
            'content'=>'Thank you for the signup. Please click on the link below to activate your account.',
            'link'=>"link".'activate?email='.$_POST['email'].'&code='.$mail_code,
            'code'=> ''
        ];
        mailer($mail);

});
// ======================== SIGNUP

$router->get('testmail', function() {

    $SENDER_DOMAIN = "mail.phptravels.com";
    $MAILGUN_FROM_EMAIL = "info@mail.phptravels.com";
    $mg = Mailgun::create("key-528ca6d92f9006dea5fdb43e68464ee8"); // API PUBLIC KEY

    $mg->messages()->send($SENDER_DOMAIN, [
        'from'    => 'PHPTRAVELS <noreply@phptravels.com>',
        'to'      => 'qasim <compoxition@gmail.com>',
        'subject' => 'test',
        'template'    => 'global',
        'h:X-Mailgun-Variables'    => '{
            "link": "link",
            "code":"code",
            "title":"test",
            "content_title":"content title",
            "content":"content"
        }'
    ]);
 
    print_r($mg);

});

// ======================== LOGIN
$router->post('login', function() {

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

        // SAVE USER ACTIVITY TO LOGS
        $date = date('Y-m-d H:i:s');
        $db->insert("logs", [
            "user_id" => $user_data->id,
            "type" => "login",
            "datetime" => $date,
            "description" => json_encode($user_data),
        ]);

    } else {
    $respose = array ( "status"=>false, "message"=>"no user found", "data"=> null );
}

echo json_encode($respose);

});
// ======================== LOGIN

$router->post('update-user', function() {



    if(isset($_POST['first_name']) || !empty($_POST['first_name'])) { $data['first_name'] = $_POST['first_name']; }
    if(isset($_POST['last_name']) || !empty($_POST['last_name'])) { $data['last_name'] = $_POST['last_name']; }
    if(isset($_POST['gender']) || !empty($_POST['gender'])) { $data['gender'] = $_POST['gender']; }
    if(isset($_POST['email']) || !empty($_POST['email'])) { $data['email'] = $_POST['email']; }
    if(isset($_POST['mobile']) || !empty($_POST['mobile'])) { $data['mobile'] = $_POST['mobile']; }
    if(isset($_POST['password']) || !empty($_POST['password'])) { $data['password'] = md5($_POST['password']); }
    if(isset($_POST['country_code']) || !empty($_POST['country_code'])) { $data['country_code'] = $_POST['country_code']; }
    if(isset($_POST['state_code']) || !empty($_POST['state_code'])) { $data['state_code'] = $_POST['state_code']; }
    if(isset($_POST['city_code']) || !empty($_POST['city_code'])) { $data['city_code'] = $_POST['city_code']; }
    if(isset($_POST['skill_id']) || !empty($_POST['skill_id'])) { $data['skill_id'] = $_POST['skill_id']; }
    if(isset($_POST['skill_tags']) || !empty($_POST['skill_tags'])) { $data['skill_tags'] = $_POST['skill_tags']; }
    if(isset($_POST['img']) || !empty($_POST['img'])) { $data['img'] = $_POST['img']; }

    include "db.php";
    $data = $db->update("users", $data , [
    "id" => $_POST['id'],
    ]);

    if ($data->rowCount() == 1) {

        $respose = array ( "status"=>"true", "message"=>"profile updated", "data"=> $data );
        } else {
        $respose = array ( "status"=>"false", "message"=>"no user found", "data"=> null );
    }

    echo json_encode($respose);

});

// ======================== UPLOAD IMAGE FOR PROFILES
$router->post('forget-password', function() {

    // file_put_contents("post.log", print_r($_REQUEST, true));

    include "db.php";

    // CHECK EMAIL
    $user = $db->select("users", "*", [ "email" => $_POST['email'] ]);

        if (isset($user[0]['status'])) {

            if ($user[0]['status'] == 1) {

                // CHANGE PASSWORD
                $newpass = rand(100000, 999999);
                $data = $db->update("users", [
                "password" => md5($newpass),
                ], [ "email" => $_POST['email'], ]);

                // IF UPDATED SUCCESSFULLY
                if ($data->rowCount() == 1) {

                    $respose = array ( "status"=>"true", "message"=>"password updated", "data"=> $data );

                    require_once "mail.php";
                    $mail = [
                        'name'=>'Hello '.$user[0]['first_name'],
                        'email'=>$_POST['email'],
                        'subject'=>'Password Reset',
                        'content_title'=>'Reset Password',
                        'content'=>'Your pasasword has been reset. find new password below',
                        'link'=>$weblink.'login',
                        'code'=> $newpass
                    ];
                    mailer($mail);

                }

            }
        } else {
            $respose = array ( "status"=>"false", "message"=>"no user found", "data"=> null );
        }

    echo json_encode($respose);

});



// ======================== EMAIL VERIFICATION

$router->post('activate', function() {

    // file_put_contents("post.log", print_r($_POST, true));

    if(isset($_POST['email']) && trim($_POST['email']) !== "") {} else { echo "email - param or value missing "; die; }
    if(isset($_POST['code']) && trim($_POST['code']) !== "") {} else { echo "code - param or value missing "; die; }

    // UPDATE USER STATUS
    include "db.php";
    $data = $db->update("users", [ "status" => 1, ], [
    "email" => $_POST['email'],
    "email_code" => $_POST['code']
    ]);

    if ($data->rowCount() == 1) {

        // GET USER INFO
        $mail = $db->select('users', [ 'email','id','status' ], [ 'email' => $_POST['email'], ]);

        $respose = array ( "status"=>"true", "message"=>"account activated successfully.", "data"=> $mail[0] );
        echo json_encode($respose);
    } else {
        $respose = array ( "status"=>"false", "message"=>"account activation failed.", "data"=> null );
        echo json_encode($respose);
    }

});

// ======================== ACCOUNT DETAILS
$router->post('account', function() {

    // file_put_contents("post.log", print_r($_POST, true));
    if(isset($_POST['id']) && trim($_POST['id']) !== "") {} else { echo "id - param or value missing "; die; }

    // UPDATE USER STATUS
    include "db.php";

    $data = $db->select("users", "*", [ "id" => $_POST['id'] ]);

    if(empty($data)){echo(json_encode('No Results Found')); die;}

    $skill_name =  $db->select("skills", "*", [ "id" => $data[0]['skill_id'] ]);
    if (isset($skill_name[0]['text'])) { $skill = $skill_name[0]['text']; } else { $skill = ""; }
    $data[0]['skill_name'] = $skill;

    // GET CITY NAME
    $city_name = $db->select("cities", "*", [ "id" => $data[0]['city_code'], ]);
    if (isset($city_name[0]['name'])) { $city = $city_name[0]['name']; } else { $city = ""; }

    $data[0]['city_name'] = $city;
    if (!empty($data)) {

    $part = explode("/", urldecode($data[0]['img']));
    $brand = ($part[3]);
    $branch = ($part[6]);
    $image_name = ($part[7]);
    $img = 'https://res.cloudinary.com/'.$brand.'/image/upload/w_100,,c_scale/'.$branch.'/'.$image_name.'';

    $data[0]['image'] = $img;
    $d = (object)($data[0]);

    // array_replace($data, $data['img']);
    // } else { $img = "/assets/img/no-image.webp"; }

    echo(json_encode($d));

    }

});

// ======================== ADD VISIT
$router->post('add-visit', function() {

    // file_put_contents("post.log", print_r($_POST, true));
    if(isset($_POST['id']) && trim($_POST['id']) !== "") {} else { echo "id - param or value missing "; die; }

    // UPDATE USER STATUS
    include "db.php";
    $data = $db->update("users", [ "views[+]" => 1 ],[ "id" => $_POST['id'] ]);
    echo(json_encode($data));

});

// ======================== COUNTRIES LIST
$router->post('countries', function() {

    // SHOW ALL COUNTRIES
    include "db.php";
    $data = $db->select("countries", "*", [  ]);
    echo(json_encode($data));

});

// ======================== STATES LIST
$router->post('states', function() {

    // SHOW ALL COUNTRIES
    include "db.php";
    $data = $db->select("states", "*", [ "country_code" => $_POST['country_code'] ]);
    echo(json_encode($data));

});

// ======================== STATE
$router->post('state', function() {

    // SHOW ALL COUNTRIES
    include "db.php";
    $data = $db->select("states", "*", [ "id" => $_POST['id'] ]);
    echo(json_encode($data));

});

// ======================== CITIES LIST
$router->post('cities', function() {

    // SHOW ALL COUNTRIES
    include "db.php";
    $data = $db->select("cities", "*", [ "state_id" => $_POST['state_code'] ]);
    echo(json_encode($data));

});

// ======================== CITY
$router->post('city', function() {

    // SHOW ALL COUNTRIES
    include "db.php";
    $data = $db->select("cities", "*", [ "id" => $_POST['id'] ]);
    echo(json_encode($data));

});

// ======================== CITY NAME
$router->get('cities-search', function() {

    // file_put_contents("post.log", print_r($_REQUEST, true));

    // SHOW ALL CITIES
    include "db.php";
    $data = $db->select("cities", "*", [ "name[~]" => $_REQUEST['name'] ]);
    echo(json_encode($data));

});

// ======================== SKILLS LIST
$router->get('skills', function() {

    // SHOW ALL CITIES
    include "db.php";
    $c = $db->select("skills_categories", "*", );


    $items = array();
    foreach ($c as $i) {

        $s = $db->select("skills", "*", [ "parent_id" => $i['id'] ]);

        $items[] = array(
            "id" => $i['id'],
            "text" => $i['name'],
            "children" => $s
         );
    }

    echo(json_encode($items));


    // echo "[";

    // // LOOP TO GET ALL SKILLS
    // foreach ($c as $i => $sc) {


    //     $array = array(
    //         "id" => $sc['id'],
    //         "name" => $sc['name'],
    //         "skills" => $s
    //     );

    //     $ar = $array;
    //     echo(json_encode($ar));
    //     echo ",";

    // }

    // echo "]";



//     $data = $db->select("skills_categories", [

//         "[>]skills" => ["id"]
//     ]
//     ,[
//         "skills_categories.id",
//         "skills_categories.name",

//             "child" => [
//                 [
//                     "skills.name"

//                 ]
//             ]
//     ]
// );

//     echo json_encode($data);

 });



$router->post('account/verification', function() {

    if(isset($_POST['mobile']) && trim($_POST['mobile']) !== "") {} else { echo "mobile - param or value missing "; die; }

    include "db.php";

    $mobile = mysqli_real_escape_string($mysqli, $_POST['mobile']);

    $query = $mysqli->query("SELECT * FROM `accounts` WHERE `mobile` = '".$mobile."'")->fetch_object();

    // IF EMAIL FOUND
    if (isset($query->email_verification)) { $response = $query->email_verification; } else {
    $respose = array ( "status"=>"false", "message"=>"no account found with this mobile number", "data"=> "" );
    echo json_encode($respose);
    die; }

    if ($response  == 1 ) {
        $respose = array (
        "status"=>"true",
        "message"=>"account infromation.",
        "email_verification"=> $query->email_verification,
        "mobile_verification"=> $query->mobile_verification,
        "docs_verification"=> $query->docs_verification,
        "social_verification"=> $query->social_verification,
        "data"=> $query,
         );
    } else {
        $respose = array (
        "status"=>"true",
        "message"=>"account infromation.",
        "email_verification"=> $query->email_verification,
        "mobile_verification"=> $query->mobile_verification,
        "docs_verification"=> $query->docs_verification,
        "social_verification"=> $query->social_verification,
        "data"=> $query,
    );
    }

    echo json_encode($respose);

});

$router->post('account/resend_verification_email', function() {
    include "db.php";
    if(isset($_POST['mobile']) && trim($_POST['mobile']) !== "") {} else { echo "mobile - param or value missing "; die; }
    $mob = $new_str = str_replace(' ', '', $_POST['mobile']);
    $mobile = preg_replace('/[^A-Za-z0-9\-]/', '', $mob); // removes special chars.

    $q = $mysqli->query("SELECT * FROM `accounts` WHERE `mobile` = '".$mobile."'")->fetch_object();

    // VALIDATION
    if(isset($q->email) && trim($q->email) !== "") {} else {
        $respose = array ( "status"=>"false", "message"=>"no account found with this number contact support", "data"=> '' );
        echo json_encode($respose);
     die; }

    // print_r($q->email);

    // include "mail.php";
    // $mg->messages()->send($SENDER_DOMAIN, [
    //     'from'    => 'Khudcar <postmaster@khudcar.com>',
    //     'to'      => ''.$q->name.' <'.$q->email.'>',
    //     'subject' => 'Hello '.$q->name.'',
    //     'template'    => 'signup_khudar',
    //     'h:X-Mailgun-Variables'    => '{"link": "https://khudcar.com/accounts/verification/email/'.$q->email_code.'/'.$q->mobile.'"}'
    // ]);

    $respose = array ( "status"=>"true", "message"=>"email verification sent please check your mailbox if not found check spam folder", "data"=> $q );
    echo json_encode($respose);

});


// ======================== FORGET PASSWORD
$router->post('login-reset', function() {
    include "db.php";

    // VALIDATION
    if(isset($_POST['email']) && trim($_POST['email']) !== "") {} else { echo "email - param or value missing "; die; }

    if ($_SERVER['REQUEST_METHOD']=$_POST){

        $email = $new_str = str_replace(' ', '', $_POST['email']);

        $new_password = rand(100000, 999999);

        // echo $new_password; die;

        $user = $mysqli->query('SELECT * FROM accounts WHERE email = "'.$email.'"')->fetch_object();

        // print_r(json_encode($user_info));

        if ($user == null ) {
            $respose = array ( "status"=>"false", "message"=>"invalid email", "data"=> null );
            echo json_encode($respose);
        } else {

            $query = "UPDATE `accounts` SET `password` = '".md5($new_password)."' WHERE `accounts`.`email` = '".$email."';";

            $result = mysqli_query($mysqli, $query);

            $respose = array ( "status"=>"true", "message"=>"password updated successfully","password" => $new_password, "data"=> $user );
            echo json_encode($respose);

            $mail = [
                'name'=>$user->first_name,
                'email'=>$_POST['email'],
                'subject'=>'Password Reset',
                'content_title'=>'Your password has been reset',
                'content'=>'Please find your new password below',
                'link'=>'',
                'code'=>$new_password
            ];
            mailer($mail);

        }

    }
});

// ======================== USER PROFILE
$router->post('user_profile', function() {

    include "db.php";
    $user_info = $mysqli->query('SELECT * FROM accounts WHERE id = "'.$_POST['user_id'].'"')->fetch_object();
        if ($mysqli == false ) {
            $respose = array ( "status"=>"false", "message"=>"email exist please try with new credentials.", "data"=> $user_info );
            die;
        } else {
            $respose = array ( "status"=>"true", "message"=>"account found successfully.", "data"=> $user_info );
        }
        echo json_encode($respose);
});

// ======================== UPLOAD DOCS
$router->post('account/verification/upload-docs', function() {
    include "db.php";

    // print_r($_FILES);

    // VALIDATION
    if(isset($_POST['user_id']) && trim($_POST['user_id']) !== "") {} else { echo "user_id - param or value missing "; die; }

    $allowTypes = array('jpg','png','jpeg','gif','pdf');

    // image upload function
    if (!empty($_FILES["file"]["name"])) {
    $file_name      = $_FILES["file"]["name"];
    $temp_name      = $_FILES["file"]["tmp_name"];
    $imgtype        = $_FILES["file"]["type"];
    $ext            = pathinfo($file_name, PATHINFO_EXTENSION);
    $img            = $_POST['user_id']."-".date("d-m-Y") . "-" . time() . "." . $ext;
    $target_path    = "../uploads/".$img;

    // move file with rename to di
    if(move_uploaded_file($temp_name, $target_path)) {

    }else{ exit("Error While uploading image on the server"); }

    $date = date("yy:m:d:h:i");

    // $query = "INSERT INTO `uploads` (`upload_id`, `upload_name`, `upload_datetime`, `upload_user_id`) VALUES (NULL, '$img', '$date', '".$_POST['user_id']."');";
    $query = "INSERT INTO `uploads` (`upload_id`, `upload_name`, `upload_datetime`, `upload_user_id`) VALUES (NULL, '$img', '$date', '".$_POST['user_id']."');";

        $user_info = $mysqli->query('SELECT * FROM uploads WHERE upload_user_id = "'.$_POST['user_id'].'"')->fetch_object();

        if ($mysqli->query($query) === FALSE ) {
            $respose = array ( "status"=>"false", "message"=>"user not exist please try with correct credentials.", "data"=> null );
        } else {
            $respose = array ( "status"=>"true", "message"=>"files uploaded successfully.", "data"=> $user_info );
            }
        echo json_encode($respose);
        }
});

// ======================== CONTACTS
$router->post('contacts', function() {

    include "db.php";

    if (isset($_POST['id'])) {
        $id = $_POST['id'];

        $data = $database->select('accounts', [
            'id',
            'first_name',
            'last_name',
            'email',
            'mobile',
            'country_code',
            'user_status'
        ], [
            'id' => $id,
       ]);
    }

    if (isset($_POST['user_id'])) {
        $user_id = $_POST['user_id'];

        $data = $database->select('accounts', [
            'id',
            'first_name',
            'last_name',
            'email',
            'mobile',
            'country_code',
            'user_status'
        ], [
            'user_id' => $user_id,
       ]);
    }

    if (isset($_POST['email'])) {
        $email = $_POST['email'];

        $data = $database->select('accounts', [
            'id',
            'first_name',
            'last_name',
            'email',
            'mobile',
            'country_code',
            'user_status'
        ], [
            'email' => $email,
       ]);
    }

    if (isset($_POST['first_name'])) {
        $first_name = $_POST['first_name'];

        $data = $database->select('accounts', [
            'id',
            'first_name',
            'last_name',
            'email',
            'mobile',
            'country_code',
            'user_status'
        ], [
            'first_name' => $first_name,
       ]);
    }

    if (isset($_POST['last_name'])) {
        $last_name = $_POST['last_name'];

        $data = $database->select('accounts', [
            'id',
            'first_name',
            'last_name',
            'email',
            'mobile',
            'country_code',
            'user_status'
        ], [
            'last_name' => $last_name,
       ]);
    }

    if (isset($_POST['mobile'])) {
        $mobile = $_POST['mobile'];

        $data = $database->select('accounts', [
            'id',
            'first_name',
            'last_name',
            'email',
            'mobile',
            'country_code',
            'user_status'
        ], [
            'mobile' => $mobile,
       ]);
    }

    if (isset($_POST['country_code'])) {
        $country_code = $_POST['country_code'];

        $data = $database->select('accounts', [
            'id',
            'first_name',
            'last_name',
            'email',
            'mobile',
            'country_code',
            'user_status'
        ], [
            'country_code' => $country_code,
       ]);
    }

       $c = array_reverse($data);

        if (!empty($c)) {
            $respose = array ( "status"=>"true", "message"=>"users details", "data"=> $c );
        } else {
            $respose = array ( "status"=>"false", "message"=>"no users found", "data"=> null );
}

echo json_encode($respose);

});

?>