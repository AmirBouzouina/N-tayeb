<template>
	<div class="recipe__show">
		<div class="recipe__header">
			<h3>Ajouter Ma recette</h3>
			<div>
				<button class="btn btn__primary" @click="save" :disabled="isProcessing">Enregistrer</button>
				<button class="btn" @click="$router.back()" :disabled="isProcessing">Annuler</button>
			</div>
		</div>
		<div class="recipe__row">
			<div class="recipe__image">
				<div class="recipe__box">
					<image-upload v-model="form.image"></image-upload>
					<small class="error__control" v-if="error.image">{{error.image[0]}}</small>
				</div>
			</div>

			<div class="recipe__details">
				<div class="recipe__details_inner">
					<div class="form__group">
					    <label>Nom de la recette</label>
					    <input type="text" class="form__control" v-model="form.name" placeholder="Nom de la recette">
					    <small class="error__control" v-if="error.name">{{error.name[0]}}</small>
					</div>
						<div class="form__group">
					    <label>Catégorie de la recette</label>
					    <select class="form__control" v-model="form.category">
							<option disabled value="">Choisissez une catégorie</option>
							<option >Dessert</option>
							<option >Entrées</option>
							<option >Salades‎</option>
							<option >Plats</option>
							<option >Viande</option>
							<option >Poissons‎‎</option>
							<option >Soupes‎</option>
							<option >Pâtes &amp; Riz</option>
							<option >Pains</option>
							<option >‎Sauces</option>
						</select>
					</div>
                    <div class="form__group">
                        <label>Cuisine :</label>
                        <select class="form__control" v-model="form.cuisine">
                            <option disabled value="">Choisissez une cuisine</option>
                            <option >Algérienne</option>
                            <option >Algéroise</option>
                            <option >Marocaine</option>
                            <option >Tunisienne</option>
                            <option >Italienne</option>
                            <option >Indienne</option>
                            <option >Française</option>
                            <option >Grecque</option>
                            <option >Vegétariene</option>
                            <option >Syrienne</option>
                        </select>
                    </div>

					<div class="form__group">
					    <label>Description</label>
					    <textarea class="form__control form__description" v-model="form.description"></textarea>
					</div>
				</div>
			</div>
		</div>

		<div class="recipe__details2">
			<div class="recipe__row2">

			<div class="recipe__details_inner">
				<div class="form__group2">
					<label>Temps de préparation</label>
					<input type="text" class="form__control" v-model="form.prep" placeholder="En minutes">
				</div>
				<div class="form__group2">
					<label>Temps de cuisson</label>
					<input type="text" class="form__control" v-model="form.cook" placeholder="En minutes" >
				</div>
				<div class="form__group2">
					<label>Pour : nombre personnes</label>
					<input type="text" class="form__control" v-model="form.yield" placeholder="Nombre de portions">
				</div>
				<div class="form__group2">
					<label>Difficulté</label>
					<select  class="form__control" v-model="form.difficulty">
						<option disabled value="">Choisissez</option>
						<option>Facile</option>
						<option>Moyenne</option>
						<option>Difficile</option>
					</select>
				</div>
			</div>
		</div>
		</div>

		<div class="recipe__row">
			<div class="recipe__ingredients">
				<div class="recipe__box">
					<div class="row">
					<h3 class="recipe__sub_title">Ingrédients</h3>
					<div v-for="(ingredient, index) in form.ingredients" class="recipe__form">
						<input type="text" placeholder="Ingrédient" class="form__control form__control2" v-model="ingredient.name"
							:class="[error[`ingredients.${index}.name`] ? 'error__bg' : '']">
						<input type="text" placeholder="Quantité" class="form__control form__qty form__qty2" v-model="ingredient.qty"
							:class="[error[`ingredients.${index}.qty`] ? 'error__bg' : '']">
						<input type="text" placeholder="Unité" class="form__control form__qty form__qty2" v-model="ingredient.unit"
							   :class="[error[`ingredients.${index}.unit`] ? 'error__bg' : '']">
						<button @click="remove('ingredients', index)" class="btn btn__danger">&times;</button> <br>
					</div>
					<small  class="form__control2">Ex :Carottes,Beurre,Viande-hachée </small>
					<small class="form__qty2">Ex :Gr,Kg,CàC </small>

					</div>
					<button @click="addIngredient" class="btn">Ajouter ingrédient</button>
				</div>
			</div>
			<div class="recipe__directions">
				<div class="recipe__directions_inner">
					<h3 class="recipe__sub_title">Étapes</h3>
					<div v-for="(direction, index) in form.directions" class="recipe__form">
						<textarea class="form__control form__margin" v-model="direction.description"
							:class="[error[`directions.${index}.description`] ? 'error__bg' : '']"
							></textarea>
						<button @click="remove('directions', index)" class="btn btn__danger">&times;</button>
					</div>
					<button @click="addDirection" class="btn">Ajouter étape</button>
				</div>
			</div>
		</div>
	</div>
</template>
<script type="text/javascript">
	import Vue from 'vue'
	import Flash from '../../helpers/flash'
	import { get, post } from '../../helpers/api'
	import { toMulipartedForm } from '../../helpers/form'
	import ImageUpload from '../../components/ImageUpload.vue'

	export default {
		components: {
			ImageUpload
		},
		data() {
			return {
				form: {
					ingredients: [],
					directions: []
				},
				error: {},
				isProcessing: false,
				initializeURL: `/api/recipes/create`,
				storeURL: `/api/recipes`,
				action: 'Create'
			}
		},
		created() {
			if(this.$route.meta.mode === 'edit') {
				this.initializeURL = `/api/recipes/${this.$route.params.id}/edit`
				this.storeURL = `/api/recipes/${this.$route.params.id}?_method=PUT`
				this.action = 'Update'
			}
			get(this.initializeURL)
				.then((res) => {
					Vue.set(this.$data, 'form', res.data.form)
				})
		},
		methods: {
			save() {
				const form = toMulipartedForm(this.form, this.$route.meta.mode)
				post(this.storeURL, form)
				    .then((res) => {
				        if(res.data.saved) {
				            Flash.setSuccess(res.data.message)
				            this.$router.push(`/recipes/${res.data.id}`)
				        }
				        this.isProcessing = false
				    })
				    .catch((err) => {
				        if(err.response.status === 422) {
				            this.error = err.response.data
				        }
				        this.isProcessing = false
				    })
			},
			addDirection() {
				this.form.directions.push({
					description: ''
				})
			},
			addIngredient() {
				this.form.ingredients.push({
					name: '',
					qty: '',
					unit:''
				})
			},
			remove(type, index) {
				if(this.form[type].length > 1) {
					this.form[type].splice(index, 1)
				}
			}
		}
	}
</script>


