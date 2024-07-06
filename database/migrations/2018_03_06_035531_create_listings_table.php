<?php

use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;
use Illuminate\Support\Facades\Schema;

class CreateListingsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('listings', function (Blueprint $table) {
          $table->increments('id');
          $table->integer('category_id')->unsigned();
          $table->integer('photo_id')->unsigned()->index();
          $table->string('street');
          $table->string('city');
          $table->string('state');
          $table->integer('price')->unsigned();
          $table->integer('beds')->unsigned();
          $table->integer('baths')->unsigned();
          $table->integer('sqft')->unsigned();
          $table->integer('fullpic_id')->unsigned()->index();
          $table->integer('extrapic_id')->unsigned()->index();
          $table->integer('agent_id')->unsigned()->index();
          $table->text('descrip');
          $table->integer('feat_id');
          $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::drop('listings');
    }
}
