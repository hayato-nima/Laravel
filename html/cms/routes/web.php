<?php

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

use App\Book;
use Illuminate\Http\Request;

/**
* 本の一覧表示(books.blade.php)
*/
Route::get('/', function () {
    return view('welcome');
});

/**
* 本を追加 
*/
Route::post('/books', function (Request $request) {
    //
});

/**
* 本を削除 
*/
Route::delete('/book/{book}', function (Book $book) {
    //
});


Auth::routes();

Route::get('/home', 'HomeController@index')->name('home');

