<x-admin-layout>
    <x-slot name="header">
        <h2 class="h4 font-weight-bold">
            {{ __('BlockChain Accounts') }}
        </h2>
    </x-slot>

    <div class="card my-4">
        <div class="card-body">
            @livewire('user-accounts')
        </div>
    </div>
</x-admin-layout>
