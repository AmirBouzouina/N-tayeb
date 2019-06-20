<template>
	<div class="recipe__show wow bounceInUp" >
        <h1 class="recipe__title">{{recipe.name}}</h1>
        <div class="row">
                       <div class="col-4"><small>Recette ajoutée par :</small>{{recipe.user.name}}
            </div>


            <div class="col-6">Catégorie:</div>
            <div class="col-4">{{recipe.category}}</div>
            <div class="col-6">Cuisine:</div>
            <div class="col-4">{{recipe.cuisine}} </div>
        </div>
        <div class="row">

            <div class="col-md-8 col-sm-12 ">

                <div class="recipe__box wow swing">

                    <img :src="`/images/${recipe.image}`" v-if="recipe.image">
                </div>
            </div>
            <div class="col-md-4 col-sm-12 col-xs-12 recipe-ingredients recipe__box">
                <h3 class="recipe__sub_title">Ingrédients</h3>
                <dl class="ingredients-list">
                    <dd itemprop="recipeIngredient" v-for="ingredient in recipe.ingredients">
                        <span>{{ingredient.name}}</span>
                        <span class="qty">{{ingredient.qty}}</span>
                    </dd>
                </dl>
            </div>


                </div>
        <div class="row">
            <div class="col-12 ">

                <div class="recipe-info">
                    <h3 class="inf">Infos</h3>

                    <div class="row container-fluid">

                    <div class="col-4 text-center">
                        <p> <i class="fa fa-clock-o icon" aria-hidden="true"></i> </p>
                        <p>    Temps de préparation </p>

                        <time datetime="<?php echo $pt; ?>" itemprop="prepTime" >{{recipe.prep}}</time>
                        Minutes
                    </div>

                    <div class="col-4 text-center">
                        <p> <i class="fa fa-clock-o icon" aria-hidden="true"></i> </p>
                        <p>Temps de cuisson </p>

                        <time datetime="<?php echo $pt; ?>" itemprop="prepTime" >{{recipe.cook}}</time>
                        Minutes
                    </div>

                    <div class="col-4 text-center">
                        <p> <i class="fa fa-bullseye icon" aria-hidden="true"></i> </p>
                        <p>Difficulté</p>

                        <time datetime="<?php echo $pt; ?>" itemprop="prepTime" >{{recipe.difficulty}}</time>

                    </div>



                    </div>









                </div>


            </div>


            </div>
        <div class="row">

            <div class="col-12 recipe-directions">

        <div class="recipe__row  wow slideInUp">

            <div class="col-6">Portions</div>
            <div class="col-4">{{recipe.yield}} Personnes</div>


                <div class="recipe__directions_inner">
                    <h3 class="recipe__sub_title">Étapes :</h3>
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
