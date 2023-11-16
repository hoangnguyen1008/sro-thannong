<?php

namespace App\Http\Controllers\Backend;

use App\HideRanking;
use App\Http\Controllers\Controller;
use Illuminate\Contracts\View\Factory;
use Illuminate\Http\RedirectResponse;
use Illuminate\Http\Request;
use Illuminate\View\View;
use Validator;

class HideRankingController extends Controller
{
    /**
     * @return Factory|View
     */
    public function index()
    {
        $hidePlayers = HideRanking::all();
        return view('theme::backend.hideranking.char', [
            'hidden' => $hidePlayers
        ]);
    }

    /**
     * @param Request $request
     * @return RedirectResponse
     */
    public function add(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'charname' => 'required|max:100',
        ]);

        if ($validator->fails()) {
            return back()
                ->withErrors($validator)
                ->withInput();
        }

        HideRanking::create($request->all());

        return back()->with('success', __('backend/notification.form-submit.success'));
    }

    /**
     * @param Request $request
     * @param $id
     * @return RedirectResponse
     */
    public function destroy(Request $request, $id)
    {
        HideRanking::findOrFail($id)->delete();

        return back()->with('success', __('backend/notification.form-submit.success'));
    }
}
