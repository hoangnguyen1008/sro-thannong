@isset($DiscordProvider)
    <div class="card">
        <div class="card-header">
            <h5>
                {{ __('sidebar.discord.title') }} {{ __('sidebar.discord.online', ['online' => $DiscordProvider['presence_count']]) }}
                @if(array_key_exists('instant_invite', $DiscordProvider))
                    @if($DiscordProvider['instant_invite'] !== null)
                        <div class="float-right">
                            <a href="{{ $DiscordProvider['instant_invite'] }}" target="_blank" rel="noopener">
                                {{ __('sidebar.discord.join') }}
                            </a>
                        </div>
                    @endif
                @endif
            </h5>
        </div>
        <div class="card-body">
            <ul class="list-group list-unstyled small overflow-auto py-1 pl-1 discord">
                @forelse($DiscordProvider['members'] as $discord)
                    <li class="pb-1 border-bottom text-break border-bottom-0">
                        <img src="{{ $discord['avatar_url'] }}" class="mr-2 float-left img-fluid rounded-circle"
                             loading="lazy" width="20" alt="{{ $discord['username'] }}"/>
                        <div class="d-inline-block align-middle">
                            {{ $discord['username'] }}
                        </div>
                        @if(array_key_exists('game', $discord))
                            <div class="float-right small pt-1 pr-2">
                                {{ $discord['game']['name'] }}
                            </div>
                        @endif
                    </li>
                @empty
                    {{ __('sidebar.discord.empty') }}
                @endforelse
            </ul>
        </div>
    </div>
@endisset
