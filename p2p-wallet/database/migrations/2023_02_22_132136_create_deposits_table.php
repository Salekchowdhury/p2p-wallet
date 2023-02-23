<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateDepositsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('deposits', function (Blueprint $table) {
            $table->id();
            $table->unsignedBigInteger('sender_id');
            $table->unsignedBigInteger('receiver_id');
            $table->unsignedBigInteger('credit_id');
            $table->string("currency");
            $table->integer("balance");
            $table->string("cash_id")->nullable();
            $table->string("cash_out")->nullable();
            $table->foreign('sender_id')
            ->references('id')->on('users')->onDelete('cascade');
            $table->foreign('receiver_id')
            ->references('id')->on('users')->onDelete('cascade');
            $table->foreign('credit_id')
            ->references('id')->on('credits')->onDelete('cascade');
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
        Schema::dropIfExists('deposits');
    }
}
