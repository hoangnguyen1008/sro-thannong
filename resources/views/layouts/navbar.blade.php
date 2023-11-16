<nav class="navbar navbar-expand-md navbar-light bg-white shadow-sm">
    <div class="container">
        <a class="navbar-brand" href="{{ url('/') }}">
            {{ config('app.name', 'Devsome') }}
        </a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent"
                aria-controls="navbarSupportedContent" aria-expanded="false"
                aria-label="{{ __('navbar.toggle') }}">
            <span class="navbar-toggler-icon"></span>
        </button>

        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav mr-auto">
                <li class="nav-item">
                    <a class="nav-link{{(isset($alias) && $alias === 'Home') ? ' active' : ''}}" href="{{ url('/') }}">
                        {{ __('navbar.nav.home') }}
                    </a>
                </li>
                <li class="nav-item">
                    <a class="nav-link{{(isset($alias) && $alias === 'Downloads') ? ' active' : ''}}"
                       href="{{ route('downloads-index') }}">
                        {{ __('navbar.nav.download') }}
                    </a>
                </li>
                <li class="nav-item">
                    <a class="nav-link{{(isset($alias) && $alias === 'Ranking') ? ' active' : ''}}"
                       href="{{ route('ranking.char') }}">
                        {{ __('navbar.nav.ranking') }}
                    </a>
                </li>
                <li class="nav-item dropdown">
                    <a id="navbarDropdown" class="nav-link dropdown-toggle{{(isset($alias) && $alias === 'pages') ? ' active' : ''}}" href="#" role="button"
                       data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" v-pre>
                        {{ __('navbar.nav.serverinformation') }} <span class="caret"></span>
                    </a>
                </li>
            </ul>
            <ul class="navbar-nav ml-auto">
                @if(count(config('language')) > 1)
                    <li class="nav-item dropdown">
                        <a id="navbarDropdown" class="nav-link dropdown-toggle" href="#" role="button"
                           data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" v-pre>
                            {{ config('language.' . Session::get('locale', 'vn') . '.name') }} <i
                                class="fa fa-language"></i><span class="caret"></span>
                        </a>
                        <div class="dropdown-menu dropdown-menu-right" aria-labelledby="navbarDropdown">
                            @foreach(config('language') as $key => $lang)
                                @if($key !== 'example')
                                    <a class="dropdown-item{{(Session::get('locale', 'en') === $key)  ? ' active' : ''}}" href="{{ route('change-language', ['lang' => $key]) }}">
                                        <img class="small" src="{{ $lang['icon'] }}" width="26px"
                                             height="16px"> {{ $lang['name'] }}
                                    </a>
                                @endif
                            @endforeach
                        </div>
                    </li>
                @endif

                @guest
                    <li class="nav-item">
                        <a class="nav-link{{(isset($alias) && $alias == 'Login') ? ' active' : ''}}" href="{{ route('login') }}">{{ __('navbar.login') }}</a>
                    </li>
                    @if (Route::has('register'))
                        <li class="nav-item">
                            <a class="nav-link{{(isset($alias) && $alias == 'register') ? ' active' : ''}}" href="{{ route('register') }}">{{ __('navbar.register') }}</a>
                        </li>
                    @endif
                @else
                    <li class="nav-item dropdown">
                        <a id="navbarDropdown" class="nav-link dropdown-toggle{{(isset($alias) && $alias == 'Account') ? ' active' : ''}}" href="#" role="button"
                           data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" v-pre>
                            {{ Auth::user()->name }} <span class="caret"></span>
                        </a>
                        <div class="dropdown-menu dropdown-menu-right" aria-labelledby="navbarDropdown">
                            <a class="dropdown-item{{(isset($alias) && $alias == 'Account') ? ' active' : ''}}" href="{{ route('home') }}">
                                {{ __('navbar.home') }}
                            </a>
                            <div class="dropdown-divider"></div>
                            <a class="dropdown-item" href="{{ route('logout') }}"
                               onclick="event.preventDefault();document.getElementById('logout-form').submit();">
                                {{ __('navbar.logout') }}
                            </a>
                            <form id="logout-form" action="{{ route('logout') }}" method="POST" style="display: none;">
                                @csrf
                            </form>
                            @role('administrator')
                            <a class="dropdown-item" href="{{ route('index-backend') }}">
                                {{ __('navbar.backend') }}
                            </a>
                            @endrole
                        </div>
                    </li>
                @endguest
            </ul>
        </div>
    </div>
</nav>
