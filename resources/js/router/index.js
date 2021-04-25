import Vue from 'vue'
import VueRouter from 'vue-router'
import Login from '../views/Auth/Login.vue'
import Register from '../views/Auth/Register.vue'
import RecipeIndex from '../views/Recipe/Index.vue'
import RecipeShow from '../views/Recipe/Show2.vue'
import CategoryIndex from '../views/cats/Cat.vue'
import CategoryShow from '../views/cats/Cat.vue'
import RecipeSearch from '../views/Recipe/Search.vue'
import RecipeForm from '../views/Recipe/Ajout.vue'
import NotFound from '../views/NotFound.vue'

Vue.use(VueRouter)

const router = new VueRouter({
	mode: 'history',
	routes: [
		{ path: '/', component: RecipeIndex },
		{ path: '/recettes/ajouter', component: RecipeForm, meta: { mode: 'create' }},
		{ path: '/recettes/search', component: RecipeSearch },
		{ path: '/recettes/:id', component: RecipeShow },
		{ path: '/categorie/:category', component: CategoryShow },
		{ path: '/register', component: Register },
		{ path: '/login', component: Login },
		{ path: '/not-found', component: NotFound },
		{ path: '*', component: NotFound }
	]
})

export default router
