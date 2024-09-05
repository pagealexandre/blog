<script setup>
import store from '../store.js'

const getWordNumber = (str) => (str.split(' ').length);

const getAllPosts = async () => {
    await fetch('http://localhost:3000/articles/')
        .then(res => res.json())
        .then(data => store.posts = data)
        .catch(err => console.log(err.message))
}

const deletePost = async (post) => {
	store.posts = store.posts.filter(t => t !== post)
	fetch('http://localhost:3000/article-deletion?id=' + post.id)
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
				v-for="item, itemIndex in store.posts" :key="itemIndex" >
				<h1 @click="$router.push(`/post/${item.id}`)" class="text-slate-900 text-3xl font-bold">{{ item.title }}</h1>
					<div @click="deletePost(item)" class="flex items-center">
						<svg class="w-6" xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" strokeWidth={1.5} stroke="currentColor" className="size-6">
					  	<path strokeLinecap="round" strokeLinejoin="round" d="m14.74 9-.346 9m-4.788 0L9.26 9m9.968-3.21c.342.052.682.107 1.022.166m-1.022-.165L18.16 19.673a2.25 2.25 0 0 1-2.244 2.077H8.084a2.25 2.25 0 0 1-2.244-2.077L4.772 5.79m14.456 0a48.108 48.108 0 0 0-3.478-.397m-12 .562c.34-.059.68-.114 1.022-.165m0 0a48.11 48.11 0 0 1 3.478-.397m7.5 0v-.916c0-1.18-.91-2.164-2.09-2.201a51.964 51.964 0 0 0-3.32 0c-1.18.037-2.09 1.022-2.09 2.201v.916m7.5 0a48.667 48.667 0 0 0-7.5 0" />
						</svg>
						<p>{{ getWordNumber(item.body) }} words</p>
					</div>

				</div>
			</div>
		</main>
	</div>
</template>