@extends('theme::layouts.app', ['alias' => 'Home'])
@section('theme::title', __('seo.index'))
@section('theme::content')
<div class="card">
    <div class="card-header">
        <h2>
            {{ __('index.latest-news') }}
        </h2>
        @if($news->count() > 4)
        <div class="col-sm-4">
            <div class="main-btn-holder">
                <a href="{{ route('news-archive') }}" class="hbtn hbtn-default">
                    {{ __('index.show-all') }}
                </a>
            </div>
        </div>
        @endif
    </div>

    <div class="card-body">
        <div class="card">
            @forelse($news as $key => $newsData)
            @if($key != 0)
            <a class="text-decoration-none h4" href="{{ route('news-slug', ['slug' => $newsData->slug]) }}">
                {{ $newsData->title }}
            </a>
            @endif
            @empty
            @endforelse
        </div>
    </div>

    <div class="card-body">
        <div class="card">
            <a class="text-decoration-none h4" href="{{ route('news-slug', ['slug' => $newsData->slug]) }}">
                {{ $news[0]->title }}
            </a>
            {!! $news[0]->body !!}
        </div>
    </div>
</div>
@endsection