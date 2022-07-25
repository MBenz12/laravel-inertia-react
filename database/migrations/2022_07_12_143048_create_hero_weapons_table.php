<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('hero_weapons', function (Blueprint $table) {
            $table->id();
            $table->foreignId('hero_id');
            $table->foreignId('weapon_id');
            $table->timestamps();
            $table->index(['hero_id', 'weapon_id']);
            $table->foreign('hero_id')->references('id')->on('heroes');
            $table->foreign('weapon_id')->references('id')->on('weapons');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('hero_weapons');
    }
};
