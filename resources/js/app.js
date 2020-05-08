import Vue from 'vue'

import App from './App.vue'
import router from './router'
import 'es6-promise/auto';
import "babel-polyfill";
import 'whatwg-fetch';

require('./bootstrap');

const app = new Vue({
	el: '#root',

	template: `<app></app>`,
	components: { App },
	router,

})
