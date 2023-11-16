@extends('theme::backend.layouts.app')

@section('theme::backend-content')
    @include('theme::backend.layouts.navbar')

    <div class="container-fluid">
        <div class="d-sm-flex align-items-center justify-content-between mb-4">
            <h1 class="h3 mb-0 text-gray-800">{{ __('backend/tbuser.title') }}</h1>
        </div>
        @if ($message = Session::get('success'))
            <div class="py-3 mt-2">
                <div class="alert alert-success alert-block">
                    <button type="button" class="close" data-dismiss="alert">×</button>
                    <strong>{{ $message }}</strong>
                </div>
            </div>
        @endif
        <div class="row">
            <div class="col-12 col-sm-12 col-md-12 col-lg-8 col-xl-8">
                <div class="card shadow mb-4">
                    <div class="card-header py-3">
                        <h6 class="m-0 font-weight-bold text-primary">
                            {{ __('backend/tbuser.edit.title') }} [{{ $tbuser->JID }}]
                            @if($tbuser->sec_primary === 1 && $tbuser->sec_content === 1)
                                <span class="badge badge-danger">{{ __('backend/tbuser.gmrank') }}</span>
                            @endif
                        </h6>
                    </div>
                    <div class="card-body">
                        <div class="row">
                            <div class="col-12">
                                @if(!$tbuser->getIsBlockedUser->isEmpty())
                                    <div class="card mb-4 py-3 border-left-danger">
                                        <div class="card-body">
                                            {{ $tbuser->getIsBlockedUser->isEmpty() ? '' : __('backend/tbuser.blocked', ['date' => $tbuser->getIsBlockedUser[0]->timeEnd]) }}
                                        </div>
                                    </div>
                                @endif
                            </div>

                            @php
                                $ss = $tbuser->AccPlayTime;
                                $s = $ss%60;
                                $m = floor(($ss%3600)/60);
                                $h = floor(($ss%86400)/3600);
                                $d = floor(($ss%2592000)/86400);
                                $M = floor($ss/2592000);
                            @endphp
                            <div class="col-12">
                                <div class="table-responsive">
                                    <table class="table table-borderless table-striped">
                                        <tbody>
                                        <tr>
                                            <td>{{ __('backend/tbuser.struserid') }}</td>
                                            <td>{{ $tbuser->StrUserID }}</td>
                                        </tr>
                                        <tr>
                                            <td>{{ __('backend/tbuser.email') }}</td>
                                            <td>{{ $tbuser->Email }}</td>
                                        </tr>
                                        <tr>
                                            <td>{{ __('backend/tbuser.accplaytime') }}</td>
                                            <td>{{ "$M Months, {$d} Days {$h} Hours {$m} Minutes" }}</td>
                                        </tr>
                                        <tr>
                                            <td>{{ __('backend/tbuser.regip') }}</td>
                                            <td>{{ $tbuser->reg_ip }}</td>
                                        </tr>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="card mb-4">
                    <div class="card-header">
                        {{ __('backend/tbuser.edit.accounts') }}
                    </div>
                    <div class="card-body">
                        <div class="container mt-2">
                            <div class="row">
                                @forelse($tbuser->getsharduser as $tbUserChar)
                                    <div class="col-12 col-sm-12 col-md-3 col-lg-3 col-xl-3">
                                        <ul class="list-group list-group-flush small">
                                            <li class="list-group-item font-weight-bold">
                                                <a href="{{ route('sro-players-edit-backend', ['char' =>  $tbUserChar->pivot->CharID ]) }}">
                                                    {{ $tbUserChar->CharName16 }}
                                                </a>
                                            </li>
                                            <li class="list-group-item">
                                                {{ __('backend/tbuser.edit.level') }} {{ $tbUserChar->CurLevel }}
                                            </li>
                                            <li class="list-group-item">
                                                {{ __('backend/tbuser.edit.guild') }} {{ $tbUserChar->getGuildUser ? $tbUserChar->getGuildUser->Name : '' }}
                                            </li>
                                            <li class="list-group-item">
                                                {{ __('backend/tbuser.edit.guild-nickname') }} {{ $tbUserChar->getGuildMemberUser ? $tbUserChar->getGuildMemberUser->Nickname : '' }}
                                            </li>
                                        </ul>
                                    </div>

                                @empty
                                    {{ __('backend/tbuser.edit.no-char') }}
                                @endforelse
                            </div>
                        </div>
                    </div>
                </div>

            </div>
            <div class="col-12 col-sm-12 col-md-12 col-lg-4 col-xl-4">
                <div class="card shadow mb-4">
                    <div class="card-header py-3">
                        <h6 class="m-0 font-weight-bold text-primary">
                            {{ __('backend/tbuser.edit.title-silk') }}
                        </h6>
                    </div>
                    <div class="card-body">
                        <div class="row">
                            <div class="col-4">
                                {{ __('backend/tbuser.silk') }}
                            </div>
                            <div class="col-8" id="currentSilk">
                                {{ $tbuser->getSkSilk ? $tbuser->getSkSilk->silk_own : '0' }}
                            </div>
                        </div>
                        <div class="form-group row">
                            <div class="col-4">
                                <label for="silk">
                                    {{ __('backend/tbuser.silk-add') }}
                                </label>
                            </div>
                            <div class="col-6">
                                <input id="silkAmount" type="number"
                                       class="form-control form-control-sm @error('silkAmount') is-invalid @enderror"
                                       name="silkAmount" value="{{ old('silkAmount') }}">
                                @error('silkAmount')
                                <span class="invalid-feedback" role="alert">
                                        <strong>{{ $message }}</strong>
                                    </span>
                                @enderror
                            </div>
                        </div>
                        <div class="form-group row mb-0">
                            <div class="col-6 offset-4">
                                <button type="button" class="btn btn-sm btn-primary" id="addSilk">
                                    {{ __('backend/tbuser.silk-add-button') }}
                                </button>
                                <button type="button" class="btn btn-sm btn-primary" id="removeSilk">
                                    {{ __('backend/tbuser.silk-remove-button') }}
                                </button>
                            </div>
                        </div>
                        <div id="silkError">
                        </div>
                    </div>
                </div>
                <div class="card shadow mb-4">
                    <div class="card-header py-3">
                        <h6 class="m-0 font-weight-bold text-primary">
                            {{ __('backend/tbuser.edit.title-block') }}
                        </h6>
                    </div>
                    <div class="card-body">
                        <form method="POST"
                              action="{{ route('sro-user-block-add-backend', ['user' => $tbuser->JID]) }}">
                            @csrf
                            <div class="form-group row">
                                <div class="col-4">
                                    <label for="block">
                                        {{ __('backend/tbuser.block-add') }}
                                    </label>
                                </div>
                                <div class="col-8">
                                    <input id="block" type="datetime-local"
                                           class="form-control form-control-sm @error('block') is-invalid @enderror"
                                           name="block" value="{{ old('block') }}">
                                    @error('block')
                                    <span class="invalid-feedback" role="alert">
                                            <strong>{{ $message }}</strong>
                                        </span>
                                    @enderror
                                </div>
                            </div>
                            <div class="form-group row">
                                <div class="col-4">
                                    <label for="title">
                                        {{ __('backend/tbuser.block-title') }}
                                    </label>
                                </div>
                                <div class="col-8">
                                    <input id="title" type="text"
                                           class="form-control form-control-sm @error('title') is-invalid @enderror"
                                           name="title" value="{{ old('title') }}">
                                    @error('reason')
                                    <span class="invalid-feedback" role="alert">
                                            <strong>{{ $message }}</strong>
                                        </span>
                                    @enderror
                                </div>
                            </div>
                            <div class="form-group row">
                                <div class="col-4">
                                    <label for="description">
                                        {{ __('backend/tbuser.block-guide') }}
                                    </label>
                                </div>
                                <div class="col-8">
                                    <input id="description" type="text"
                                           class="form-control form-control-sm @error('description') is-invalid @enderror"
                                           name="description" value="{{ old('description') }}">
                                    @error('description')
                                    <span class="invalid-feedback" role="alert">
                                            <strong>{{ $message }}</strong>
                                        </span>
                                    @enderror
                                </div>
                            </div>
                            <div class="form-group row">
                                <div class="col-4">
                                    <label for="type">
                                        {{ __('backend/tbuser.block-type') }}
                                    </label>
                                </div>
                                <div class="col-8">
                                    <select class="form-control" id="type" name="type">
                                        <option value="{{ \App\Http\Model\SRO\Account\Punishment::TYPE_BLOCK_LOGIN }}">
                                            {{ __('backend/tbuser.block-type-login') }}
                                        </option>
                                        {{--                                        <option value="{{ \App\Http\Model\SRO\Account\Punishment::TYPE_BLOCK_P2P_TRADE }}">--}}
                                        {{--                                            {{ __('backend/tbuser.block-type-p2p') }}--}}
                                        {{--                                        </option>--}}
                                        {{--                                        <option value="{{ \App\Http\Model\SRO\Account\Punishment::TYPE_BLOCK_WHOLE_CHAT }}">--}}
                                        {{--                                            {{ __('backend/tbuser.block-type-chat') }}--}}
                                        {{--                                        </option>--}}
                                    </select>
                                    @error('type')
                                    <span class="invalid-feedback" role="alert">
                                            <strong>{{ $message }}</strong>
                                        </span>
                                    @enderror
                                </div>
                            </div>
                            <div class="form-group row mb-0">
                                <div class="col-6 offset-4">
                                    <button type="submit" class="btn btn-sm btn-primary">
                                        {{ __('backend/tbuser.block-add-button') }}
                                    </button>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
                <div class="card shadow mb-4">
                    <div class="card-header py-3">
                        <h6 class="m-0 font-weight-bold text-primary">
                            {{ __('backend/tbuser.edit.role-title') }}
                        </h6>
                    </div>
                    <div class="card-body">
                        <ul class="list-group list-group-flush">
                            <form method="POST"
                                  action="{{ route('sro-user-role-sync-backend', ['user' => $tbuser->getWebUser->id]) }}">
                                @method('PUT')
                                @csrf
                                @foreach($allRoles as $role)
                                    <li class="list-group-item">
                                        <input type="checkbox" name="roles[]"
                                               id="role-{{ $role->id }}" value="{{ $role->name }}"
                                                {{ $userRoles->contains($role->name) ? 'checked' : '' }}>
                                        <label class="form-check-label text-capitalize"
                                               for="role-{{ $role->id }}">{{ $role->name }}</label>
                                    </li>
                                @endforeach
                                <li class="list-group-item">
                                    <input type="submit"
                                           class="btn btn-sm btn-outline-primary float-right"
                                           value="{{ __('backend/tbuser.edit.role-submit') }}">
                                </li>
                            </form>
                        </ul>
                    </div>
                </div>
            </div>
        </div>

        <div class="row">
            <div class="col-12 col-sm-12 col-md-12 col-lg-12 col-xl-12">
                <div class="card shadow mb-4">
                    <div class="card-header py-3">
                        <h6 class="m-0">
                            {{ __('backend/tbuser.silk-history') }}
                        </h6>
                    </div>
                    @if($tbuser->getsksilkhistory->isEmpty())
                        <div class="card-body">
                            <div class="container mt-2">
                                <div class="row">
                                    {{ __('backend/tbuser.edit.silk-history-empty') }}
                                </div>
                            </div>
                        </div>
                    @else
                        <div class="card-body">
                            <div class="table-responsive table-borderless">
                                <table class="table" id="silkHistory">
                                    <thead>
                                    <tr>
                                        <th>{{ __('backend/tbuser.edit.buy-quantity') }}</th>
                                        <th>{{ __('backend/tbuser.edit.silk-remain') }}</th>
                                        <th>{{ __('backend/tbuser.edit.silk-reason') }}</th>
                                        <th>{{ __('backend/tbuser.edit.silk-type') }}</th>
                                        <th>{{ __('backend/tbuser.edit.silk-method') }}</th>
                                        <th>{{ __('backend/tbuser.edit.auth-date') }}</th>
                                        <th>{{ __('backend/tbuser.edit.silk-ip') }}</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    @forelse($tbuser->getsksilkhistory as $silk)
                                        <tr>
                                            <td>{{ $silk->BuyQuantity }}</td>
                                            <td>{{ $silk->Silk_Remain }}</td>
                                            <td>{{ $silk->Silk_Reason }}</td>
                                            <td>{{ $silk->Silk_Type }}</td>
                                            <td>{{ $silk->SlipPaper }}</td>
                                            <td>{{ $silk->AuthDate }}</td>
                                            <td>{{ $silk->IP }}</td>
                                        </tr>
                                    @empty
                                        {{ __('backend/tbuser.edit.silk-history-empty') }}
                                    @endforelse
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    @endif
                </div>
            </div>
        </div>

        <div class="row">
            <div class="col-12 col-sm-12 col-md-12 col-lg-12 col-xl-12">
                <div class="card mb-4">
                    <div class="card-header">
                        {{ __('backend/tbuser.edit.punishment') }}
                    </div>
                    @if($tbuser->getpunishmentuser->isEmpty())
                        <div class="card-body">
                            <div class="container mt-2">
                                <div class="row">
                                    {{ __('backend/tbuser.edit.punishment-empty') }}
                                </div>
                            </div>
                        </div>
                    @else
                        <div class="card-body">
                            <div class="table-responsive table-borderless">
                                <table class="table" id="dataTable">
                                    <thead>
                                    <tr>
                                        <th>{{ __('backend/tbuser.edit.jid') }}</th>
                                        <th>{{ __('backend/tbuser.edit.guide') }}</th>
                                        <th>{{ __('backend/tbuser.edit.description') }}</th>
                                        <th>{{ __('backend/tbuser.edit.blockstarttime') }}</th>
                                        <th>{{ __('backend/tbuser.edit.blockendtime') }}</th>
                                        <th>{{ __('backend/tbuser.edit.action') }}</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    @forelse($tbuser->getpunishmentuser as $punishment)
                                        <tr>
                                            <td>{{ $punishment->UserJID }}</td>
                                            <td>{{ $punishment->Guide }}</td>
                                            <td>{{ $punishment->Description }}</td>
                                            <td>{{ $punishment->BlockStartTime }}</td>
                                            <td>{{ $punishment->BlockEndTime }}</td>
                                            <td>
                                                <form method="POST" data-form="deleteForm"
                                                      action="{{ route('sro-user-block-destroy-backend', ['user' => $tbuser->JID]) }}">
                                                    <input type="hidden" name="serialno"
                                                           value="{{ $punishment->SerialNo }}">
                                                    @csrf
                                                    <span data-toggle="modal" data-target="#punishmentModalDelete"
                                                          data-title="{{ __('backend/tbuser.edit.delete-modal-title') }} {{ $punishment->SerialNo }}"
                                                          data-message="{{ __('backend/tbuser.edit.delete-modal-body') }}"
                                                          class="btn btn-danger btn-circle btn-sm"
                                                          style="cursor: pointer">
                                                    <i class="fa fa-trash"></i>
                                                </span>
                                                </form>
                                            </td>
                                        </tr>
                                    @empty
                                        {{ __('backend/tbuser.edit.punishment-empty') }}
                                    @endforelse
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    @endif
                </div>
            </div>
        </div>
    </div>

    <div class="modal fade" id="punishmentModalDelete" role="dialog" aria-labelledby="punishmentModalDeleteLabel"
         aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title"></h5>
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <p></p>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-sm btn-secondary"
                            data-dismiss="modal">{{ __('backend/notification.modal.return') }}</button>
                    <button type="button" class="btn btn-sm btn-danger"
                            id="confirm">{{ __('backend/notification.modal.submit') }}</button>
                </div>
            </div>
        </div>
    </div>

