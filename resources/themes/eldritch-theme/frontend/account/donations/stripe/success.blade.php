@extends('theme::layouts.app')
@section('theme::title', __('seo.donations'))
@section('theme::sidebar')
    @include('theme::frontend.account.sidebar')
@endsection

@section('theme::content')
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-md-12">
                @if($state)
                    <div class="alert alert-success" role="alert">
                        <h4 class="alert-heading">{{__('donations.notification.buy.success-title')}}</h4>
                        <p>{{ $status }}</p>
                    </div>
                @else
                    <div class="alert alert-warning" role="alert">
                        <h4 class="alert-heading">{{__('donations.notification.buy.error-title')}}</h4>
                        <p>{{ $status }}</p>
                    </div>
                @endif
            </div>
        </div>
        <p>
            <a href="{{ route('home') }}">
                {{ __('donations.notification.buy.success-back') }}
            </a>
        </p>
    </div>
@endsection
