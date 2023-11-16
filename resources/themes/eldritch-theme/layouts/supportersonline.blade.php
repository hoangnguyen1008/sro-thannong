<div class="card">
    <div class="card-header">
        <h5>
            {{ __('supportersonline.title') }}
            <span class="small">
                {{ $SupportersOnlineProvider['onlineCount'] }} / {{ $SupportersOnlineProvider['maxCount'] }}
            </span>
        </h5>
    </div>
    <div class="card-body">
        <ul class="list-group list-unstyled small">
            @php
                $offline = false;
            @endphp
            @forelse($SupportersOnlineProvider['data'] as $supporter)
                @if(
                data_get($supporter->getCharOnlineOffline, 'status', \App\Http\Model\SRO\Log\OnlineOfflineLog::STATUS_LOGGED_OUT)
                === \App\Http\Model\SRO\Log\OnlineOfflineLog::STATUS_LOGGED_IN)
                    <li style="padding-left: 16px;" class="pb-1">
                        <a href="{{ route('information-player', [
                                'CharName16' => Str::lower($supporter->charname)
                            ]) }}" target="_blank">
                            {{ $supporter->charname }}
                        </a>
                    </li>
                    @php
                        $offline = true;
                    @endphp
                @endif
            @empty
                {{ __('supportersonline.no-online') }}
            @endforelse
            @if(!$offline && $SupportersOnlineProvider['maxCount'] > 0)
                {{ __('supportersonline.no-online') }}
            @endif
        </ul>
    </div>
</div>
