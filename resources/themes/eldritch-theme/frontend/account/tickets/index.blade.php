@extends('theme::layouts.app', ['alias' => 'Account'])
@section('theme::title', __('seo.tickets.index'))
@section('theme::sidebar')
    @include('theme::frontend.account.sidebar', ['account_alias'=>'Tickets'])
@endsection

@section('theme::content')
    @if(session()->has('success'))
        <div class="alert alert-success alert-dismissible fade show" role="alert">
            {{ session()->get('success') }}
            <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                <span aria-hidden="true">&times;</span>
            </button>
        </div>
    @endif
    <div class="card">
        <div class="card-header">
            <h2>
                {{ __('home.tickets.title') }}
            </h2>
        </div>
        <div class="card-body">
            <div class="ml-auto mr-3 mb-3">
                <a href="{{ route('home-tickets-new') }}" type="button" class="btn btn-secondary">
                    {{ __('home.tickets.create-new') }}
                </a>
            </div>
        {!! $dataTable->table(['class' => 'table table-hover table-borderless table-striped w-100'], true) !!}
        </div>
    </div>
@endsection
@push('theme::javascript')
    {!! $dataTable->scripts() !!}
@endpush
