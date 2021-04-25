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
			</li>
			
		</ul>
	

	</div>
</template>


<script>
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

            Recipes = Recipes.filter(function(item){
                if(item.name.toLowerCase().indexOf(RecipeNamesearch) !== -1){
                    return item;
                }
				else   if(item.ingredients.toLowerCase().indexOf(RecipeNamesearch) !== -1){
                    return item;
                }
				
            })

            return Recipes;
        }
	 }
	
	 }

</script>