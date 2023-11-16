@isset($PvpRecordsProvider)
    <div class="card">
        <div class="card-header">
            <h5>
                {{ __('sidebar.pvp.title') }}
            </h5>
        </div>
        <div class="card-body">
            <ul class="list-group small overflow-auto py-1 pl-1">
                @forelse($PvpRecordsProvider as $record)
                    <li class="font-weight-light">
                <span class="font-weight-bold">
                    <a href="{{ route('information-player', ['CharName16' => Str::lower($record->CharName)]) }}">
                        {{ $record->CharName }}
                    </a>
                </span> {{ __('sidebar.pvp.killed') }}
                        <span class="font-weight-bold">
                    <a href="{{ route('information-player', ['CharName16' => Str::lower($record->KilledCharName)]) }}">
                        {{ $record->KilledCharName }}
                    </a>
                </span>
                        {{ \Carbon\Carbon::make($record->killed_at)->diffForHumans() }}
                    </li>
                @empty
                    <li>
                        {{ __('sidebar.pvp.empty') }}
                    </li>
                @endforelse
            </ul>
        </div>
    </div>
@endisset
