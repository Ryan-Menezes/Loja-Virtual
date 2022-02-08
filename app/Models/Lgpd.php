<?php
namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Lgpd extends Model{
	public $table = 'lgpd';
	protected $fillable = ['url', 'method', 'ip', 'browser', 'device', 'so', 'referer', 'server'];
	public $timestamps = true;
}