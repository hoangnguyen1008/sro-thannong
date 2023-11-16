@extends('theme::layouts.app', ['alias' => 'Account'])
@section('theme::title', __('seo.voucher'))
@section('theme::sidebar')
    @include('theme::frontend.account.sidebar', ['account_alias'=>'Vouchers'])
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
    @if(session()->has('error'))
        <div class="alert alert-danger alert-dismissible fade show" role="alert">
            {{ session()->get('error') }}
            <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                <span aria-hidden="true">&times;</span>
            </button>
        </div>
    @endif
    <div class="card">
        <div class="card-header">
            <h2>
                {{ __('home.voucher.title') }}
            </h2>
        </div>
        <div class="card-body">
            <form method="POST" action="{{ route('home-voucher-use') }}" class="form">
                @method('POST')
                @csrf
                <div class="form-row">
                    <div class="form-group col-6">
                        <div class="form-group">
                            <label for="voucher">{{ __('home.voucher.form.voucher') }}</label>
                            <input type="text" class="form-control @error('voucher') is-invalid @enderror"
                                   id="voucher"
                                   aria-describedby="voucherHelp" name="voucher"
                                   value="{{ Request::old('voucher') }}"
                                   autocomplete="off">
                            <small id="voucherHelp" class="form-text text-muted">
                                {{ __('home.voucher.form.voucher-help') }}
                            </small>
                            @if($errors->has('voucher'))
                                <div class="invalid-feedback">
                                    {{ $errors->first('voucher') }}
                                </div>
                            @endif
                        </div>
                    </div>
                </div>
                <div class="form-row">
                    <div class="form-group col-12">
                        <input class="btn btn-sm btn-theme" type="submit"
                               value="{{ __('home.voucher.form.submit') }}">
                    </div>
                </div>
            </form>
            {!! $dataTable->table(['class' => 'table table-hover table-borderless table-striped w-100'], true) !!}
        </div>
    </div>
@endsection
@push('theme::javascript')
    {!! $dataTable->scripts() !!}
@endpush
