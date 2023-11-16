<?php

namespace App\Http\Controllers\Frontend;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Cache;

class DiscordController extends Controller
{
    /**
     * Discord Server ID
     * @var null
     */
    private $discordServerId;

    /**
     * DiscordController constructor.
     */
    public function __construct()
    {
        $this->setDiscordServerId(config('siteSettings.discord_id', '956177818637697084'));
    }

    /**
     * Fetching the Discord Server
     * @return mixed|null
     */
    public function fetch()
    {
        $seconds = 60 * 60; // 1 hour

        if($this->getDiscordServerId()) {
            $discordFetch = Cache::remember('discordFetch', $seconds, function () {
                $response = @file_get_contents(
                    'https://discordapp.com/api/guilds/' .
                    $this->getDiscordServerId() .
                    '/widget.json'
                );
                if($response === FALSE){
                	// Widget not activated
                	// or Channel not found
                	return null;
                }
                return json_decode($response, true);
            });
        } else {
            $discordFetch = null;
        }

        return $discordFetch;
    }

    /**
     * @return null
     */
    public function getDiscordServerId()
    {
        return $this->discordServerId;
    }

    /**
     * @param null $discordServerId
     */
    public function setDiscordServerId($discordServerId): void
    {
        $this->discordServerId = $discordServerId;
    }
}
