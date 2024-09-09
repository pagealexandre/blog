<script setup>
import { RouterLink } from 'vue-router'
import { useRouter } from 'vue-router'
import store from '../store.js'

const router = useRouter()

const Logout = () => {
	localStorage.removeItem('access')
	localStorage.removeItem('user')
	document.getElementById('logout').remove()
	window.location.reload();
}

</script>
<template>
			<header class="text-center my-8">
				<h1 class="text-blue-300 text-6xl font-bold mb-4" @click="$router.push('/')">
				Alex's blog
				</h1>
				<p class="text-xl text-slate-500">A blog with post on what I like</p>
					<RouterLink v-if="!store.isAuth()" to="/signup">Signup </RouterLink>
					<RouterLink v-if="!store.isAuth()" to="/signin">Signin </RouterLink>
					<div id="logout" v-if="store.isAuth()" @click="Logout">Logout</div>
			</header>
</template>