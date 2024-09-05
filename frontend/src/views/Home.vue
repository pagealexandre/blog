<script setup>
import store from '../store.js'

const getWordNumber = (str) => (str.split(' ').length);

const getAllPosts = async () => {
    await fetch('http://localhost:3000/articles/')
        .then(res => res.json())
        .then(data => store.posts = data)
        .catch(err => console.log(err.message))
}

getAllPosts()

</script>

<template>
	<div class="Home">
		<main class="container mx-auto">
			<div v-if="!store.posts.length">
				There is no posts
			</div>

			<div v-else>
				<div class="PostItem border border-slate-300 mb-4 p-4 rounded-lg cursor-pointer" 
				v-for="item, itemIndex in store.posts" :key="itemIndex" 
				@click="$router.push(`/post/${item.id}`)">
				<h1 class="text-slate-900 text-3xl font-bold">{{ item.title }}</h1>
				<p>{{ getWordNumber(item.body) }} words</p>
				</div>
			</div>
		</main>
	</div>
</template>