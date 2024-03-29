<?php

// AUTOLOADER
use Mailgun\Mailgun;

$whitelist = array( '127.0.0.1', '::1' );
if(in_array($_SERVER['REMOTE_ADDR'], $whitelist)){ 
$link = 'http://localhost/api_phptravels/';
} else {
$link = 'https://api.phptravels.com/';
}

// MAILER
function mailer($mail){

    $SENDER_DOMAIN = "mail.phptravels.com";
    $MAILGUN_FROM_EMAIL = "info@mail.phptravels.com";
    $mg = Mailgun::create("key-528ca6d92f9006dea5fdb43e68464ee8"); // API PUBLIC KEY

    $mg->messages()->send($SENDER_DOMAIN, [
        'from'    => 'PHPTRAVELS <noreply@phptravels.com>',
        'to'      => ''.$mail['name'].' <'.$mail['email'].'>',
        'subject' => ''.$mail['subject'].'',
        'template'    => 'global',
        'h:X-Mailgun-Variables'    => '{
            "link": "'.$mail['link'].'",
            "code":"'.$mail['code'].'",
            "title":"'.$mail['subject'].'",
            "content_title":"'.$mail['content_title'].'",
            "content":"'.$mail['content'].'"
        }'
    ]);
    return $mg;
}