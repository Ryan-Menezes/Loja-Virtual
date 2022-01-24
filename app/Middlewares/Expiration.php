<?php
namespace App\Middlewares;

use App\Models\{
    Coupon,
    ProductDiscount,
    Notice
};
use Illuminate\Database\Capsule\Manager as DB;

class Expiration{
	public function redirectTo(){
        Coupon::whereNotNull('expiration')->where('expiration', '<=', DB::raw('CURRENT_DATE'))->delete();
        ProductDiscount::whereNotNull('expiration')->where('expiration', '<=', DB::raw('CURRENT_DATE'))->delete();
        Notice::whereNotNull('expiration')->where('expiration', '<=', DB::raw('CURRENT_DATE'))->update([
            'expiration'    => null,
            'visible'       => false
        ]);
	}
}