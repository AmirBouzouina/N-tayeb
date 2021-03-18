<?php
namespace App\Http\Controllers;
use Illuminate\Http\Request;
use App\RecipeIngredient;
use App\RecipeDirection;
use App\Recipe;
use App\User;
use App\Category;

use File;
use DB;
class CategController extends Controller
{
 
    public function index()
    {
        $cats =  DB::table('recipes')
        ->select('category',DB::raw('GROUP_CONCAT(id) AS ids'))
        ->groupBy('category')
        ->get();
        	return response()
    		->json([
    			'Categories' => $cats
    		]);
    }
    public function show($name)
    {
        $category =  DB::table('recipes')
        ->select('id', 'name','image','category')
        ->where('category',$name) 


                ->get();
        	return response()
    		->json([
    			'category' => $category]);
                   
 
    }





}
