<?php

use Medoo\Medoo;

// DD FUNCTION FOR DEBUG RESPONSES
function dd($d) { print_r($d); }

header("Content-Type: application/json");
header('Access-Control-Allow-Origin: *');

$whitelist = array( '127.0.0.1', '::1' );
if(in_array($_SERVER['REMOTE_ADDR'], $whitelist)){ 
$host = "localhost"; } else { $host = "api-4b8a059e84"; }

$servername = $host;
$database = "production_api_database";
$username = "api_database";
$password = "api_database";

// CREATE CONNECTION
$mysqli = new mysqli($servername, $username, $password, $database);

// Check connection
if ($mysqli->connect_error) { die("Connection failed: " . $mysqli->connect_error);
  $dbConnection = "Database Not Connected"; } else { $dbConnection = "Database Connected"; }

// Connect the database.
$db = new Medoo([
  'type' => 'mysql',
  'host' => $host,
  'database' => 'production_api_database',
  'username' => 'api_database',
  'password' => 'api_database'
]);


// FUNCTION FOR REQUIRED PARAMS
function required($val){ if(isset($_REQUEST[$val]) && trim($_POST[$val]) !== "") {} else { echo $val." - param or value missing "; die; } }

// USER IP
function get_client_ip() { $ipaddress = ''; if (getenv('HTTP_CLIENT_IP')) $ipaddress = getenv('HTTP_CLIENT_IP'); else if(getenv('HTTP_X_FORWARDED_FOR')) $ipaddress = getenv('HTTP_X_FORWARDED_FOR'); else if(getenv('HTTP_X_FORWARDED')) $ipaddress = getenv('HTTP_X_FORWARDED'); else if(getenv('HTTP_FORWARDED_FOR')) $ipaddress = getenv('HTTP_FORWARDED_FOR'); else if(getenv('HTTP_FORWARDED')) $ipaddress = getenv('HTTP_FORWARDED'); else if(getenv('REMOTE_ADDR')) $ipaddress = getenv('REMOTE_ADDR'); else $ipaddress = 'UNKNOWN'; return $ipaddress; }
