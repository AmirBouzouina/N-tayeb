
<template>
<div>
	


	
	    <div class="container px-0 mx-0">


	<div class="row container-fluid home" style="width: 100vw;margin: auto;">
	

<div class="row col-md-3 px-0 " >
    <div style="width:80%;height:100%;background-color:grey;">
    </div>
    </div>

	<div class="row col-md-9 bg" >
           

		<div :class="['recipe__item','col-md-2','col-sm-12','hvr-float']"  v-for="cat in cats" v-bind:key="cat.category"  >

			<router-link :class="['recipe__inner', cat.category]" :to="`/categorie/${cat.category}`"  >
			

				<p class="recipe__name" :class="['recipe__subi_title', cat.category+'_titre']">{{cat.category}}</p>

			</router-link>
                                        <p class="recipe__name" >{{cat.count}} Recettes</p>

		</div>
	</div>

		</div>






		</div>
	
<div class="footer-basic"  >
        <footer>
            <div class="social"><a href="#"><i class="icon ion-social-instagram"></i></a><a href="#"><i class="icon ion-social-snapchat"></i></a><a href="#"><i class="icon ion-social-twitter"></i></a><a href="#"><i class="icon ion-social-facebook"></i></a></div>
            <ul class="list-inline">
                <li class="list-inline-item"><a href="#">Home</a></li>
                <li class="list-inline-item"><a href="#">Services</a></li>
                <li class="list-inline-item"><a href="#">About</a></li>
                <li class="list-inline-item"><a href="#">Terms</a></li>
                <li class="list-inline-item"><a href="#">Privacy Policy</a></li>
            </ul>
            <p class="copyright">Company Name © 2021</p>
        </footer>
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
			get('/api/categories')
				.then((res) => {
					this.categories = res.data.categories;
					} );



		}
	};

;		
var str = window.location.href 

	 if ( str != ('http://localhost/') ) {
	 str = (str.substring('http://localhost/categorie/'.length))+('_titre');
         $("#footer-basic").addClass(str);
		 $(".navbar").addClass(str);
};



</script>
