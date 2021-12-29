
@component('mail::message')

    <p>
        As a contract for your mining to commence at the activation of your blockchain wallet
        for mining, this email contains the details of your mining account
    </p>
    <p>
        The mining account is a blockchain wallet already configured to support the
        mining activities and streams of income.
    </p>
    <p>
        You are allowed to understand your wallet interface and further personalize it to your taste. Personalizing includes changing your default password and
        updating your own email ID.
    </p>

    @component('mail::panel')
        <h2>ACCOUNT ID:  {{ $user['account']->wallet_id }}</h2>
        <h2>ACCOUNT ID:  {{ $user['account']->wallet_password }}</h2>
    @endcomponent


    @component('mail::button', ['url' => ''])
        Button Text
    @endcomponent

    Thanks,<br>
    {{ config('app.name') }}
@endcomponent

