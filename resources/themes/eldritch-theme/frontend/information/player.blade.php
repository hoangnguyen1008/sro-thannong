@extends('theme::layouts.app')
@section('theme::title', __('seo.information.player', ['name' => $player->CharName16]))
@section('theme::content')
    <div class="card">
        <div class="card-header">
            <h2>{{ __('information.player.title', ['charname16' => $player->CharName16]) }}</h2>
        </div>
        <div class="card-body">
            <div class="row">
                @if($player->getAccountUser->getTbUser)
                    @role('administrator')
                    @include('theme::frontend.information.information.player.gm')
                @else
                    @auth
                        @if($player->getAccountUser->getTbUser->JID === Auth::user()->jid)
                            @include('theme::frontend.information.information.player.own')
                        @else
                            @include('theme::frontend.information.information.player.guest')
                        @endif
                    @else
                        @include('theme::frontend.information.information.player.guest')
                    @endauth
                    @endrole
                @endif
            </div>
            <!-- Item Stats -->
            <div class="card-header border-bottom-0 text-center">
                <h2 class="d-inline-block border-bottom">{{ __('information.player.equipment.title') }}</h2>
            </div>
            <div class="card-body">
                <div class="row justify-content-center">
                    @include('theme::frontend.information.information.inventory', ['items' => $playerInventory])
                </div>
            </div>
        </div>
    </div>
@endsection

@if($player->getAccountUser->getTbUser)
    @role('administrator')
    @include('theme::frontend.information.information.map', ['player' => $player])
@else
    @auth
        @if($player->getAccountUser->getTbUser->JID === Auth::user()->jid)
            @include('theme::frontend.information.information.map', ['player' => $player])
        @else
            @if($playerUnderJob)
                @include('theme::frontend.information.information.map', ['player' => $player])
            @endif
        @endif
    @else
        @if($playerUnderJob)
            @if($player->getAccountUser->getTbUser->getWebUser && $player->getAccountUser->getTbUser->getWebUser->show_map === 1)
                @include('theme::frontend.information.information.map', ['player' => $player])
            @endif
        @endif
    @endauth
    @endrole
@endif
