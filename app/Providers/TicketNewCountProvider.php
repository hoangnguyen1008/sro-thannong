<?php

namespace App\Providers;

use App\Tickets\Ticket;
use App\Tickets\TicketStatus;
use Illuminate\Support\ServiceProvider;

class TicketNewCountProvider extends ServiceProvider
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
                $view->with('ticketNewProvider', NULL);
            }
        );
    }
}
