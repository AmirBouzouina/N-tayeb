
	<template>
    <div class="container px-0 mx-0">

    <div class="navbar"> 
		<div class="row" style="width:70vw;margin:auto;">
			<div class="navbar__brand col-6">
				<router-link to="/"><img class="logo" src="../img/logo.png"/></router-link>
			</div>
			<ul class="navbar__list col-6">
				<li class="navbar__item"  v-if="guest">
					<router-link to="/login">Se connecter</router-link>
				</li>
				<li class="navbar__item"  v-if="guest">
					<router-link to="/register">Créer un compte</router-link>
				</li>
				<li class="navbar__item"  v-if="auth">
					<router-link to="/recipes/create">Ajouter ma recette</router-link>
				</li>
				<li class="navbar__item"  v-if="auth">
					<a @click.stop="logout">Se déconnecter</a>
				</li>
			</ul>
		</div>
		</div>


    <div class="flash flash__error" v-if="flash.error">
			{{flash.error}}
		</div>
		<div class="flash flash__success" v-if="flash.success">
			{{flash.success}}
		</div>



		<router-view></router-view>
<div class="footer-basic">
        <footer>
            <div class="social"><a href="#"><i class="icon ion-social-instagram"></i></a><a href="#"><i class="icon ion-social-snapchat"></i></a><a href="#"><i class="icon ion-social-twitter"></i></a><a href="#"><i class="icon ion-social-facebook"></i></a></div>
            <ul class="list-inline">
                <li class="list-inline-item"><a href="#">Home</a></li>
                <li class="list-inline-item"><a href="#">Services</a></li>
                <li class="list-inline-item"><a href="#">About</a></li>
                <li class="list-inline-item"><a href="#">Terms</a></li>
                <li class="list-inline-item"><a href="#">Privacy Policy</a></li>
            </ul>
            <p class="copyright">Company Name © 2018</p>
        </footer>
    </div>
    </div>
	

	
</template>
<script type="text/javascript">
	import Auth from './store/auth'
	import Flash from './helpers/flash'
	import { post, interceptors } from './helpers/api'
	export default {
		created() {
			// global error http handler
			interceptors((err) => {
				if(err.response.status === 401) {
					Auth.remove()
					this.$router.push('/login')
				}

				if(err.response.status === 500) {
					Flash.setError(err.response.statusText)
				}

				if(err.response.status === 404) {
					this.$router.push('/not-found')
				}
			})
			Auth.initialize()
		},
		data() {
			return {
				authState: Auth.state,
				flash: Flash.state
			}
		},
		computed: {
			auth() {
				if(this.authState.api_token) {
					return true
				}
				return false
			},
			guest() {
				return !this.auth
			}
		},
		methods: {
			logout() {
				post('/api/logout')
				    .then((res) => {
				        if(res.data.done) {
				            // remove token
				            Auth.remove()
				            Flash.setSuccess('Vous êtes maintenant déconnecté !')
				            this.$router.push('/login')
				        }
				    })
			}
		}
	}
</script>
