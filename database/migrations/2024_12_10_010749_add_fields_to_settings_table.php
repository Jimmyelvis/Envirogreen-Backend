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
        Schema::table('settings', function (Blueprint $table) {
            $table->integer('featured_posts_slots')->default(3);
            $table->integer('featured_listings_slots')->default(3);
            $table->string('header_image')->nullable();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::table('settings', function (Blueprint $table) {
            $table->dropColumn('featured_posts_slots');
            $table->dropColumn('featured_listings_slots');
            $table->dropColumn('header_image');
        });
    }
};