@endsection
@push('theme::javascript')
    <script>
        $(document).ready(function () {
            $('#punishmentModalDelete').find('.modal-footer #confirm').on('click', function () {
                $(this).data('form').submit();
            });
            $('#punishmentModalDelete').on('show.bs.modal', function (e) {
                $(this).find('.modal-body p').text($(e.relatedTarget).attr('data-message'));
                $(this).find('.modal-title').text($(e.relatedTarget).attr('data-title'));

                let form = $(e.relatedTarget).closest('form');
                $(this).find('.modal-footer #confirm').data('form', form);
            });
            $('form[data-form="deleteForm"]').on('click', '.form-delete', function (e) {
                e.preventDefault();
                $('#confirm').modal({backdrop: 'static', keyboard: false})
                    .on('click', '#delete-btn', function () {
                        $('form[data-form="deleteForm"]').submit();
                    });
            });
            $('#silkHistory').DataTable({
                "order": [[5, "desc"]],
                "lengthMenu": [[5, 25, 50, 100, 200, -1], [10, 25, 50, 100, 200, "{{ __('backend/datatables.show-all') }}"]],
                "language": {
                    "search": "{{ __('backend/datatables.search') }}",
                    "lengthMenu": "{{ __('backend/datatables.length') }}",
                    "zeroRecords": "{{ __('backend/datatables.zero') }}",
                    "info": "{{ __('backend/datatables.info') }}",
                    "infoEmpty": "{{ __('backend/datatables.empty') }}",
                    "infoFiltered": "{{ __('backend/datatables.info-filtered') }}",
                    "paginate": {
                        "first": "{{ __('backend/datatables.first') }}",
                        "last": "{{ __('backend/datatables.last') }}",
                        "next": "{{ __('backend/datatables.next') }}",
                        "previous": "{{ __('backend/datatables.prev') }}"
                    }
                },
                "classes": {
                    "sPageButton": "button small",
                    "sPageButtonActive": "green",
                    "sPageButtonDisabled": "helper hide"
                },
                "select": {
                    "style": "os",
                    "className": "row-selected"
                },
                "dom": "btrp"
            });
            $('div.dataTables_filter input').addClass('search-input form-control');
            $('select').addClass('search-input form-control');


            const silkAmount = $('#silkAmount');
            const addSilkButton = $('#addSilk');
            const removeSilkButton = $('#removeSilk');

            addSilkButton.click({state: 'add', btn: addSilkButton}, send);
            removeSilkButton.click({state: 'remove', btn: removeSilkButton}, send);

            function send(event) {
                let state = event.data.state;
                let btn = event.data.btn;

                let currentSilk = $('#currentSilk');
                let beforeSilk = silkAmount.val();

                let btnText = btn.html();
                btn.html('<i class="fas fa-circle-notch fa-spin"></i>');

                silkAmount.attr('disabled', 'disabled');

                $.post({
                    url: '{{ route('sro-user-silk-backend', ['user' => $tbuser->JID]) }}',
                    data: {
                        charId: {{ $tbuser->JID }},
                        amount: beforeSilk,
                        state: state,
                    },
                    headers: {
                        'X-CSRF-TOKEN': '{{ csrf_token() }}',
                    },
                    success: function (data) {
                        let successHtml = '<div class="alert alert-success alert-dismissible fade show" role="alert"><ul class="list-unstyled">';
                        $.each(data, function (k, v) {
                            successHtml += '<li>' + v + '</li>';
                        });
                        successHtml += '</ul></di>';

                        $('#silkError').html(successHtml);
                        btn.html(btnText);
                        silkAmount.removeAttr('disabled').val('');

                        let value;
                        if (state === "add") {
                            value = parseInt(currentSilk.text()) + parseInt(beforeSilk);
                        } else {
                            value = parseInt(currentSilk.text()) - parseInt(beforeSilk);
                        }
                        currentSilk.text(value);
                    },
                    error: function (data) {
                        const errors = data.responseJSON;
                        let errorsHtml = '<div class="alert alert-danger alert-dismissible fade show" role="alert"><ul class="list-unstyled">';
                        $.each(errors.state, function (k, v) {
                            errorsHtml += '<li>' + v + '</li>';
                        });
                        errorsHtml += '</ul></di>';

                        $('#silkError').html(errorsHtml);
                        btn.html(btnText);
                        silkAmount.removeAttr('disabled').val('');
                    }
                }).done(function (d) {
                    btn.html(btnText);
                });
            }
        });
    </script>
@endpush
