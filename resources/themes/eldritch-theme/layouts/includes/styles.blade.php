<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Marcellus%3A100%2C100italic%2C200%2C200italic%2C300%2C300italic%2C400%2C400italic%2C500%2C500italic%2C600%2C600italic%2C700%2C700italic%2C800%2C800italic%2C900%2C900italic%7COpen+Sans%3A100%2C100italic%2C200%2C200italic%2C300%2C300italic%2C400%2C400italic%2C500%2C500italic%2C600%2C600italic%2C700%2C700italic%2C800%2C800italic%2C900%2C900italic&amp;subset=latin%2Clatin-ext&amp;ver=1.0.0" type="text/css" media="all">
<!-- Styles -->
<link href="{{(Session::get('locale') === 'ar') ? mix('/css/app-rtl.css') : mix('/css/app.css')}}" rel="stylesheet">

<!-- Datatables -->
<link href="{{ mix('/plugins/datatables/css/dataTables.css') }}" rel="stylesheet">

<!-- toastr -->
<link href="{{ asset('plugins/toastr/css/toastr.css') }}" rel="stylesheet">

<!-- select2 -->
<link href="{{ asset('plugins/select2/css/select2.min.css') }}" rel="stylesheet">

<!-- main -->
<link href="{{ asset('themes/eldritch-theme/css/main.css') }}" rel="stylesheet">

@stack('theme::css')
