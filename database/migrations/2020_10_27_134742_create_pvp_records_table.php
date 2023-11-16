<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreatePvpRecordsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        if (!Schema::connection('cms')->hasTable('pvp_records')) {
            Schema::connection('cms')->create('pvp_records', static function (Blueprint $table) {
                $table->id();
                $table->string('CharName');
                $table->unsignedBigInteger('CharID');
                $table->string('KilledCharName');
                $table->unsignedBigInteger('KilledCharID');
                $table->string('type');
                $table->string('position');
                $table->text('description');
                $table->timestamp('killed_at')->useCurrent();
            });
        }
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::connection('cms')->dropIfExists('pvp_records');
    }
}
