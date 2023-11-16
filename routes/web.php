<?php

use App\Helpers\Images;

Auth::routes();

/**
 * Images
 */

//get Images
Route::get('images/normal/{image?}', function ($image = null) {
    return Images::GetImage($image);
})->name('images.image')->where(['image' => '(.*)']);

//get fort Images
Route::get('images/fortress/{image?}', function ($image = null) {
    return Images::GetFortImage($image);
})->name('images.fortress')->where(['image' => '(.*)']);

//get Characters Images
Route::get('images/characters/{image?}', function ($image = null) {
    return Images::GetCharacterImage($image);
})->name('images.characters')->where(['image' => '(.*)']);


//get items Images
Route::get('images/items/{image?}', function ($image = null) {
    return Images::GetItemImage($image);
})->name('images.items')->where(['image' => '(.*)']);


/****************************************************************/
//index
Route::get('/', 'Frontend\IndexController@index')->name('index');

// Signature
Route::get('/signature/{ref?}', 'Frontend\IndexController@signatureRef')->name('signature-index');

// Language setter
Route::get('/lang/{lang}', 'Frontend\IndexController@lang')->name('change-language');

// News
Route::get('/news/{slug}', 'Frontend\NewsController@index')->name('news-slug');
Route::get('/news-archive', 'Frontend\NewsController@archive')->name('news-archive');

// Other
Route::get('/downloads', 'Frontend\IndexController@downloads')->name('downloads-index');
Route::get('/rules', 'Frontend\IndexController@rules')->name('rules-index');

// Ranking
Route::group([
    'prefix' => 'ranking',
    'as' => 'ranking.'
], static function () {
    Route::get('/charname', [
        'as' => 'char',
        'uses' => 'Frontend\RankingController@charname',
    ]);

    Route::get('/guild', [
        'as' => 'guild',
        'uses' => 'Frontend\RankingController@guild',
    ]);

    Route::get('/job', [
        'as' => 'job',
        'uses' => 'Frontend\RankingController@job',
    ]);


    Route::get('/job/trader', [
        'as' => 'job.trader',
        'uses' => 'Frontend\RankingController@trader',
    ]);

    Route::get('/job/hunter', [
        'as' => 'job.hunter',
        'uses' => 'Frontend\RankingController@hunter',
    ]);

    Route::get('/job/thief', [
        'as' => 'job.thief',
        'uses' => 'Frontend\RankingController@thief',
    ]);

    Route::get('/unique', [
        'as' => 'unique',
        'uses' => 'Frontend\RankingController@unique',
    ]);
    Route::get('/pvp/free', [
        'as' => 'pvp.free',
        'uses' => 'Frontend\RankingController@FreePvp',
    ]);
    Route::get('/pvp/job', [
        'as' => 'pvp.job',
        'uses' => 'Frontend\RankingController@JobPvp',
    ]);
    Route::get('/pvp/free', [
        'as' => 'pvp.free',
        'uses' => 'Frontend\RankingController@FreePvp',
    ]);
    Route::get('/pvp/job', [
        'as' => 'pvp.job',
        'uses' => 'Frontend\RankingController@JobPvp',
    ]);
});

// Server Information
Route::get('/server-information', 'Frontend\IndexController@serverInformation')->name('server-information');

// Pages
Route::get('/pages/{slug}', 'Frontend\IndexController@pagesContent')->name('pages-content');

// Needed to be logged in after that
Auth::routes(['verify' => true]);


