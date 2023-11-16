@extends('theme::layouts.app')
@section('theme::title', __('seo.voteforsilk'))
@section('theme::sidebar')
    @include('theme::frontend.account.sidebar')
@endsection

@section('theme::content')
    <div class="card">
        <div class="card-header">
            <h2>
                {{ __('home.voteforsilk.title') }}
            </h2>
        </div>
        <div class="card-body">
            @forelse($data as $vote)
                @if($vote->active === 1)
                    <div class="col-6 col-md-6 col-sm-12 col-xs-12">
                        <div class="card">
                            <div class="card-body">
                                <h5 class="card-title">
                                    {{ $vote->name }}
                                </h5>
                                <p class="card-text">
                                        <span class="row">
                                            <span class="col-12">
                                               {{ __('home.voteforsilk.reward', [
                                                    'reward' => $vote->reward
                                                ]) }}
                                            </span>
                                            <span class="col-12 mt-2">
                                                @if(!$vote->getVoted || \Carbon\Carbon::create($vote->getVoted->vote_again_at)->isPast())
                                                    <a class="btn btn-theme" target="_blank" rel="noopener noreferrer"
                                                       href="{{ route('vote-for-silk-voting', ['id' => $vote->id]) }}">
                                                        {{ __('home.voteforsilk.submit') }}
                                                    </a>
                                                @else
                                                    <button class="btn btn-theme" disabled>
                                                        {{ __('home.voteforsilk.wait', [
                                                            'time' => \Carbon\Carbon::create(
                                                            $vote->getVoted->vote_again_at
                                                            )->diffInMinutes()
                                                        ]) }}
                                                    </button>
                                                @endif
                                            </span>
                                        </span>
                                </p>
                            </div>
                        </div>
                    </div>
                @endif
            @empty
                {{ __('home.voteforsilk.empty') }}
            @endforelse
        </div>
    </div>
@endsection
@push('theme::javascript')
    <script>
        $(document).ready(function () {

        });
    </script>
@endpush
