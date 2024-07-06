<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration {
    public function up()
    {
        Schema::table('users', function (Blueprint $table) {
            $table->integer('is_active')->default(0);
            $table->unsignedBigInteger('role_id')->nullable()->index();
            $table->unsignedBigInteger('position_id')->nullable()->index();
            $table->string('photoStaff_id');
            $table->string('bio')->nullable();
            $table->string('phone')->nullable();
            $table->string('skype')->nullable();
            $table->string('facebook')->nullable();
            $table->string('twitter')->nullable();
        });
    }

    public function down()
    {
        Schema::table('users', function (Blueprint $table) {
            $table->dropColumn('is_active');
            $table->dropColumn('role_id');
            $table->dropColumn('position_id');
            $table->dropColumn('photoStaff_id');
            $table->dropColumn('bio');
            $table->dropColumn('phone');
            $table->dropColumn('skype');
            $table->dropColumn('facebook');
            $table->dropColumn('twitter');
        });
    }
};
