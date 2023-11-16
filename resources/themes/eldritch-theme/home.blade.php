@extends('theme::layouts.app', ['alias' => 'Account'])
@section('theme::title', __('seo.home'))
@section('theme::sidebar')
    @include('theme::frontend.account.sidebar', ['account_alias'=>'Dashboard'])
@endsection

@section('theme::content')
    <div class="card">
        <div class="card-header">
            <h2>
                {{ __('home.title') }}
            </h2>
        </div>
        <div class="card-body">
            <div class="row">
                <div class="col-xl-6 col-lg-6 col-md-12 col-sm-12 col-12">
                    <div class="box box-small-icon-alt">
                        <a href="{{ route('home-chars-list') }}" class="dashboard-link d-none d-sm-block">
                            <i class="fa fa-3x fa-users text-dark box-icon box-icon-outline"></i>
                        </a>
                        <a href="{{ route('home-chars-list') }}" class="dashboard-link">
                            <h4 class="box-title">
                                {{ __('home.grid.char-list') }}
                            </h4>
                        </a>
                        <p class="box-description">
                            {{ __('home.grid.char-list-desc') }}
                        </p>
                    </div>
                </div>
                <div class="col-xl-6 col-lg-6 col-md-12 col-sm-12 col-12">
                    <div class="box box-small-icon-alt">
                        <a href="{{ route('home-settings') }}" class="dashboard-link d-none d-sm-block">
                            <i class="fa fa-3x fa-user-cog text-dark box-icon box-icon-outline"></i>
                        </a>
                        <a href="{{ route('home-settings') }}" class="dashboard-link">
                            <h4 class="box-title">
                                {{ __('home.grid.settings') }}
                            </h4>
                        </a>
                        <p class="box-description">
                            {{ __('home.grid.settings-desc') }}
                        </p>
                    </div>
                </div>
                <div class="col-xl-6 col-lg-6 col-md-12 col-sm-12 col-12">
                    <div class="box box-small-icon-alt">
                        <a href="{{ route('donations-index') }}" class="dashboard-link d-none d-sm-block">
                            <i class="fa fa-3x fa-money-bill text-dark box-icon box-icon-outline"></i>
                        </a>
                        <a href="{{ route('donations-index') }}" class="dashboard-link">
                            <h4 class="box-title">
                                {{ __('home.grid.donation') }}
                            </h4>
                        </a>
                        <p class="box-description">
                            {{ __('home.grid.donation-desc', ['silk' => config('siteSettings.sro_silk_name', 'Silk')]) }}
                        </p>
                    </div>
                </div>
                <div class="col-xl-6 col-lg-6 col-md-12 col-sm-12 col-12">
                    <div class="box box-small-icon-alt">
                        <a href="{{ route('home') }}" class="dashboard-link d-none d-sm-block">
                            <i class="fa fa-3x fa-retweet text-dark box-icon box-icon-outline"></i>
                        </a>
                        <a href="{{ route('home') }}" class="dashboard-link">
                            <h4 class="box-title">
                                {{ __('home.grid.ref') }}
                            </h4>
                        </a>
                        <p class="box-description">
                            {{ __('home.grid.ref-desc') }}
                        </p>
                    </div>
                </div>
            </div>
        </div>
    </div>
@endsection
