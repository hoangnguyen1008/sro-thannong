@extends('theme::layouts.app', ['alias' => 'pages', 'slug'=>$slug])

@section('theme::title', __('seo.styles'))

@section('theme::content')
    <div class="card">
        @forelse($pageContent->getContent as $page)
            <div class="card-body mb-3">
                <div class="card">
                    <div class="card-header">
                        <span>{{ $page->title }}</span>
                    </div>
                    <div class="card-body">
                        {!! $page->body !!}
                    </div>
                </div>
            </div>
        @empty
            <div class="card">
                <div class="card-header">
                    <span>{{ __('pages.title') }}</span>
                </div>
                <div class="card-body">
                    {{ __('pages.empty') }}
                </div>
            </div>
        @endforelse
    </div>
@endsection
