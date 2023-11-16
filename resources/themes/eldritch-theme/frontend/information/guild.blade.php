@extends('theme::layouts.app')
@section('theme::title', __('seo.information.guild', ['name' => $guild->Name]))
@section('theme::content')
    <div class="card">
        <div class="card-header">
            <h2>{{ __('information.guild.title', ['name' => $guild->Name]) }}</h2>
        </div>
        <div class="card-body">
            <div class="row">
                <div class="col-12">
                    {{ __('information.guild.itempoints', ['points' => $guild->ItemPoints]) }}
                </div>
                <div class="col-12">
                    {{ __('information.guild.master', [
                    'name' => $guild->getGuildMembers->where('Permission', -1)->pluck('CharName')->first()
                    ]) }}
                </div>
            </div>
            <div class="row">
                <div class="col-12">
                    <table class="table table-hover table-striped" id="guildTable">
                        <thead>
                        <tr>
                            <th>
                                {{ __('information.guild.table.char') }}
                            </th>
                            <th>
                                {{ __('information.guild.table.level') }}
                            </th>
                            <th scope="col" class="d-none d-sm-table-cell">
                                {{ __('information.guild.table.join') }}
                            </th>
                            <th scope="col" class="d-none d-sm-table-cell">
                                {{ __('information.guild.table.gp') }}
                            </th>
                            <th>
                                {{ __('information.guild.table.itempoints') }}
                            </th>
                        </tr>
                        </thead>
                        <tbody>
                        @foreach($guild->getGuildMembers as $member)
                            <tr>
                                <td class="table-nowrap">
                                    <img src="{{ route('images.characters', ['image' => $member->RefObjID.'.gif']) }}"
                                         loading="lazy"
                                         class="img-fluid d-none d-sm-inline" width="16" height="16"
                                         alt="{{ $member->CharName16 }}">
                                    <a href="{{ route('information-player', ['CharName16' => Str::lower($member->CharName)]) }}">
                                        {{ $member->CharName }}</a>
                                    <a href="{{ route('information-player', ['CharName16' => Str::lower($member->CharName)]) }}"
                                       target="_blank">
                                        <i class="fas small fa-external-link-alt pl-2"></i>
                                    </a>

                                </td>
                                <td>
                                    {{ $member->CharLevel }}
                                </td>
                                <td class="d-none d-sm-table-cell">
                                    {{ $member->JoinDate }}
                                </td>
                                <td class="d-none d-sm-table-cell">
                                    {{ number_format($member->GP_Donation, 0, ',', '.') }}
                                </td>
                                <td>
                                    {{ $member->getCharItemPoints->ItemPoints }}
                                </td>
                            </tr>
                        @endforeach
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
@endsection
@push('theme::javascript')
    <script>
        $(document).ready(function () {
            $('#guildTable').DataTable({
                bLengthChange: false,
                order: [
                    [4, 'desc']
                ],
                dom: 'lfrt',
            });
        });
    </script>
@endpush
