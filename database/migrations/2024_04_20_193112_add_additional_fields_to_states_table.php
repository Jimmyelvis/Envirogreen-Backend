<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     */
    public function up(): void
    {
        Schema::table('states', function (Blueprint $table) {
            // add a field to the states table `abbrev` varchar(3) NOT NULL
            $table->string('abbrev', 3)->after('name');
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::table('states', function (Blueprint $table) {
            //
            $table->dropColumn('abbrev');
        });
    }
};
