<?php
namespace App\Http\Controllers;
use Illuminate\Http\Request;
use App\RecipeIngredient;
use App\RecipeDirection;
use App\Recipe;
use App\User;
use File;
use DB;
class CategController extends Controller
{
    public function __construct()
    {
    	$this->middleware('auth:api')
    		->except(['index', 'show']);
    }
    public function index()
    {
        $cats =   DB::table('recipes')
        ->select('category','id')
        ->where('valida',1)
        ->groupby ('category')
        ->get();

    	return response()
    		->json([
    			'Categories' => $cats
    		]);
    }



    




}
