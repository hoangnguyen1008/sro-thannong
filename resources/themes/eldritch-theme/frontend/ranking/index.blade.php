@extends('theme::layouts.app', ['alias' => 'Ranking'])
@section('theme::title', __('seo.ranking.index', ['name' => Str::ucfirst($mode)]))
@section('theme::content')
    <div class="card">
        <div class="card-header">
            <h2>{{ __('ranking.title') }}</h2>
        </div>
        <div class="card-body">
            <div class="btn-toolbar mb-3" role="toolbar">
                @if(config('siteSettings.char_ranking', true))
                    <div class="btn-group p-2" role="group"
                         aria-label="{{ __('ranking.search.charname') }}">
                        <a href="{{ route('ranking.char') }}"
                           type="button"
                           class="btn btn-outline-theme @if($mode === config('ranking.search-charname')) active disabled @endif">
                            {{ __('ranking.search.charname') }}
                        </a>
                    </div>
                @endif
                @if(config('siteSettings.guild_ranking', true))
                    <div class="btn-group p-2" role="group"
                         aria-label="{{ __('ranking.search.guild') }}">
                        <a href="{{ route('ranking.guild') }}"
                           type="button"
                           class="btn btn-outline-theme @if($mode === config('ranking.search-guild')) active disabled @endif">
                            {{ __('ranking.search.guild') }}
                        </a>
                    </div>
                @endif
                @if(config('siteSettings.job_ranking', true))
                    <div class="btn-group p-2" role="group"
                         aria-label="{{ __('ranking.search.jobname') }}">
                        <a href="{{ route('ranking.job') }}"
                           type="button"
                           class="btn btn-outline-theme @if($mode === config('ranking.search-job')) active disabled @endif">
                            {{ __('ranking.search.jobname') }}
                        </a>
                    </div>
                @endif
                @if(config('siteSettings.trader_ranking', true))
                    <div class="btn-group p-2" role="group"
                         aria-label="{{ __('ranking.search.trader') }}">
                        <a href="{{ route('ranking.job.trader') }}"
                           type="button"
                           class="btn btn-outline-theme @if($mode === config('ranking.search-trader')) active disabled @endif">
                            {{ __('ranking.search.trader') }}
                        </a>
                    </div>
                @endif
                @if(config('siteSettings.hunter_ranking', true))
                    <div class="btn-group p-2" role="group"
                         aria-label="{{ __('ranking.search.hunter') }}">
                        <a href="{{ route('ranking.job.hunter') }}"
                           type="button"
                           class="btn btn-outline-theme @if($mode === config('ranking.search-hunter')) active disabled @endif">
                            {{ __('ranking.search.hunter') }}
                        </a>
                    </div>
                @endif
                @if(config('siteSettings.thief_ranking', true))
                    <div class="btn-group p-2" role="group"
                         aria-label="{{ __('ranking.search.thief') }}">
                        <a href="{{ route('ranking.job.thief') }}"
                           type="button"
                           class="btn btn-outline-theme @if($mode === config('ranking.search-thief')) active disabled @endif">
                            {{ __('ranking.search.thief') }}
                        </a>
                    </div>
                @endif
                @if(config('siteSettings.unique_ranking', true))
                    <div class="btn-group p-2" role="group"
                         aria-label="{{ __('ranking.search.unique') }}">
                        <a href="{{ route('ranking.unique') }}"
                           type="button"
                           class="btn btn-outline-theme @if($mode === config('ranking.search-unique')) active disabled @endif">
                            {{ __('ranking.search.unique') }}
                        </a>
                    </div>
                @endif
                @if(config('siteSettings.free_pvp_ranking', true))
                    <div class="btn-group p-2" role="group"
                         aria-label="{{ __('ranking.search.pvp') }}">
                        <a href="{{ route('ranking.pvp.free') }}"
                           type="button"
                           class="btn btn-outline-theme @if($mode === config('ranking.search-free-pvp')) active disabled @endif">
                            {{ __('ranking.search.pvp') }}
                        </a>
                    </div>
                @endif
                @if(config('siteSettings.job_pvp_ranking', true))
                    <div class="btn-group p-2" role="group"
                         aria-label="{{ __('ranking.search.job') }}">
                        <a href="{{ route('ranking.pvp.job') }}"
                           type="button"
                           class="btn btn-outline-theme @if($mode === config('ranking.search-job-pvp')) active disabled @endif">
                            {{ __('ranking.search.job') }}
                        </a>
                    </div>
                @endif
            </div>
            <div class="result-area">
                {!! $dataTable->table(['class' => 'table table-hover table-borderless table-striped w-100'], true) !!}
            </div>
        </div>
    </div>
@endsection

@push('theme::javascript')
    {!! $dataTable->scripts() !!}
@endpush
