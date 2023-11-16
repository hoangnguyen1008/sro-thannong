@extends('theme::layouts.app', ['alias' => 'Downloads'])
@section('theme::title', __('seo.downloads'))
@section('theme::content')
    <div class="card">
        <div class="card-header">
            <h2>{{ __('downloads.title') }}</h2>
        </div>
        <div class="card-body">
            <div class="row">
                @forelse($downloads as $download)
                    <div class="col-md-3">
                        <div class="card">
                            @if(isset($download->image))
                                <img
                                    src="{{ route('images.image', ['image'=> ($download->image) ? $download->image->filename : null]) }}"
                                    class="img-fluid mx-auto"
                                    width="170"
                                    loading="lazy"
                                    alt="{{ $download->name }}">
                            @endif
                            <div class="card-body">
                                <h5 class="card-title">
                                    {{ $download->name }}
                                </h5>
                                <p class="card-text">
                                    {{ $download->file_size }}
                                </p>
                                <a href="{{ $download->link }}" target="_blank"
                                   class="btn btn-sm btn-primary">
                                    {{ __('downloads.download-button') }}
                                </a>
                            </div>
                        </div>
                    </div>
                @empty
                    <div class="col-auto">
                        {{ __('downloads.no-downloads') }}
                    </div>
                @endforelse
            </div>
        </div>
    </div>
@endsection
