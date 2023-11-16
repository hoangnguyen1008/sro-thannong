<?php

namespace App\Providers;

use App\Model\Frontend\AuctionItem;
use App\Model\Frontend\CharGold;
use App\User;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\ServiceProvider;

class SilkGoldProvider extends ServiceProvider
{
    /**
     * Register services.
     *
     * @return void
     */
    public function register()
    {
        //
    }

    /**
     * Bootstrap services.
     *
     * @return void
     */
    public function boot()
    {
        view()->composer(
            'theme::*',
            static function ($view) {
                $data = [
                    'silk' => 0,
                    'silk_gift' => 0,
                    'web_inventory_gold' => 0
                ];
                if (Auth::id()) {
                    $charGold = CharGold::where('user_id', Auth::id())->sum('gold');

                    $silk = User::where('id', Auth::id())
                        ->with('getSkSilk')
                        ->firstOrFail();
                    $data = [
                        'silk' => $silk->getSkSilk->silk_own,
                        'silk_gift' => $silk->getSkSilk->silk_gift,
                        'web_inventory_gold' => $charGold
                    ];
                }
                $view->with('SilkGoldProvider', $data);
            }
        );

        view()->composer(
            'theme::*',
            static function ($view) {
                $data = [];
                $view->with('GoldProvider', $data);
            }
        );
    }
}
