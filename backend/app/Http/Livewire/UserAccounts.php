<?php

namespace App\Http\Livewire;

use App\Models\Blockchain;
use Livewire\Component;

class UserAccounts extends Component
{
    public $walletId;
    public $accounts;

    public function mount()
    {
        $this->fill(['walletId'=>'', 'accounts'=>Blockchain::get()]);
    }
    public function addAccount()
    {
        dd('This is working');
    }

    public function render()
    {
        return view('livewire.user-accounts');
    }
}
