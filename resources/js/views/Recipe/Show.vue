<template>
	<div class="recipe__show wow bounceInUp" >
        <h1  :class="['recipe__title', recipe.slug]">{{recipe.name}}</h1>
        <div class="row ">
                       <div class="col-4"><small>Recette ajoutée par :</small>{{recipe.user.name}}
            </div>
            <div class="col-6">Catégorie:</div>
            <div class="col-4">{{recipe.category}}</div>
            <div class="col-6">Cuisine:</div>
            <div class="col-4">{{recipe.cuisine}} </div>
        </div>
        <div class="row mr-0 ml-0">
            <div class="col-md-8 col-sm-12 col-xs-12 recipe__box">
                <div class="wow">
                   <img :src="`/images/${recipe.image}`" v-if="recipe.image">
                </div>
            </div>
            <div class="col-md-4 col-sm-12 col-xs-12 recipe-ingredients recipe__box" id="ings">
                <h3  :class="['recipe__sub_title', recipe.slug]" >Ingrédients</h3><span :class="['recipe__yielding', recipe.slug]" > Pour: {{recipe.yield}} Personnes</span>
                    <dl class="ingredients-list mt-9">
                    <dd itemprop="recipeIngredient" v-for="ingredient in recipe.ingredients">
                        <span>{{ingredient.name}}</span>
                        <span class="qty">{{ingredient.qty}} {{ingredient.unit}}</span>
                    </dd>
                </dl>
            </div>
            </div>
        <div class="row">
            <div class="col-12 ">

                <div class="recipe-info">
                    <h3 :class="['inf', recipe.slug]">Infos</h3>

                    <div class="container-fluid  row mx-0">

                    <div class="col-md-4 col-sm-12 text-center">
                        <p> <i :class="['fa','fa-clock-o icon', recipe.slug]"  aria-hidden="true"></i> </p>
                        <p>    Temps de préparation </p>

                        <time datetime="<?php echo $pt; ?>" itemprop="prepTime" >{{recipe.prep}}</time>
                        Minutes
                    </div>

                    <div class="col-md-4 col-sm-12 text-center">
                        <p> <i  :class="['fa','fa-clock-o icon', recipe.slug]" aria-hidden="true"></i> </p>
                        <p>Temps de cuisson </p>

                        <time  itemprop="prepTime" >{{recipe.cook}}</time>
                        Minutes
                    </div>

                    <div class="col-md-4 col-sm-12 text-center">
                        <p> <i :class="['fa','fa-bullseye icon', recipe.slug]" aria-hidden="true"></i> </p>
                        <p>Difficulté</p>

                        <time itemprop="prepTime" >{{recipe.difficulty}}</time>

                    </div>



                    </div>
                </div>
            </div>


            </div>
        <div class="row">
            <div class="col-12 recipe-directions">
        <div class="recipe__row  wow slideInUp">
            <h3 class="recipe__sub_title ">Étapes :</h3>
                <div  :class="['recipe__directions_inner', recipe.slug]" >
                    <ol>
                        <li v-for="(direction, i) in recipe.directions">
                            <p>
                                {{direction.description}}
                            </p>
                        </li>
                    </ol>
                </div>
            </div>
        </div>
        </div>
            </div>
                   <!-- Directions -->
                </div>
</template>

<script type="text/javascript">
	import Auth from '../../store/auth'
	import Flash from '../../helpers/flash'
	import { get, del } from '../../helpers/api'
	export default {
		data() {
			return {
				authState: Auth.state,
				isRemoving: false,
				recipe: {
					user: {},
					ingredients: [],
					directions: []
				}
			}
		},
		created() {
			get(`/api/recipes/${this.$route.params.id}`)
				.then((res) => {
					this.recipe = res.data.recipe
				})
		},
		methods: {
			remove() {
				this.isRemoving = false
				del(`/api/recipes/${this.$route.params.id}`)
					.then((res) => {
						if(res.data.deleted) {
							Flash.setSuccess('You have successfully deleted recipe!')
							this.$router.push('/')
						}
					})
			}
		}
	}

</script>

<!--<script charset="utf-8" src="/js/bootstrap.min.js"></script>-->
<!--<script charset="utf-8" src="/js/wow.min.js"></script>-->
