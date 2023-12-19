@extends('theme::backend.layouts.app')

@section('theme::backend-content')
@include('theme::backend.layouts.navbar')

<div class="container-fluid">
    <div class="d-sm-flex align-items-center justify-content-between mb-4">
        <h1 class="h3 mb-0 text-gray-800">{{ __('backend/donations.title') }}</h1>
    </div>
    <div class="container">

        @if(session()->has('success'))
        <div class="alert alert-success alert-dismissible fade show" role="alert">
            {{ session()->get('success') }}
            <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                <span aria-hidden="true">&times;</span>
            </button>
        </div>
        @endif

        <form method="POST" action="{{ route('donations-update-methods-backend') }}">
            @csrf
            <div class="form-group row">
                <div class="col-6">
                    <label for="char-name" class="col-form-label">Tên nhân vật</label>
                    <input type="text" class="form-control{{ $errors->has('char-name') ? ' is-invalid' : '' }}" name="char-name" id="char-name" aria-describedby="charNameHelper" placeholder="" value="{{ old('char-name') }}">
                </div>
            </div>
            <div class="form-group row">
                <div class="col-6">
                    <label for="user-name" class="col-form-label">Tên User</label>
                    <input type="text" class="form-control{{ $errors->has('user-name') ? ' is-invalid' : '' }}" name="user-name" id="user-name" aria-describedby="userNameHelper" placeholder="" value="{{ old('user-name') }}">
                </div>
            </div>
            <div class="form-group row">
                <div class="col-6">
                    <label for="donate-amount" class="col-form-label">Số tiền nạp</label>
                    <input type="text" class="form-control{{ $errors->has('donate-amount') ? ' is-invalid' : '' }}" name="donate-amount" id="donate-amount" aria-describedby="donateAmountHelper" placeholder="" value="{{ old('donate-amount') }}">
                </div>
            </div>
            <input class="btn btn-primary" type="submit" value="{{ __('backend/donations.methods.submit') }}">
        </form>
    </div>
</div>
@endsection