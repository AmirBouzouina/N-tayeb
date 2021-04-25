<?php
namespace App\Http\Controllers;
use Illuminate\Http\Request;
use App\RecipeIngredient;
use App\RecipeDirection;
use App\Recipe;
use App\User;
use File;
use DB;

class SearchController extends Controller
{
    public function __construct()
    {
    	$this->middleware('auth:api')
    		->except(['index', 'show']);
    }
    public function index()
    {
    	$search =  DB::table('recipes')
        ->Join('recipe_ingredients','recipe_ingredients.recipe_id','=','recipes.id')
        ->select('recipes.id','recipes.name','recipes.image','recipes.category',DB::raw('group_concat(recipe_ingredients.ingredient_name) AS ingredients'))
        ->groupBy('recipes.id')
        ->get();
        	return response()
    		->json([
    			'search' => $search
    		]);
    }


}
