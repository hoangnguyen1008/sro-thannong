@extends('theme::layouts.app', ['alias' => 'Account'])
@section('theme::title', __('seo.donations'))
@section('theme::sidebar')
    @include('theme::frontend.account.sidebar', ['account_alias'=>'Donate'])
@endsection

@section('theme::content')
    @if ($error = Session::get('error'))
        <div class="row">
            <div class="col-12">
                <div class="alert alert-danger alert-block">
                    <button type="button" class="close" data-dismiss="alert">×</button>
                    <strong>{{ $error }}</strong>
                </div>
            </div>
        </div>
    @endif
    <div class="card">
        <div class="card-header">
            <h2>{{ __('home.donations.title') }}</h2>
            <p>{{ __('home.donations.text') }}</p>
        </div>
        <div class="card-body">
            <ul class="list-group list-group-flush">
                @if(Route::has('dev.payop.index'))
                    <li class="list-group-item">
                                <span style="padding-right: 25px; max-width: 140px">
                                    <img src="{{ asset('/image/donations/payop.png') }}"
                                         class="img-fluid" alt="quixote">
                                </span>
                        <a href="{{ route('dev.payop.index') }}">
                            {{ __('payoplang::payop.donation_payop') }}</a>
                    </li>
                @endif

                @forelse($donationMethods as $method)
                    <li class="list-group-item">
                                <span style="padding-right: 25px; max-width: 140px">
                                    <img src="{{ asset('/image/donations/' . $method->image) }}"
                                         class="img-fluid" alt="{{ $method->name }}" width="140">
                                </span>
                        <a href="{{ route('donations-method-index', ['method' => $method->method]) }}">
                            {{ $method->name }}</a>
                    </li>
                @empty
                    <li class="list-group-item">
                        {{ __('home.donations.no_methods') }}
                    </li>
                @endforelse
            </ul>

        </div>
    </div>
@endsection
