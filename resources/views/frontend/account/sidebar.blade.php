<div class="col-xl-3 col-lg-3 col-md-12 col-sm-12 col-12 d-none d-lg-block">
    <p class="font-weight-light pt-2 pb-2 font-weight-bold">
        {{ __('sidebar.home.title') }}
    </p>

    @guest

    @else
        <div class="mb-3">
            <h2>
                Xin chào <span style="color: #fcd560">{{ Auth::user()->name }}</span>
            </h2>
            <div>
                <div>
                    <a style="color: #fcd560" href="{{ route('home') }}">
                    <i class="fa fa-fw fa-users"></i>  {{ __('navbar.home') }}
                    </a>
                </div>
                <div>
                    <a style="color: #fcd560" href="{{ route('logout') }}"
                        onclick="event.preventDefault();document.getElementById('logout-form').submit();">
                        {{ __('navbar.logout') }}
                    </a>
                    <form id="logout-form" action="{{ route('logout') }}" method="POST" style="display: none;">
                        @csrf
                    </form>
                </div>
                <div>
                    @role('administrator')
                    <a style="color: #fcd560" href="{{ route('index-backend') }}">
                        {{ __('navbar.backend') }}
                    </a>
                    @endrole
                </div>
            </div>
        </div>
@endguest

    <ul class="list-group list-unstyled small">
        <li>
            <div class="float-left">
                <i class="fa fa-fw fa-desktop"></i> {{ __('sidebar.information.online') }}
            </div>
            <div class="float-right">
                @include('theme::layouts.playercount')
            </div>
        </li>
        <li class="pb-1 pt-2">
            <div class="float-left">
                <i class="fa fa-fw fa-clock"></i> {{ __('sidebar.information.time') }}
            </div>
            <div class="float-right">
                <span id="timerCurrent">{{ \Carbon\Carbon::now()->format('H:i:s') }}</span>
            </div>
        </li>
    </ul>

    <p class="font-weight-light pt-4 font-weight-bold">
        {{ __('sidebar.home.currency') }}
    </p>
    <ul class="list-group list-unstyled small ">
        <li class="pb-1">
            <div class="float-left">
                <i class="fa fa-fw fa-coins"></i> {{ __('sidebar.home.silk') }}
            </div>
            <div class="float-right">
                {{ $SilkGoldProvider['silk'] }}
            </div>
        </li>
        <li class="pb-1">
            <div class="float-left">
                <i class="fa fa-fw fa-coins"></i> {{ __('sidebar.home.silk-gift') }}
            </div>
            <div class="float-right">
                {{ $SilkGoldProvider['silk_gift'] }}
            </div>
        </li>
    </ul>

    <p class="font-weight-light pt-4 font-weight-bold">
        {{ __('sidebar.home.references') }}
    </p>

    <div class="list-group small">
        <a href="{{ route('home') }}"
           class="list-group-item list-group-item-action{{(isset($account_alias) && $account_alias == 'Dashboard') ? ' active' : ''}}">
            {{ __('sidebar.home.dashboard') }}
        </a>
        <a href="{{ route('home-chars-list') }}"
           class="list-group-item list-group-item-action{{(isset($account_alias) && $account_alias == 'CharacterList') ? ' active' : ''}}">
            {{ __('sidebar.home.charlist') }}
        </a>
        <a href="{{ route('home-settings') }}"
           class="list-group-item list-group-item-action{{(isset($account_alias) && $account_alias == 'Settings') ? ' active' : ''}}">
            {{ __('sidebar.home.settings') }}
        </a>
        <a href="{{ route('donations-index') }}"
           class="list-group-item list-group-item-action{{(isset($account_alias) && $account_alias == 'Donate') ? ' active' : ''}}">
            {{ __('sidebar.home.donate') }}
        </a>
    </div>
</div>
