<?php

namespace App\Models;

use App\Models\CRUD;

class Dash extends CRUD
{
    protected $table = 'dashboard';
    protected $primaryKey = 'id';
    protected $fillable = ['id',  'userName', 'userId', 'adresseIP', 'dateTime', 'page'];
}
