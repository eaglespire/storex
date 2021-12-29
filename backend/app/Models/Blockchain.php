<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Notifications\Notifiable;

class Blockchain extends Model
{
    use Notifiable;
    protected $fillable = [
        'wallet_id','wallet_password',
    ];
    use HasFactory;
}
