@extends('theme::layouts.app', ['alias' => 'AuctionHouse'])
@section('theme::title', __('seo.auctionshouse.index'))
@section('theme::sidebar')
    @include('theme::frontend.account.auctionsidebar', ['filter_type' => $filter])
@endsection

@section('theme::content')
    @if(session()->has('success'))
        <div class="alert alert-success alert-dismissible fade show" role="alert">
            {{ session()->get('success') }}
            <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                <span aria-hidden="true">&times;</span>
            </button>
        </div>
    @endif
    <div class="card">
        <div class="card-header">
            <h2>
                {{ __('auctionshouse.title') }}
            </h2>
        </div>
        <div class="card-body">
            <div class="mb-4">
                @if(isset($mode) && $mode === 'all')
                    <div class="ml-auto mr-3">
                        <a href="{{ route('auctions-house', 'own') }}" type="button"
                           class="btn btn-theme">
                            {{ __('auctionshouse.your') }}
                        </a>
                    </div>
                @elseif(isset($mode) && $mode === 'own')
                    <div class="ml-auto mr-3">
                        <a href="{{ route('auctions-house', 'all') }}" type="button" class="btn btn-theme">
                            {{ __('auctionshouse.title') }}
                        </a>
                        <a href="{{ route('auctions-house-add-item') }}" type="button"
                           class="btn btn-secondary">
                            {{ __('auctionshouse.new') }}
                        </a>
                    </div>
                @endif
            </div>
            {!! $dataTable->table(['class' => 'table table-hover table-bordered table-striped w-100'], true) !!}
        </div>
    </div>
@endsection
@push('theme::javascript')
    {!! $dataTable->scripts() !!}
    <script type="text/javascript">
        $(document).ready(function () {
            $('tbody').tooltip({
                items: "[data-itemInfo], [title]",
                position: {my: "left+10 center", at: "right center"},
                content: function () {
                    let element = jQuery(this);
                    if (jQuery(this).prop("tagName").toUpperCase() === 'IFRAME') {
                        return;
                    }
                    if (element.is("[data-itemInfo]")) {
                        if (element.parent().parent().find('.itemInfo').html() === '') {
                            return;
                        }
                        return element.parent().parent().find('.itemInfo').html();
                    }
                    if (element.is("[title]")) {
                        return element.attr("title");
                    }
                },
                close: function (event, ui) {
                    $(".ui-helper-hidden-accessible").remove();
                }
            });
        });
        @if($mode === 'own')
        function DeleteData(id) {
            bootbox.confirm({
                title: "{{__('bootbox.delete.title')}}",
                message: "{{__('bootbox.delete.message')}}",
                buttons: {
                    confirm: {
                        label: "{{ __('bootbox.delete.buttons.submit') }}",
                        className: 'btn-danger'
                    },
                    cancel: {
                        label: "{{ __('bootbox.delete.buttons.cancel') }}",
                        className: 'btn-default'
                    }
                },
                callback: function (result) {
                    if (result == true) {
                        let url = "{{route('auction-house-cancel-own', ['id' => ':id'])}}";
                        url = url.replace(':id', id);
                        axios.delete(url)
                            .then(function (data) {
                                toastr.success("{{__('auctionshouse.notification.cancel.successfully')}}.");
                                /*refresh table*/
                                $('#dataTableBuilder_wrapper').find('.buttons-reload').click();
                            })
                            .catch(function (error) {
                                toastr.error("{{trans('backend/notification.form-submit.error')}}");
                            });
                    }
                }
            });
        }
        @endif
    </script>
@endpush
