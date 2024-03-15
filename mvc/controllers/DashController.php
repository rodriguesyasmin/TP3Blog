<?php

namespace App\Controllers;
use App\Providers\View;
use App\Models\Dash;

class DashController
{
    public function index()
    {
        if (!$_SESSION['user_id']) {
            return View::redirect('login');
        }

        $dashboard = new Dash;
        $select = $dashboard->select();

        if ($select) {
            return View::render('dash/index', ['dash' => $select]);
        } else {
            return View::render('error');
        }
    }
}