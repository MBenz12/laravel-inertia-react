<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Hero;
use App\Models\Weapon;
use Inertia\Inertia;

class DashboardController extends Controller
{
    //
    public function index() {
        $heroes = Hero::get();
        $res = [];
        foreach($heroes as $hero) {
           $hero["damage"] = $hero->getDamage(); 
        }
        
        $weapons = Weapon::with("heroes")->get();

        return Inertia::render('Dashboard', [
            'heroes' => $heroes,
            'weapons' => $weapons
        ]);
    }
}
