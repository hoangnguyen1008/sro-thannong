@extends('theme::layouts.app')
@section('theme::title', __('seo.donations'))
@section('theme::sidebar')
    @include('theme::frontend.account.sidebar')
@endsection

@section('theme::content')
    <div class="card">
        <div class="card-header">
            <h2>
                {{ __('donations.maxicard.title') }}
            </h2>
        </div>
        <div class="card-body">

            <div class="row">
                @forelse($maxicard as $data)
                    <div class="col-lg-6">
                        <div class="card mb-4">
                            <div class="card-header">
                                <h6 class="m-0 font-weight-bold">
                                    {{ $data->silk }} {{ config('siteSettings.sro_silk_name', 'Silk') }}
                                </h6>
                            </div>
                            <div class="card-body">
                                <h6 class="card-subtitle mb-2 text-muted">
                                    {{ __('donations.maxicard.pay-text', [
                                        'price' => $data->price,
                                        'currency' => $method->currency,
                                        'amount' => $data->silk,
                                        'silk_name' => config('siteSettings.sro_silk_name', 'Silk')
                                    ]) }}
                                </h6>
                            </div>
                        </div>

                    </div>
                @empty
                    {{ __('donations.maxicard.empty') }}
                @endforelse
            </div>
            <a class="btn btn-theme card-link"
               href="{{ route('donate-maxicard-buy') }}">
                <i class="fa fa-cart-plus"></i> {{ __('donations.maxicard.submit') }}
            </a>
        </div>
    </div>
@endsection
