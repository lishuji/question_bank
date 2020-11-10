<?php
/**
 * Created by PhpStorm.
 * User: kankan
 * Date: 2020-11-09
 * Time: 19:45
 */

namespace App\Http\Controllers;


use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class ManagerController extends Controller
{
    /**
     * 后台登录
     *
     * @param Request $request
     *
     * @return int
     * @throws \Illuminate\Validation\ValidationException
     */
    public function login(Request $request)
    {
        $credentials = $this->validate($request, [
            'email'    => 'required|email|max:255',
            'password' => 'required'
        ]);

        print_r(Auth::guard('admin'));exit();

        //验证登录
        if (Auth::guard('admin')->attempt($credentials)) {

            return 0;

        } else {

            return 1;
        }
    }


    public function logout()
    {

    }

}