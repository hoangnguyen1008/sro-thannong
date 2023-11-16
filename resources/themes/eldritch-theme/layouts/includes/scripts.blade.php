<script>
    const serverTime = new Date({{ \Carbon\Carbon::now()->format('Y, n, j, G, i, s') }});
    const currentTimestamp = {{ \Carbon\Carbon::now()->format('U') }} -Math.round(+new Date() / 1000);
</script>
<script src="{{ mix('/js/app.js') }}"></script>

<!-- Datatables -->
<script src="{{ asset('plugins/datatables/js/dataTables.js') }}"></script>
<!-- toastr -->
<script src="{{ asset('plugins/toastr/js/toastr.min.js') }}"></script>
<!-- select2 -->
<script src="{{ asset('plugins/select2/js/select2.full.min.js') }}"></script>
<!-- custom -->
<script src="{{ asset('js/custom.js') }}"></script>

<!-- main -->
<script src="{{ asset('themes/eldritch-theme/js/main.js') }}"></script>

@stack('theme::javascript')
