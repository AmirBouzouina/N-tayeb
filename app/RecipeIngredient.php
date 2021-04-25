<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class RecipeIngredient extends Model
{
    protected $fillable = [
    	'ingredient_name', 'qty','unit'
    ];

    public $timestamps = false;

    public static function form()
    {
    	return [
    		'ingredient_name' => '',
    		'qty' => '',
            'unit' => ''
    	];
    }
}