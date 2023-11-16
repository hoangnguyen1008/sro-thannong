@extends('theme::layouts.app', ['alias' => 'Account'])
@section('theme::title', __('seo.referral'))
@section('theme::sidebar')
    @include('theme::frontend.account.sidebar', ['account_alias'=>'Referral'])
@endsection

@section('theme::content')
    <div class="card">
        <div class="card-header">
            <h2>
                {{ __('home.ref.title') }}
            </h2>
        </div>
        <div class="card-body">

            <div class="col-md-12">
                <h3>
                    {{ __('home.ref.signature') }}
                </h3>
                @if($signature)
                    <code class="mb-4">
                        [URL={{ url("/register?r={$account->reflink}") }}]<br>
                        [IMG]{{ Storage::disk('images')->url($signature) }}[/IMG]<br>
                        [/URL]<br><br>
                    </code>
                @else
                    <p class="py-2">
                        {{ __('home.ref.no-signature') }}
                    </p>
                @endif
            </div>
            <div class="col-md-12">
                <h2>
                    {{ __('home.ref.your-ref') }}
                </h2>
                {!! $dataTable->table(['class' => 'table table-hover table-borderless table-striped w-100'], true) !!}
            </div>
        </div>
    </div>
@endsection
@push('theme::javascript')
    {!! $dataTable->scripts() !!}
@endpush
