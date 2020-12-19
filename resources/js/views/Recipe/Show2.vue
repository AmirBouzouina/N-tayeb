<template>
    <div class="">
	<div class="recipe__show wow bounceInUp" >




        <div class="row">
            <div class="col-12 ">
                <div class="col-12"><h1  :class="['recipe__title', recipe.slug]">{{recipe.name}}</h1> </div>

                <div class="recipe-info">

                    <div class="container-fluid  row mx-0">
                    <div class="col-md-4 col-sm-12 text-center">
                        <p> <i :class="['fa','fa-clock-o icon', recipe.slug]"  aria-hidden="true"></i> Préparation : <time datetime="<?php echo $pt; ?>" itemprop="prepTime" >{{recipe.prep}}</time>Minutes </p>


                    </div>
                    <div class="col-md-4 col-sm-12 text-center">
                        <p> <i  :class="['fa','fa-clock-o icon', recipe.slug]" aria-hidden="true"></i> Cuisson :<time  itemprop="prepTime" >{{recipe.cook}}</time> Minutes</p>
                    </div>

                    <div class="col-md-4 col-sm-12 text-center">
                        <p>     <i :class="['fa','fa-bullseye icon', recipe.slug]" aria-hidden="true"></i>Difficulté : <time itemprop="prepTime" >{{recipe.difficulty}}</time></p>


                    </div>

                    </div>
                </div>
            </div>


            </div>
        <div class="row mr-0 ml-0 recipe__box">
            <div class="col-12">



                <div class="row">

                <div :class="['col-8', recipe.slug]" >
                                       <img :src="`/images/${recipe.image}`" v-if="recipe.image">

                </div>
            <div class="col-4">
                 <div class="col-12"><small>Recette ajoutée par : {{recipe.user.name}} </small></div>
                  <div class="col-12">Cuisine:{{recipe.cuisine}}</div>
                <div :class="['col-12', recipe.slug]" >Catégorie: {{recipe.category}}</div>


                <a href="https://www.facebook.com/sharer/sharer.php?u=ntayeb.net&display=popup"> share this </a>
            </div>

                </div>



            </div>
            <div class="col-md-6 col-sm-12 col-xs-12 recipe__box">
                <div class="wow">
                </div>
            </div>

            </div>
            <br/>

        <div class="row mr-0 ml-0 recipe__box">
<h3  :class="['recipe__sub_title', recipe.slug]" >Déscription</h3> <br/>
                    <p>{{recipe.description}} </p> </div>




            <br/>
                    <div class="row mr-0 ml-0 wow slideInUp">
            <div class="col-4 recipe__box recipe__row">

<h3  :class="['recipe__sub_title', recipe.slug]" >Ingrédients</h3>
<br/>
<p :class="['recipe__yielding', recipe.slug]" > Pour: {{recipe.yield}} Personnes</p>
                    <dl class="ingredients-list mt-9 col-12">
                    <dd  itemprop="recipeIngredient" v-for="ingredient in recipe.ingredients">
                        <p class="ingredient-item"><span>{{ingredient.name}}</span>
                        <span class="qty">{{ingredient.qty}} {{ingredient.unit}}</span> </p>
                    </dd>
                </dl>                    </div>
                          <div class=" recipe__directions col-8">
        <div class="recipe__row   ">
                <div  :class="['recipe__directions_inner', recipe.slug]" >
                    <h3 :class="['recipe__title', 'col-12',recipe.slug]" >Étapes :</h3>
<div class="col-12">
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
        <div class="row">

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
