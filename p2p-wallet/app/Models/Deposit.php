<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use App\Models\User;


class Deposit extends Model
{
    use HasFactory;
    protected $table = 'deposits';
    protected $fillable = [
        'sender_id',
        'receiver_id',
        'credit_id',
        'currency',
        'balance',
        'cash_id',
        'cash_out',
    ];
    public function user()
        {
            return $this->belongsTo(User::class, 'sender_id', 'id');
        }
        public function deposits()
        {
            return $this->belongsTo(User::class, 'sender_id', 'id');
        }
}
