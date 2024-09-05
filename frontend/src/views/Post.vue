<script setup>
	import { useRoute } from 'vue-router'
	import store from '../store'

	const route = useRoute()
	const post = store.posts.find(x => x.id === parseInt(route.params.id))


</script>

<template>
	<div class="Post text-center container mx-auto">
		<p>Post</p>
		<div v-if="!post">
			Pas de post
		</div>
		<div v-else>
			<h1 class="text-slate-900 text-3xl font-bold mb-4">{{ post.title }}</h1>
			<p class="text-md text-slate-300">{{ post.created_at }}</p>
			<p class="text-xl text-slate-500">{{ post.body }}</p>
		</div>
	</div>
</template> 