// User Dashboard
Route::group(['prefix' => 'account', 'middleware' => ['auth']], static function () {
    Route::get('/', 'Frontend\AccountController@index')->name('home');
    Route::get('/chars', 'Frontend\AccountController@charList')->name('home-chars-list');
    Route::get('/settings', 'Frontend\AccountController@settings')->name('home-settings');
    Route::post('/settings/update', 'Frontend\AccountController@settingsUpdate')->name('home-settings-update');


    Route::group(['prefix' => 'donations'], static function () {
        Route::get('/', 'Frontend\DonationsController@index')->name('donations-index');
        Route::get('/method/{method?}', 'Frontend\DonationsController@showMethod')->name('donations-method-index');

        Route::group(['prefix' => 'paypal'], static function () {
            Route::get('/buy/{id}', 'Frontend\DonationsPaypalController@buy')->where('id', '[0-9]+')->name('donate-paypal');
            Route::get('/complete', 'Frontend\DonationsPaypalController@complete')->name('donate-paypal-complete');
            Route::get('/invoice-closed', 'Frontend\DonationsPaypalController@invoiceClosed')->name('donate-paypal-invoice-closed');
            Route::get('/success', 'Frontend\DonationsPaypalController@success')->name('donate-paypal-success');
            Route::get('/notify', 'Frontend\DonationsPaypalController@notify')->name('donate-paypal-notify');
            Route::get('/error/{id}', 'Frontend\DonationsPaypalController@error')->name('donate-paypal-error');
        });

        Route::group(['prefix' => 'maxicard'], static function () {
            Route::get('/buy', 'Frontend\DonationsMaxiCardController@buy')->name('donate-maxicard-buy');
            Route::post('/buy', 'Frontend\DonationsMaxiCardController@store')->name('donate-maxicard-buy-post');
        });

        Route::group(['prefix' => 'stripe'], static function () {
            Route::get('/buy/{id}', 'Frontend\DonationsStripeController@buy')->where('id', '[0-9]+')->name('donate-stripe');
            Route::post('/buy/{id}', 'Frontend\DonationsStripeController@buyPost')->where('id', '[0-9]+')->name('donate-stripe-post');
            Route::post('/confirm', 'Frontend\DonationsStripeController@confirm')->name('donate-stripe-confirm');
            Route::get('/success', 'Frontend\DonationsStripeController@success')->name('donate-stripe-success');
            Route::get('/error', 'Frontend\DonationsStripeController@error')->name('donate-stripe-error');
        });
    });
});

// Character and Guild Information
Route::get('/player/{CharName16}', 'Frontend\InformationController@player')->name('information-player');
Route::get('/guild/{name}', 'Frontend\InformationController@guild')->name('information-guild');

// Auctions House
Auth::routes(['verify' => true]);

