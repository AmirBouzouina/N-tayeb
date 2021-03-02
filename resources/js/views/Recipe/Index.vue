
<template>
	

	<div class="row container-fluid" style="width: 100vw;margin: auto;">
	

<div class="row col-md-3" >
    aaaaa
    </div>

	<div class="row col-md-9 bg" >
           

		<div :class="['recipe__item','col-md-2','col-sm-12','hvr-float']"  v-for="cat in cats" v-bind:key="cat.category"  >

			<router-link :class="['recipe__inner', cat.category]" :to="`/recipes/${cat.category}`"  >
			

				<p class="recipe__name" :class="['recipe__subi_title', cat.category+'_titre']">{{cat.category}}</p>

			</router-link>
                                        <p class="recipe__name" >{{cat.count}} Recettes</p>

		</div>
	</div>

		</div>

	

</template>




<script type="text/javascript">
	import { get } from '../../helpers/api'
	export default {
		data() {
			return {
				cats: []

			};

		},
		created() {
			get('/api/cats')
				.then((res) => {
					this.cats = res.data.cats;
					} );



		}
	};


</script>
