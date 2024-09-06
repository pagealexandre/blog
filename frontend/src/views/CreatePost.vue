<script setup>
import { useRouter } from 'vue-router'

let title = ''
let body = ''
let image 
const router = useRouter()

const handleSubmit = () => {
	const createPost = async () => {
    await fetch(`http://localhost:3000/articles`, {
	    headers: {
	      'Accept': 'application/json',
	      'Content-Type': 'application/json',
	      'Authorization': localStorage.getItem('access') 
	    },
	    method: "POST",
	    body: JSON.stringify({title: title, body: body})
	})
        .then(res => res.json())
        .then(data => router.push('/'))
        .catch(err => console.log(err.message))
	}
	createPost()
	console.log(localStorage.getItem('access'))
}

</script>

<template>
		<div class="Home">
			<main class="container mx-auto text-center">
				<h1 class="font-bold">Post creation</h1>

				<form @submit.prevent="handleSubmit">
					<label>Title:</label>
					<input type="title" required v-model="title">

					<label>Body:</label>
					<textarea cols="40" rows="5" required v-model="body"></textarea>

					<label> Image:</label>
				    <input name="image" type="file" @change="onFileChanged($event)" accept="image/*" capture data-direct-upload-url="/rails/active_storage/direct_uploads"
        			direct_upload="true" />

					<div class="submit">
						<button>Create a post</button>
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