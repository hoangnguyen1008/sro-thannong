@isset($TopTenPlayersProvider)
    <div class="card table-ranking">
        <div class="card-header">
            <h5>{{ __('sidebar.topten-players.title') }}</h5>
        </div>
        <div class="card-body">
            <table class="table table-hover table-striped">
                <thead>
                <tr>
                    <th>#</th>
                    <th>{{__('sidebar.topten-players.name')}}</th>
                    <th>{{__('sidebar.topten-players.points')}}</th>
                </tr>
                </thead>
                <tbody>
                @forelse($TopTenPlayersProvider as $count => $player)
                    <tr>
                        <td>{{$count+1}}</td>
                        <td>
                            <a href="{{ route('information-player', ['CharName16' => Str::lower($player->CharName16)]) }}">
                                {{ $player->CharName16 }}
                            </a></td>
                        <td>{{$player->ItemPoints}}</td>
                    </tr>
                @empty
                    <tr>
                        <td colspan="3">{{ __('sidebar.topten-players.empty') }}</td>
                    </tr>
                @endforelse
                </tbody>
            </table>
        </div>
    </div>
@endisset
