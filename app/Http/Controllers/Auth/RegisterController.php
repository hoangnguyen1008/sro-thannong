<?php

namespace App\Http\Controllers\Auth;

use App\Http\Controllers\Controller;
use App\Http\Model\SRO\Account\SkSilk;
use App\Http\Model\SRO\Account\TbUser;
use App\User;
use Carbon\Carbon;
use Illuminate\Foundation\Auth\RegistersUsers;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Validator;

class RegisterController extends Controller
{
    /*
    |--------------------------------------------------------------------------
    | Register Controller
    |--------------------------------------------------------------------------
    |
    | This controller handles the registration of new users as well as their
    | validation and creation. By default this controller uses a trait to
    | provide this functionality without requiring any additional code.
    |
    */

    use RegistersUsers;

    /**
     * Where to redirect users after registration.
     *
     * @var string
     */
    protected $redirectTo = '/account';

    /**
     * Create a new controller instance.
     *
     * @return void
     */
    public function __construct()
    {
        $this->middleware('guest');
    }

    /**
     * Get a validator for an incoming registration request.
     *
     * @param  array  $data
     * @return \Illuminate\Contracts\Validation\Validator
     */
    protected function validator(array $data)
    {
        return Validator::make($data, [
            'silkroad_id' => ['required', 'string', 'alpha_num', 'min:4', 'max:16', 'unique:users'],
            'email' => ['required', 'string', 'email', 'max:255', 'unique:users'],
            'web_password' => ['required', 'string', 'min:6', 'confirmed'],
            'sro_password' => ['required', 'string', 'min:6', 'confirmed'],
            'rules' => ['required'],
        ]);
    }

    /**
     * Create a new user instance after a valid registration.
     *
     * @param  array  $data
     * @return \App\User
     */
    protected function create(array $data)
    {
        $tbUser = TbUser::create([
            'StrUserID' => strtolower($data['silkroad_id']),
            'Name' => strtolower($data['silkroad_id']),
            'password' => md5($data['sro_password']),
            'Status' => 1,
            'GMrank' => 0,
            'Email' => $data['email'],
            'regtime' => Carbon::now()->format('Y-m-d H:i:s'),
            'reg_ip' => \Request::ip(),
            'sec_primary' => 3,
            'sec_content' => 3
        ]);

        SkSilk::create([
            'JID' => $tbUser->JID,
            'silk_own' => 0,
            'silk_gift' => 0,
            'silk_point' => 0
        ]);

        return User::create([
            'name' => strtolower($data['silkroad_id']),
            'silkroad_id' => strtolower($data['silkroad_id']),
            'jid' => $tbUser->JID,
            'email' => $data['email'],
            'password' => Hash::make($data['web_password']),
            'referrer_id' => null,
            'reflink' => \Str::uuid(),
            'show_map' => 0
        ]);
    }
}
