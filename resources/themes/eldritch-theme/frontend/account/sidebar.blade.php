<div class="card">
    <div class="card-header">
        <h5>
            {{ __('sidebar.home.title') }}
        </h5>
    </div>
    <div class="card-body">
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
    </div>
</div>

<div class="card">
    <div class="card-header">
        <h5>
            {{ __('sidebar.home.currency') }}
        </h5>
    </div>
</div>

<div class="card">
    <div class="card-header">
        <h5>
            {{ __('sidebar.home.references') }}
        </h5>
    </div>
    <div class="card-body">
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
            </a>
        </div>
    </div>
</div>


