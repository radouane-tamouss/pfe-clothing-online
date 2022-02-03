<?php

use Illuminate\Support\Facades\Route;

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

Route::get('/', function () {
    return view('welcome');
});


Route::get('products', ["uses"=>"ProductsController@index", 'as'=>'allProducts']);
Route::get('product/addToCart/{id}', ['uses'=>'ProductsController@addProductToCart', 'as'=>'AddToCartProduct']);
//shhow cart items
Route::get('cart', ["uses"=>"ProductsController@showCart", 'as'=>'cartproducts']);
//delete product from cart
Route::get('product/deleteItemFromCart/{id}', ['uses'=>'ProductsController@deleteItemFromCart', 'as'=>'DeleteItemFromCart']);


Auth::routes();

Route::get('/home', [App\Http\Controllers\HomeController::class, 'index'])->name('home');
