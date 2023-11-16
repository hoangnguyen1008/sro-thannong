@isset($PvpRecordsProvider)
    <p class="font-weight-light font-weight-bold pt-3">
        {{ __('sidebar.pvp.title') }}
    </p>
    <table class="table table-hover table-striped mt-2">
        <tr>
            <th>Tàn sát</th>
        </tr>
        <tbody>
        @forelse($PvpRecordsProvider as $record)
            <tr>
                <td><span class="font-weight-bold" style="color: orange;">{{ $record->CharName }}</span> Đã bị hạ gục bởi <span class="font-weight-bold" style="color: orange;">{{$record->KilledCharName}}</span></td>
            </tr>
        @empty
            <tr>
                <td colspan="3">{{ __('sidebar.pvp.empty') }}</td>
            </tr>
        @endforelse
        </tbody>
    </table>
@endisset
