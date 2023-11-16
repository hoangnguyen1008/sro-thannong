<!doctype html>
<html lang="{{ str_replace('_', '-', app()->getLocale()) }}">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- CSRF Token -->
    <meta name="csrf-token" content="{{ csrf_token() }}">

    <title>@yield('theme::title', config('app.name', 'Devsome'))</title>
    <meta name="description" content="{{ config('app.description', 'Description') }}">
    <!-- Coded by Devsome.com -->
    <meta name="author" content="Alexander Frank">
    <link rel="icon" href="{{ asset('image/favicon/favicon.ico') }}">

    <!-- Fonts -->
    <link rel="dns-prefetch" href="//fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css?family=Nunito" rel="stylesheet">

    @include('theme::layouts.includes.styles')
</head>
<body dir="{{( Session::get('locale') === 'ar' ? 'rtl' : 'ltr' )}}">
<div id="app">
    @include('theme::layouts.navbar')
    <main role="main" class="container">
        <div class="row mt-5">
            <div class="main-container col-xl-9 col-lg-9 col-md-12 col-sm-12 col-12">
                @yield('theme::content')
            </div>
            <div class="sidebar col-xl-3 col-lg-3 col-md-12 col-sm-12 col-12 d-none d-lg-block">
                @section('theme::sidebar')
                    @include('theme::layouts.sidebar')
                @show
            </div>
        </div>
    </main>
    @include('theme::layouts.footer')
</div>

@include('theme::layouts.includes.scripts')
</body>
</html>
