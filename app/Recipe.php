<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Recipe extends Model
{
    protected $fillable = [
        'name', 'description', 'image' ,'category','cuisine', 'prep','cook','difficulty','yield','valida'
    ];

    public function user()
    {
    	return $this->belongsTo(User::class);
    }

    public function ingredients()
    {
            return $this->hasMany(RecipeIngredient::class);
    }

    public function directions()
    {
    	return $this->hasMany(RecipeDirection::class);
    }

    public static function form()
    {
        return [
            'name' => '',
            'valida'=>'0',
            'image' => '',
            'description' => '',
            'category' => '',
             'cuisine' => '',
            'prep' => '',
            'cook' => '',
            'difficulty' => '',
            'yield' => '',
            'ingredients' => [
                RecipeIngredient::form()
            ],
            'directions' => [
                RecipeDirection::form(),
                RecipeDirection::form()
            ]
        ];
    }

    public function slug()
    {
        return str_slug($this->category, '-');
    }
}
