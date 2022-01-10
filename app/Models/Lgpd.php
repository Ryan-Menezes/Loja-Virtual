<?php
namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Lgpd extends Model{
	public $table = 'lgpd';
	protected $fillable = ['url', 'ip',	'browser', 'device', 'so', 'server'];
	public $timestamps = true;
}