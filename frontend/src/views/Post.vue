<script setup>
	import { useRoute } from 'vue-router'
	import store from '../store'

	const route = useRoute()
	const getPost = async () => {
    await fetch('http://localhost:3000/articles/' + route.params.id)
        .then(res => res.json())
        .then(data => store.showPost = data)
        .catch(err => console.log(err.message))
	}
	
	getPost()
</script>

<template>
	<div class="Post text-center container mx-auto">
		<div v-if="!store.showPost">
			Pas de post
		</div>
		<div>
			<h1 class="text-slate-900 text-3xl font-bold mb-4">{{ store.showPost.title }}</h1>
			<p class="text-xl text-slate-500">{{ store.showPost.body }}</p>
			<p class="text-md text-slate-300">{{ new Date(store.showPost.created_at).toLocaleDateString() }}</p>
		</div>
	</div>
</template>