// Backend Routes
Route::group(['prefix' => 'backend', 'middleware' => ['role:administrator']], static function () {
    Route::get('/', 'Backend\BackendController@index')->name('index-backend');

    // SoX count filter
    Route::get('/soxcount/{filter?}', 'Backend\BackendController@soxCountFilter')->name('sox-count-filter-backend');
    Route::get('/show/sox/{filter?}', 'Backend\BackendController@showSoxCount')->name('sox-count-filter-show-backend');

    // SilkroadTodo
    Route::post('/todo/add', 'Backend\BackendController@todoAdd')->name('todo-add-backend');
    Route::post('/todo/{id}/delete', 'Backend\BackendController@todoDelete')->name('todo-delete-backend');

    // Server Information
    Route::group(['prefix' => 'server-information'], static function () {
        Route::get('/', 'Backend\ServerInformationController@index')->name('server-information-index-backend');
        Route::get('/create', 'Backend\ServerInformationController@showAdd')->name('server-information-show-add-backend');
        Route::post('/add', 'Backend\ServerInformationController@add')->name('server-information-add-backend');
        Route::get('/edit/{id}', 'Backend\ServerInformationController@showEdit')->name('server-information-edit-show-backend');
        Route::post('/update/{id}', 'Backend\ServerInformationController@update')->name('server-information-update-backend');
        Route::delete('/destroy/{id}', 'Backend\ServerInformationController@destroy')->name('server-information-destroy-backend');
    });

    // Pages
    Route::resource('pages', 'Backend\PagesController', [
        'except' => [
            'show',
        ]
    ]);
    Route::post('/pages/create/type', 'Backend\PagesController@createType')->name('pages-create-type-backend');
    Route::get('/pages/type/toggle', 'Backend\PagesController@toggleType')->name('pages-toggle-type-backend');


    // Server Rules
    Route::group(['prefix' => 'rules'], static function () {
        Route::get('/', 'Backend\RulesController@index')->name('server-rules-index-backend');
        Route::get('/create', 'Backend\RulesController@showAdd')->name('server-rules-show-add-backend');
        Route::post('/add', 'Backend\RulesController@add')->name('server-rules-add-backend');
        Route::get('/edit/{id}', 'Backend\RulesController@showEdit')->name('server-rules-edit-show-backend');
        Route::post('/update/{id}', 'Backend\RulesController@update')->name('server-rules-update-backend');
    });

    // Vote for Silk
    Route::group(['prefix' => 'vote-for-silk'], static function () {
        Route::get('/', 'Backend\VoteforsilkController@index')->name('vote-for-silk-index-backend');
        Route::get('/edit/{id}', 'Backend\VoteforsilkController@editVote')->name('vote-edit-backend');
        Route::post('/edit/{id}', 'Backend\VoteforsilkController@editVoteSubmit')->name('vote-edit-submit-backend');
        Route::post('/toggle-vote/{id}', 'Backend\VoteforsilkController@toggleVote')->name('vote-toggle-backend');
    });

    // Ticket
    Route::group(['prefix' => 'ticket'], static function () {
        Route::get('/{conversation?}', 'Backend\TicketController@list')->name('ticket-index-list')->where(['conversation' => '[0-9]+']);
        Route::get('/fetch', 'Backend\TicketController@fetch')->name('ticket-fetch-backend');
        Route::post('/send', 'Backend\TicketController@send')->name('ticket-send-backend');
        Route::get('/conversations', 'Backend\TicketController@fetchConversations')->name('ticket-conversations-backend');
        Route::get('/settings', 'Backend\TicketController@settings')->name('ticket-settings-backend');
        Route::post('/close', 'Backend\TicketController@close')->name('ticket-close-backend');
        Route::group(['prefix' => 'category'], static function () {
            Route::match(['get', 'post'], '/create', 'Backend\TicketController@categoryCreate')->name('ticket-category-create');
            Route::match(['get', 'post'], '/{id}', 'Backend\TicketController@categoryUpdate')->name('ticket-category-update');
            Route::post('/delete/{id}', 'Backend\TicketController@categoryDelete')->name('ticket-category-delete');
        });
        Route::group(['prefix' => 'priority'], static function () {
            Route::match(['get', 'post'], '/create', 'Backend\TicketController@priorityCreate')->name('ticket-priority-create');
            Route::match(['get', 'post'], '/{id}', 'Backend\TicketController@priorityUpdate')->name('ticket-priority-update');
            Route::post('/delete/{id}', 'Backend\TicketController@priorityDelete')->name('ticket-priority-delete');
        });
    });

    // Silkroad
    Route::group(['prefix' => 'silkroad'], static function () {
        Route::group(['prefix' => 'notice'], static function () {
            Route::get('/', 'Backend\SilkroadNoticeController@noticeIndex')->name('sro-notice-index-backend');
            Route::get('/create', 'Backend\SilkroadNoticeController@noticeCreate')->name('sro-notice-create-backend');
            Route::post('/save', 'Backend\SilkroadNoticeController@noticeSave')->name('sro-notice-save-backend');
            Route::get('/{id}/edit', 'Backend\SilkroadNoticeController@noticeEdit')->name('sro-notice-edit-backend');
            Route::post('/{id}/update', 'Backend\SilkroadNoticeController@noticeEditPatch')->name('sro-notice-patch-backend');
            Route::delete('/{id}/destroy', 'Backend\SilkroadNoticeController@noticeDestroy')->name('sro-notice-edit-destroy');
        });

        Route::get('/user', 'Backend\SilkroadController@indexSroUser')->name('sro-user-index-user-backend');
        Route::get('/user-datatables', 'Backend\SilkroadController@sroUserDatatables')->name('sro-user-datatables-backend');
        Route::get('/user/{user}/edit', 'Backend\SilkroadController@sroUserEdit')->name('sro-user-edit-backend');
        Route::match(['put', 'patch'], '/user/{user}/role', 'Backend\SilkroadController@syncRoles')->name('sro-user-role-sync-backend');

        Route::get('/players', 'Backend\SilkroadController@indexSroPlayer')->name('sro-players-index-backend');
        Route::get('/players-datatables', 'Backend\SilkroadController@SroPlayerDatatables')->name('sro-players-datatables-backend');
        Route::get('/players/{char}/edit', 'Backend\SilkroadController@sroPlayerEdit')->name('sro-players-edit-backend');

        Route::get('/guilds', 'Backend\SilkroadGuildController@indexSroGuild')->name('sro-guild-index-backend');
        Route::get('/guilds-datatables', 'Backend\SilkroadGuildController@sroGuildDatatables')->name('sro-guild-datatables-backend');
        Route::get('/guilds/{guild}/edit', 'Backend\SilkroadGuildController@sroGuildEdit')->name('sro-guild-edit-backend');
        Route::get('/guilds/{guild}/edit-datatables', 'Backend\SilkroadGuildController@sroGuildEditDatatables')->name('sro-guild-edit-datatables-backend');

        // Patching TB_User
        Route::post('/user/{user}/silk/add', 'Backend\SilkroadController@sroUserSilkAddRemove')->name('sro-user-silk-backend');
        Route::post('/user/{user}/block/add', 'Backend\SilkroadController@sroUserBlockAdd')->name('sro-user-block-add-backend');
        Route::post('/user/{user}/block/destroy', 'Backend\SilkroadController@sroUserBlockDestory')->name('sro-user-block-destroy-backend');

        // Patching _Char
        Route::post('/players/{char}/unstuck', 'Backend\SilkroadController@sroUnstuckChar')->name('sro-players-unstuck');

        // Hide Ranking Char
        Route::get('/hideranking-char', 'Backend\HideRankingController@index')->name('hide-ranking-index-backend');
        Route::post('/hideranking-char/add', 'Backend\HideRankingController@add')->name('hide-ranking-add-backend');
        Route::post('/hideranking-char/{id}/destroy', 'Backend\HideRankingController@destroy')->name('hide-ranking-destroy-backend');

        // Hide Ranking Guild
        Route::get('/hideranking-guild', 'Backend\HideRankingGuildController@index')->name('hide-ranking-guild-index-backend');
        Route::post('/hideranking-guild/add', 'Backend\HideRankingGuildController@add')->name('hide-ranking-guild-add-backend');
        Route::post('/hideranking-guild/{id}/destroy', 'Backend\HideRankingGuildController@destroy')->name('hide-ranking-guild-destroy-backend');
    });

    // Web
    Route::group(['prefix' => 'web'], static function () {
        Route::get('/settings', 'Backend\SiteSettingsController@index')->name('site-settings-backend');
        Route::post('/settings/update', 'Backend\SiteSettingsController@update')->name('site-settings-update-backend');

        Route::get('/auctionshouse', 'Backend\AuctionsHouseController@index')->name('auctionshouse-settings-backend');
        Route::post('/auctionshouse/update', 'Backend\AuctionsHouseController@update')->name('auctionshouse-settings-update-backend');
        Route::get('/auctionshouse/log', 'Backend\AuctionsHouseController@showLog')->name('auctionshouse-log-backend');
        Route::get('/auctionshouse/log/datatables', 'Backend\AuctionsHouseController@showLogDatatables')->name('auctionshouse-log-datatables-backend');

        Route::group(['prefix' => 'downloads'], static function () {
            Route::get('/', 'Backend\DownloadsController@index')->name('downloads-index-backend');
            Route::get('/add', 'Backend\DownloadsController@show')->name('downloads-add-backend');
            Route::post('/create', 'Backend\DownloadsController@create')->name('downloads-create-backend');
            Route::get('/{download}/edit', 'Backend\DownloadsController@edit')->name('downloads-edit-backend');
            Route::patch('/{download}/update', 'Backend\DownloadsController@update')->name('downloads-update-backend');
            Route::post('/{download}/destroy', 'Backend\DownloadsController@destroy')->name('downloads-destroy-backend');
        });
        Route::group(['prefix' => 'images'], static function () {
            Route::get('/', 'Backend\ImagesController@index')->name('images-index-backend');
            Route::get('/add', 'Backend\ImagesController@show')->name('images-show-backend');
            Route::post('/create', 'Backend\ImagesController@create')->name('images-create-backend');
            Route::post('/{image}/destroy', 'Backend\ImagesController@destroy')->name('images-destroy-backend');
        });

        Route::resource('/news', 'Backend\NewsController', [
            'as' => 'backend-news'
        ]);

        Route::group(['prefix' => 'voucher'], static function () {
            Route::get('/', 'Backend\VoucherController@index')->name('voucher-index-backend');
            Route::get('/datatables', 'Backend\VoucherController@indexDatatables')->name('voucher-index-datatables-backend');
            Route::get('/add', 'Backend\VoucherController@addForm')->name('voucher-add-backend');
            Route::post('/create', 'Backend\VoucherController@create')->name('voucher-create-backend');
            Route::post('/{id}/destroy', 'Backend\VoucherController@destroy')->name('voucher-destroy-backend');
        });

        Route::group(['prefix' => 'backlinks'], static function () {
            Route::get('/', 'Backend\BacklinksController@index')->name('backlinks-index-backend');
            Route::get('/add', 'Backend\BacklinksController@show')->name('backlinks-add-backend');
            Route::post('/create', 'Backend\BacklinksController@create')->name('backlinks-create-backend');
            Route::get('/{backlink}/edit', 'Backend\BacklinksController@edit')->name('backlinks-edit-backend');
            Route::patch('/{backlink}/update', 'Backend\BacklinksController@update')->name('backlinks-update-backend');
            Route::post('/{backlink}/destroy', 'Backend\BacklinksController@destroy')->name('backlinks-destroy-backend');
        });

        Route::group(['prefix' => 'supporters-online'], static function () {
            Route::get('/', 'Backend\SupportersOnlineController@index')->name('supporters-online-index-backend');
            Route::post('/add', 'Backend\SupportersOnlineController@add')->name('supporters-online-add-backend');
            Route::post('/{id}/destroy', 'Backend\SupportersOnlineController@destroy')->name('supporters-online-destroy-backend');
        });

        Route::group(['prefix' => 'donations'], static function () {
            Route::get('/', 'Backend\DonationsController@index')->name('donations-index-backend');
            Route::post('/methods/update', 'Backend\DonationsController@updateMethods')->name('donations-update-methods-backend');

            Route::group(['prefix' => 'method'], static function () {
                Route::get('/paypal', 'Backend\DonationsController@methodPaypal')->name('method-paypal-backend');
                Route::post('/paypal/add', 'Backend\DonationsController@methodPaypalAdding')->name('method-paypal-add-backend');
                Route::post('/paypal/{id}/destroy', 'Backend\DonationsController@methodPaypalDestroy')->name('method-paypal-destroy-backend');
                Route::get('/paypal-logging-datatables', 'Backend\DonationsController@loggingPaypalDatatables')->name('donations-logging-paypal-datatables-backend');

                Route::get('/maxicard', 'Backend\DonationsController@methodMaxicard')->name('method-maxicard-backend');
                Route::post('/maxicard/add', 'Backend\DonationsController@methodMaxicardAdding')->name('method-maxicard-add-backend');
                Route::put('/maxicard/edit/{id}', 'Backend\DonationsController@methodMaxicardEdit')->name('method-maxicard-edit-backend');
                Route::delete('/maxicard/delete/{id}', 'Backend\DonationsController@methodMaxicardDestroy')->name('method-maxicard-destroy-backend');
                Route::get('/maxicard-logging-datatables', 'Backend\DonationsController@loggingMaxicardDatatables')->name('donations-logging-maxicard-datatables-backend');
                Route::get('/maxicard/data/get/{id}', 'Backend\DonationsController@getMaxicardData')->name('maxicard-data-get-backend');

                Route::get('/stripe', 'Backend\DonationsController@methodStripe')->name('method-stripe-backend');
                Route::post('/stripe/add', 'Backend\DonationsController@methodStripeAdding')->name('method-stripe-add-backend');
                Route::post('/stripe/{id}/destroy', 'Backend\DonationsController@methodStripeDestroy')->name('method-stripe-destroy-backend');
                Route::get('/stripe-logging-datatables', 'Backend\DonationsController@loggingStripeDatatables')->name('donations-logging-stripe-datatables-backend');
            });
        });
    });

    // Logging
    Route::get('/smc-log', 'Backend\BackendController@smclogIndex')->name('smclog-index-backend');
    Route::get('/smc-log-datatables', 'Backend\BackendController@smclogDatatables')->name('smclog-datatables-backend');

    Route::get('/users-created-counts', 'Backend\UsersCreatedCounts@index')->name('users-created-counts-backend');

    Route::get('/users-blocked', 'Backend\BackendController@blockedAccountsIndex')->name('users-blocked-backend');
    Route::get('/users-blocked-datatables', 'Backend\BackendController@blockedAccountsDatatables')->name('users-blocked-datatables-backend');

    Route::get('/worldmap', 'Backend\BackendController@worldmapIndex')->name('worldmap-index-backend');

    //item mall
    Route::resource('/web-mall', 'Backend\WebMall\WebMallController', [
        'only' => [
            'index',
            'store',
            'destroy'
        ]
    ]);
    Route::get('/web-mall/logs', 'Backend\WebMall\WebMallController@getLogs')->name('web-mall.logs');

});
