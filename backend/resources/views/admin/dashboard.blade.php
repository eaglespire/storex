<x-admin-layout>
    <x-slot name="header">
        <h2 class="h4 font-weight-bold">
            {{ __('Admin Role') }}
        </h2>
    </x-slot>

    <div class="card my-4">
        <div class="card-body">
            You're logged in!
            {{ Auth::user()->role }}
        </div>
    </div>
</x-admin-layout>
