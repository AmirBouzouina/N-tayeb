<template>




	    <div class="container px-0 mx-0" style="color:#E91E63;">

	<div class="recipe__show">
		    <div class="recipe__header">
			<h3>Ajouter ma recette</h3>



    </div>
    <div class=" row">
<div class="col-md-6">

<div class="form__group">
					    <label>Nom de la recette</label>
					    <input type="text" class="form__control" v-model="form.name" placeholder="Nom de la recette">
					    <small class="error__control" v-if="error.name">{{error.name[0]}}</small>
					</div>	

					<div class="form__group">
					    <label>Catégorie de la recette</label>
					




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
                        <label>Photo :</label>
					<image-upload v-model="form.image"></image-upload>
					<small class="error__control" v-if="error.image">{{error.image[0]}}</small>

				</div>

				
				
</div>
<div class="col-md-6">

<div class="form__group">
					    <label>Description</label>
					    <textarea class="form__control form__description" v-model="form.description"></textarea>
					</div>
					<div class="form__group2">
					<label>Temps de préparation</label>
					<input type="text" class="form__control2" v-model="form.prep" placeholder="En minutes">
				</div>
				<div class="form__group2">
					<label>Temps de cuisson</label>
					<input type="text" class="form__control2" v-model="form.cook" placeholder="En minutes" >
				</div>
				<div class="form__group2">
					<label>Pour : nombre personnes</label>
					<input type="text" class="form__control2" v-model="form.yield" placeholder="Nombre de portions">
				</div>
				<div class="form__group2">
					<label>Difficulté</label>
					<select  class="form__control2" v-model="form.difficulty">
						<option disabled value="">Choisissez</option>
						<option>Facile</option>
						<option>Moyenne</option>
						<option>Difficile</option>
					</select>
				</div>


    </div>



	</div>
<div style="text-align:center;">
				<button class="btn btn__primary" @click="save" :disabled="isProcessing">Enregistrer</button>
				<button class="btn" @click="$router.back()" :disabled="isProcessing">Annuler</button>
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
				initializeURL: `/api/recettes/create`,
				storeURL: `/api/recettes`,
				action: 'Create'
			}
		},
		created() {
			if(this.$route.meta.mode === 'edit') {
				this.initializeURL = `/api/recettes/${this.$route.params.id}/edit`
				this.storeURL = `/api/recettes/${this.$route.params.id}?_method=PUT`
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
				            this.$router.push(`/recettes/${res.data.id}`)
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
