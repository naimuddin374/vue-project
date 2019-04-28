<?php
Route::get('/', function () {
	return view('welcome');
});

Route::get('users', 'UserController@index');
Route::post('storeuser', 'UserController@insert');
Route::get('editeuser/{id}', 'UserController@edit');
Route::get('deleteuser/{id}', 'UserController@delete');
Route::post('usersearch', 'UserController@search');