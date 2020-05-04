<template>
    <div class="">
	<div class="recipe__show wow bounceInUp" >
        <div class="row ">


        </div>
        <div class="row mr-0 ml-0 recipe__box">
            <div class="col-12">
                <h1  :class="['recipe__title', recipe.slug]">{{recipe.name}}</h1>
                <div class="row">
                <div class="col-12"><small>Recette ajoutée par : {{recipe.user.name}} </small>
                  <div class="col-6">Cuisine:{{recipe.cuisine}}</div>

                </div>
                <div :class="['col-6', recipe.slug]" >Catégorie: {{recipe.category}}</div>
                <div class="col-4" > {{recipe.description}}</div>
                <div class="col-4">  </div>
                </div>


                <div class="col-4">
                  </div>

            </div>
            <div class="col-md-6 col-sm-12 col-xs-12 recipe__box">
                <div class="wow">
                   <img :src="`/images/${recipe.image}`" v-if="recipe.image">
                </div>
            </div>
            <div class="col-md-6 col-sm-12 col-xs-12 recipe-ingredients recipe__box" id="ings">
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

                    <div class="container-fluid  row mx-0">
                        <h3 :class="['inf', 'col-12', recipe.slug]">Infos</h3>

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
                <div  :class="['recipe__directions_inner', recipe.slug]" >
                    <h3 :class="['recipe__title', 'col-12',recipe.slug]" >Étapes :</h3>

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
