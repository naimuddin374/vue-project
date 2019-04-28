<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class UserModel extends Model
{
	public $timestamps = false;
	protected $table = 'users';
	protected $fillable = [
		'name', 'contact_no', 'email', 'address', 'image'
	];
}