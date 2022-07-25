<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Weapon extends Model
{
    protected $fillable = [
        'name',
        'damage',
        'is_range'
    ];

    public function heroes() {
        return $this->belongsToMany(Hero::class, 'hero_weapons');
    }

    use HasFactory;
}
