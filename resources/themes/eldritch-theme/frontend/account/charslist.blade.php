@extends('theme::layouts.app', ['alias' => 'Account'])
@section('theme::title', __('seo.charlist'))
@section('theme::sidebar')
    @include('theme::frontend.account.sidebar', ['account_alias'=>'CharacterList'])
@endsection

@section('theme::content')
    <div class="card">
        <div class="card-header">
            <h2>
                {{ __('home.chars-list.title') }}
            </h2>
        </div>
        <div class="card-body">
            @if($account->getTbUser->getShardUser->isEmpty())
                {{ __('home.chars-list.no-chars') }}
            @else
                @foreach($account->getTbUser->getShardUser as $char)
                    <div class="row pb-4 row-bordered">
                        <div class="col-xl-3 col-lg-3 col-md-3 d-none d-md-block">
                            <img src="{{ asset('image/sro/chars/') }}/{{ $char->RefObjID }}.gif"
                                 loading="lazy"
                                 class="rounded float-left rounded h-75" alt="{{ $char->CharName16 }}">
                        </div>
                        <div class="col-xl-9 col-lg-9 col-md-9">
                            <dl class="row">
                                <dt class="col-sm-12">
                                    <h5>
                                        <a href="{{ route('information-player', ['CharName16' => Str::lower($char->CharName16)]) }}"
                                           class="text-theme font-weight-light">
                                            {{ $char->CharName16 }}
                                        </a>
                                        <small class="float-right pt-1">
                                            @if($char->getCharOnlineOfflineLoggedIn)
                                                {{ __('home.chars-list.logged-in') }}
                                            @else
                                                {{ __('home.chars-list.logged-out') }}
                                            @endif
                                        </small>
                                    </h5>
                                </dt>
                                <dt class="col-sm-3 col-4">
                                    {{ __('home.chars-list.level') }}
                                </dt>
                                <dd class="col-sm-9 col-8">
                                    <p>
                                        {{ $char->CurLevel }}
                                    </p>
                                </dd>
                                <dt class="col-sm-3 col-4">
                                    {{ __('home.chars-list.last-logout') }}
                                </dt>
                                <dt class="col-sm-9 col-8">
                                    {{ \Carbon\Carbon::createFromFormat('Y-m-d H:i:s', $char->LastLogout)->diffForHumans() }}
                                </dt>

                                <dt class="col-sm-3 col-4">
                                    {{ __('home.chars-list.guild') }}
                                </dt>
                                <dd class="col-sm-9 col-8">
                                    {{ $char->getGuildUser ? $char->getGuildUser->Name : '' }}
                                </dd>
                                <dt class="col-sm-3 col-4">
                                    {{ __('home.chars-list.gold') }}
                                </dt>
                                <dd class="col-sm-9 col-8">
                                    {{ number_format($char->RemainGold, 0, ',', '.') }}
                                </dd>
                            </dl>
                        </div>
                    </div>
                @endforeach
            @endisset
        </div>
    </div>
@endsection
