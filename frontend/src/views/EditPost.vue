<script setup>
import { useRoute } from 'vue-router'
import { useRouter } from 'vue-router'
import store from '../store.js'

const route = useRoute()
const router = useRouter()

const getPost = async () => {
    await fetch('http://localhost:3000/articles/' + route.params.id)
        .then(res => res.json())
        .then(data => store.editPost = data)
        .catch(err => console.log(err.message))
}

const handleSubmit = async () => {
    await fetch(`http://localhost:3000/articles/${route.params.id}`, {
	    headers: {
	      'Accept': 'application/json',
	      'Content-Type': 'application/json'
	    },
	    method: "PUT",
	    body: JSON.stringify({title: store.editPost.title, body: store.editPost.body})
	})
    router.push('/')
}

getPost()

</script>

<template>
	<div class="Post text-center container mx-auto">
		<main class="container mx-auto text-center">
			<h1 class="font-bold">Post edition</h1>

			<form @submit.prevent="handleSubmit">
				<label>Title:</label>
				<input type="title" required v-model="store.editPost.title">

				<label>Body:</label>
				<textarea cols="40" rows="5" required v-model="store.editPost.body"></textarea>

				<div class="submit">
					<button>Edit</button>
				</div>
			</form>
		</main>
	</div>
</template> 

<style>
			button {
    background: #0b6dff !important;
    border: 0 !important;
    padding: 10px 20px !important;
    margin-top: 20px !important;
    color: white !important;
    border-radius: 20px !important;
}
.submit {
    text-align: center;
}

	
	form {
		width: 420px;
		margin: 30px auto;
		background: white;
		text-align: left;
		padding: 40px;
		border-radius: 10px;
	}

	label {
		color: #aaa;
		display: inline-block;
		margin: 25px 0 15px;
		font-size: 0.6em;
		text-transform: uppercase;
		letter-spacing: 1px;
		font-weight: bold;
	}

	input, select, textarea {
		display: block;
		padding: 10px 6px;
		width: 100%;
		box-sizing: border-box;
		border: none;
		border-bottom: 1px solid #ddd;
		color: #555;
	}
</style>