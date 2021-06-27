<template>
    
<div key="app-instasearch" style="text-align:center;">
	
		<div class="input-container" >
			<input type="text" placeholder="Tapez vos mots-clés" v-model="RecipeNamesearch" />
		</div>
		
		<ul class="row col-md-12 bg" style="list-style:none;" >
			
			<li :class="['recipe__item','col-md-6','col-sm-12','hvr-float']"  v-for="recipes in filteredRecipeFeed" v-bind:key="recipes.id" >
<router-link :class="['recipe__inner', recipes.category]" :to="`/recettes/${recipes.id}`"  :style="{backgroundImage:`url(/images/${recipes.image})`}" > 
			

				<p class="recipe__name" :class="['recipe__subi_title', recipes.category+'_titre']">{{recipes.name}}</p>


			</router-link>
                            <p >{{recipes.username}}</p>

			</li>
			
		</ul>
	

	</div>
</template>


<script>
String.prototype.sansAccent = function(){
    var accent = [
        /[\300-\306]/g, /[\340-\346]/g, // A, a
        /[\310-\313]/g, /[\350-\353]/g, // E, e
        /[\314-\317]/g, /[\354-\357]/g, // I, i
        /[\322-\330]/g, /[\362-\370]/g, // O, o
        /[\331-\334]/g, /[\371-\374]/g, // U, u
        /[\321]/g, /[\361]/g, // N, n
        /[\307]/g, /[\347]/g, // C, c
    ];
    var noaccent = ['A','a','E','e','I','i','O','o','U','u','N','n','C','c'];
     
    var str = this;
    for(var i = 0; i < accent.length; i++){
        str = str.replace(accent[i], noaccent[i]);
    }
     
    return str;
}
import axios from 'axios';

export default {
	
		data: function() {
		return {
			RecipeNamesearch: "",
			RecipeFeed: null		};
	  }
	  ,
	
	mounted() {
		axios
			.get('http://localhost/api/search')
			.then(response => {
				this.RecipeFeed = response.data.search;
			})
			.catch(error => console.log(error))
	},
	
	 computed: {
        
        filteredRecipeFeed: function () {
			
            var Recipes = this.RecipeFeed;
            var RecipeNamesearch = this.RecipeNamesearch;

            if(!RecipeNamesearch){
                return Recipes;
            }
		
			            RecipeNamesearch = RecipeNamesearch.trim().toLowerCase();
											RecipeNamesearch = RecipeNamesearch.sansAccent();


            Recipes = Recipes.filter(function(item){
                if(item.name.toLowerCase().sansAccent().indexOf(RecipeNamesearch) !== -1){
                    return item;
                }
				else   if(item.ingredients.toLowerCase().sansAccent().indexOf(RecipeNamesearch) !== -1){
                    return item;
                }
                else if (item.username.toLowerCase().sansAccent().indexOf(RecipeNamesearch) !== -1 ) {
                    return item;
                }
				
            })

            return Recipes;
        }
	 }
	
	 }

</script>