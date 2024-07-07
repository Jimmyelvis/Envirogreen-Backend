<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;
use App\Models\City;
use App\Models\State;

return new class extends Migration
{
   /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::table('cities', function (Blueprint $table) {
            // Add the new state_id column
            $table->unsignedBigInteger('state_id')->nullable();
        });

        // Migrate existing data from state to state_id
        $cities = City::all();
        foreach ($cities as $city) {
            $state = State::where('name', $city->state)->first();
            if ($state) {
                $city->state_id = $state->id;
                $city->save();
            }
        }

        Schema::table('cities', function (Blueprint $table) {
            // Add foreign key constraint
            $table->foreign('state_id')->references('id')->on('states');

            // Drop the old state column
            $table->dropColumn('state');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::table('cities', function (Blueprint $table) {
            // Add the state column back
            $table->string('state')->nullable();

            // Drop the state_id column and foreign key
            $table->dropForeign(['state_id']);
            $table->dropColumn('state_id');
        });

        // Optionally, you can migrate data back from state_id to state
        $cities = City::with('state')->get();
        foreach ($cities as $city) {
            if ($city->state) {
                $city->state = $city->state->name;
                $city->save();
            }
        }
    }
};
