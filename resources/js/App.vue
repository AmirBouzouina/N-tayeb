
	<template>
<div>
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
					<router-link to="/recettes/ajouter">Ajouter ma recette</router-link>
				</li>
				<li class="navbar__item"  v-if="auth">
					<a @click.stop="logout">Se déconnecter</a>
				</li>
			</ul>
		</div>


		</div>




		<router-view></router-view>


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
