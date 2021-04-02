
<template>
    <div class="container px-0 mx-0">

	      	<div class="row container-fluid" style="width: 70vw;margin: auto;">



	<div class="row col-md-12 bg" >
		
	<div :class="['recipe__item','col-md-2','col-sm-12','hvr-float']" v-for="rec in category" v-bind:key="rec.id"  >

			<router-link :class="['recipe__inner', rec.category]" :to="`/recettes/${rec.id}`"  :style="{backgroundImage:`url(/images/${rec.image})`}" > 
			

				<p class="recipe__name" :class="['recipe__subi_title', rec.category+'_titre']">{{rec.name}}</p>

			</router-link>

		</div>


	</div>



		</div>

	 <div id="footer-basic"  >

            <div class="social"><a href="#"><i class="icon ion-social-instagram"></i></a><a href="#"><i class="icon ion-social-snapchat"></i></a><a href="#"><i class="icon ion-social-twitter"></i></a><a href="#"><i class="icon ion-social-facebook"></i></a></div>
            <ul class="list-inline">
                <li class="list-inline-item"><a href="#">Home</a></li>
                <li class="list-inline-item"><a href="#">Services</a></li>
                <li class="list-inline-item"><a href="#">About</a></li>
                <li class="list-inline-item"><a href="#">Terms</a></li>
                <li class="list-inline-item"><a href="#">Privacy Policy</a></li>
            </ul>
            <p class="copyright">Company Name © 2018</p>
       
    </div>
	</div>


</template>




<script type="text/javascript">

	import { get } from '../../helpers/api'
	export default {
		data() {
					return {
						
	category: {
						recs: []

			
				},

			};

		},

		
		created() {
			get(`/api/category/${this.$route.params.category}`)

				.then((res) => {
					this.category = res.data.category
				})

		},


	}
setTimeout(function () {

	var str = window.location.href 

	 if ( str != ('http://localhost/') ) {
	 str = (str.substring('http://localhost/categorie/'.length))+('_titre');
         $("#footer-basic").addClass(str);
		 $(".navbar").addClass(str);
};

}, 1000)

</script>
