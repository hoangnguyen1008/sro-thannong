@extends('theme::layouts.app')
@section('theme::title', __('seo.news.index', ['name' => $news->title]))
@section('theme::content')
    <div class="col-xl-9 col-lg-9 col-md-12 col-sm-12 col-12">
        <div class="container">
            <div class="row justify-content-center">
                <div class="col-md-12">
                    <article>
                    <h1 class="mt-4">
                        {{ $news->title }}
                    </h1>
                    <p>{{ __('news.posted', ['date' => $news->published_at->diffForHumans()]) }}</p>
                    <p class="lead">
                        {!! $news->body !!}
                    </p>
                    </article>
                </div>
            </div>
        </div>
    </div>
@endsection
