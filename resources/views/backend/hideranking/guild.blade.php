@extends('theme::backend.layouts.app')

@section('theme::backend-content')
    @include('theme::backend.layouts.navbar')

    <div class="container-fluid">
        <div class="d-sm-flex align-items-center justify-content-between mb-4">
            <h1 class="h3 mb-0 text-gray-800">{{ __('backend/hideranking.guild.title') }}</h1>
        </div>
        <div class="container">
            @if ($message = Session::get('success'))
                <div class="row">
                    <div class="col-12">
                        <div class="alert alert-success alert-block">
                            <button type="button" class="close" data-dismiss="alert">×</button>
                            <strong>{{ $message }}</strong>
                        </div>
                    </div>
                </div>
            @endif
            <div class="row">
                <div class="col-8">
                    <div class="table-responsive">
                        <table id="users" class="table table-striped table-hover dataTable">
                            <thead class="thead-dark">
                            <tr>
                                <th scope="col">{{ __('backend/hideranking.guild.table.guild') }}</th>
                                <th scope="col">{{ __('backend/hideranking.guild.table.actions') }}</th>
                            </tr>
                            </thead>
                            <tbody>
                            @foreach ($hidden as $guild)
                                <tr>
                                    <td>
                                        {{ $guild->guild }}
                                    </td>
                                    <td>
                                        <form method="POST" data-form="deleteForm"
                                              action="{{ route('hide-ranking-guild-destroy-backend', ['id' => $guild->id]) }}">
                                            @csrf
                                            <span data-toggle="modal" data-target="#guildModalDelete"
                                                  data-title="{{ __('backend/hideranking.guild.delete-title') }}"
                                                  data-message="{{ __('backend/hideranking.guild.delete-message', ['guild' => $guild->guild]) }}"
                                                  class="btn btn-danger btn-circle btn-sm" style="cursor: pointer">
                                                    <i class="fa fa-trash"></i>
                                                </span>
                                        </form>
                                    </td>
                                </tr>
                            @endforeach
                            </tbody>
                        </table>
                    </div>
                </div>
                <div class="col-4">
                    <div class="card shadow mb-4">
                        <div class="card-header py-3">
                            <h6 class="m-0">
                                {{ __('backend/hideranking.guild.form.title') }}
                            </h6>
                        </div>
                        <div class="card-body">
                            <form method="POST" action="{{ route('hide-ranking-guild-add-backend') }}">
                                @csrf
                                <div class="row">
                                    <div class="col-12">
                                        <label for="guild">
                                            {{ __('backend/hideranking.guild.form.guild') }}
                                        </label>
                                        <p class="small">
                                            {{ __('backend/hideranking.guild.form.title-help') }}
                                        </p>
                                    </div>
                                    <div class="col-8">
                                        <input id="guild"
                                               class="form-control form-control-sm @error('guild') is-invalid @enderror"
                                               name="guild" value="{{ old('guild') }}" autocomplete="off">
                                        @error('guild')
                                        <span class="invalid-feedback" role="alert">
                                            <strong>{{ $message }}</strong>
                                        </span>
                                        @enderror
                                    </div>
                                    <div class="col-4">
                                        <button type="submit" class="btn btn-sm btn-primary">
                                            {{ __('backend/hideranking.guild.form.submit') }}
                                        </button>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="modal fade" id="guildModalDelete" role="dialog" aria-labelledby="guildModalDeleteLabel"
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
    <script type="text/javascript">
        $(document).ready(function () {
            $('#guildModalDelete').find('.modal-footer #confirm').on('click', function () {
                $(this).data('form').submit();
            });
            $('#guildModalDelete').on('show.bs.modal', function (e) {
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
        });
    </script>
@endpush
