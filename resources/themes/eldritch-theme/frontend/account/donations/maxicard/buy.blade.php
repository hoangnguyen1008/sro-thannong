@extends('theme::layouts.app')
@section('theme::title', __('seo.donations'))
@section('theme::sidebar')
    @include('theme::frontend.account.sidebar')
@endsection

@section('theme::content')
    @if ($message = Session::get('success'))
        <div class="alert alert-success alert-block">
            <button type="button" class="close" data-dismiss="alert">×</button>
            <strong>{{ $message }}</strong>
        </div>
    @endif
    @if ($error = Session::get('error'))
        <div class="alert alert-danger alert-block">
            <button type="button" class="close" data-dismiss="alert">×</button>
            <strong>{{ $error }}</strong>
        </div>
    @endif

    @if ($message = Session::get('message'))
        <div class="alert alert-primary alert-block">
            <button type="button" class="close" data-dismiss="alert">×</button>
            <strong>{{ $message }}</strong>
        </div>
    @endif
    <div class="card">
        <div class="card-header">
            <h2>
                {{ __('donations.maxicard.title') }}
            </h2>
        </div>
        <div class="card-body">
            <form method="post" action="{{route('donate-maxicard-buy-post')}}">
                @csrf
                <div class="form-group">
                    <div class="row">
                        <div class="col-lg-2 my-auto">
                            <label class="mb-0" for="code">E-Pin Code</label>
                        </div>
                        <div class="col-lg-10">
                            <input class="form-control @error('code') is-invalid @enderror" required type="text"
                                   id="code" name="code"
                                   placeholder="Enter Your E-Pin Code..">
                        </div>
                        @if($errors->has('code'))
                            <div class="invalid-feedback">
                                {{ $errors->first('code') }}
                            </div>
                        @endif
                    </div>
                </div>
                <div class="form-group">
                    <div class="row">
                        <div class="col-lg-2 my-auto">
                            <label class="mb-0" for="password">E-Pin Password</label>
                        </div>
                        <div class="col-lg-10">
                            <input class="form-control @error('password') is-invalid @enderror" required type="text"
                                   id="password" name="password"
                                   placeholder="Enter Your E-Pin Password..">
                        </div>
                        @if($errors->has('password'))
                            <div class="invalid-feedback">
                                {{ $errors->first('password') }}
                            </div>
                        @endif
                    </div>
                </div>

                <div class="form-group">
                    <button class="btn btn-primary" type="submit">Submit</button>
                </div>
            </form>
        </div>
    </div>
@endsection
