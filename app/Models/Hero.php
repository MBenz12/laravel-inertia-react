<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Hero extends Model
{
    protected $fillable = [
        'name',
        'health'
    ];
    use HasFactory;

    public function weapons() {
        return $this->belongsToMany(Weapon::class, 'hero_weapons');
    }

    public function getDamage() {
        $weapons = $this->weapons;
        $damage = 0;
        foreach ($weapons as $weapon) {
            $damage += $weapon->damage;
        }
        return $damage;
    }

    protected static function boot() {
        parent::boot();
        Hero::created(function ($model) {
            $details['email'] = 'admin@admin.com';
            dispatch(new App\Jobs\SendEmailJob($details));
        });
    }
}
