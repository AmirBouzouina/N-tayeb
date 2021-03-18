<template>
    <div class="container px-0 mx-0">

	<div class="row container-fluid" style="width: 70vw;margin: auto;">
	



	<div class="row" > 
		<div class="recipe__item col-md-5 col-sm-12 col-lg-4 hvr-float"  v-for="recipe in recipes" v-bind:key="recipe.id"  >
    
			<router-link class="recipe__inner" :to="`/recettes/${recipe.id}`"  :style="{backgroundImage:`url(/images/${recipe.image})`}" >
			

				<p class="recipe__name" :class="['recipe__subi_title', recipe.slug+'_titre']">{{recipe.name}}</p>
			
			</router-link>
		</div>
	</div>

		</div>


	</div>

</template>




<script type="text/javascript">
	import { get } from '../../helpers/api'
	export default {
		data() {
			return {
				recipes: []

			};

		},
		created() {
			get('/api/recettes')
				.then((res) => {
					this.recipes = res.data.recipes;
					} );
			get('/api/categories')
				.then((res) => {
					this.categories = res.data.categories;
					} );					




		}
	};


</script>
