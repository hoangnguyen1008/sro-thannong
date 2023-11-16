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
        @forelse($news as $newsData)
            <div class="card-body">
                <div class="card">
                    <div class="card-header">
                        <a class="text-decoration-none h4" href="{{ route('news-slug', ['slug' => $newsData->slug]) }}">
                            {{ $newsData->title }}
                        </a>
                        <div class="small">{{\Carbon\Carbon::make($newsData->updated_at)->format('Y-m-d h:i A')}}</div>
                    </div>
                    <div class="card-body">
                        {!! $newsData->body !!}
                    </div>
                </div>
            </div>
        @empty
            <div class="card-body">
                {{__('news.no-news')}}
            </div>
        @endforelse
    </div>
@endsection
