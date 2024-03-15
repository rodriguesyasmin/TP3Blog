<?php

session_start();

use App\Models\Dash;

require_once 'vendor/autoload.php';
require_once 'config.php';
require_once 'routes/web.php';
require_once 'models/Dash.php';

$dashLog["page"] = $_SERVER['REQUEST_URI'];
$dashLog["date"] = date("Y/m/d H:i:s");
$dashLog["adresseIP"] = $_SERVER['SERVER_ADDR'];



$dashLogEntry = new Dash;

$insert = $dashLogEntry->insert($dashLog);
