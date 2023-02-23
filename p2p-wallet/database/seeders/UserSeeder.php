<?php

namespace Database\Seeders;

use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;
use App\Models\User;
class UserSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        $user = new User;
        $user->name = "Jhon Doe 123";
        $user->email = "Jhon_Doe123@email.com";
        $user->password = \Hash::make("Nerver");
        $user->save();
    }
}
