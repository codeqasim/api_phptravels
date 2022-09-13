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


