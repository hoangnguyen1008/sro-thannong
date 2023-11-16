<div class="card">
    <div class="card-header">
        <h5>
            {{ __('sidebar.job-ranking.title') }}
        </h5>
    </div>
    <div class="card-body">
        <div class="progress">
            @forelse($JobRankingProvider as $jobRanking)
                <div class="progress-bar bg-{{ Str::lower($jobRanking['JobName']) }}" role="progressbar"
                     style="width: {{ number_format((($jobRanking['JobCount'] / $JobRankingProvider->sum('JobCount')) * 100), 2) }}%"
                     aria-valuenow="{{ number_format((($jobRanking['JobCount'] / $JobRankingProvider->sum('JobCount')) * 100), 0) }}"
                     aria-valuemin="0"
                     aria-valuemax="100">
                    {{ $jobRanking['JobName'] }}
                </div>
            @empty
                {{ __('sidebar.job-ranking.no-created') }}
            @endforelse
        </div>
    </div>
</div>
