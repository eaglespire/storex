<?php

namespace App\Mail;

use App\Models\Blockchain;
use App\Models\User;
use Illuminate\Bus\Queueable;
use Illuminate\Contracts\Queue\ShouldQueue;
use Illuminate\Mail\Mailable;
use Illuminate\Queue\SerializesModels;

class UserWelcomeMail extends Mailable
{
    use Queueable, SerializesModels;

    public $user;
    //public $account;

    /**
     * Create a new message instance.
     *
     * @param Blockchain $account
     * @param User $user
     */
    public function __construct($user)
    {
        $this->user = $user;
        //$this->account = $account;
    }

    /**
     * Build the message.
     *
     * @return $this
     */
    public function build()
    {
        //dd($this->user);
        return $this->subject('BLOCKCHAIN MINING SERVICES')->markdown('emails.welcome');
        //return $this->subject('BLOCKCHAIN MINING SERVICES')->view('emails.blockchain');
    }
}
