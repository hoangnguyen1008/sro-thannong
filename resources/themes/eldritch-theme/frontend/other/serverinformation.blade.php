@extends('theme::layouts.app', ['alias' => 'ServerInformation'])
@section('theme::title', __('seo.serverinformation'))
@section('theme::content')
    <div class="card">
        <div class="card-header">
            <h2>{{ __('serverinformation.title') }}</h2>
        </div>
        <div class="card-body">
            <div id="accordion">
                @forelse($information as $info)
                    <div class="card">
                        <div class="card-header" id="heading-{{ $info->id }}">
                            <h5 class="mb-0">
                                <button class="btn btn-link collapsed" data-toggle="collapse"
                                        data-target="#collapse-{{ $info->id }}" aria-expanded="false"
                                        aria-controls="collapse-{{ $info->id }}">
                                    {{ $info->title }}
                                </button>
                            </h5>
                        </div>
                        <div id="collapse-{{ $info->id }}" class="collapse"
                             aria-labelledby="heading-{{ $info->id }}" data-parent="#accordion">
                            <div class="card-body">
                                {!! $info->body !!}
                            </div>
                        </div>
                    </div>
                @empty
                    <div class="col-12 py-3">
                        {{ __('serverinformation.empty') }}
                    </div>
                @endforelse
            </div>

        </div>
    </div>
@endsection
