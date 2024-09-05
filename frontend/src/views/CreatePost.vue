<script setup>
let title = ''
let body = ''

const handleSubmit = () => {
	// passwordError = password.length > 5 ? '' : 'Password must be at least 5 chars long'
	const createPost = async () => {
    await fetch(`http://localhost:3000/article-creation?title=${title}&body=${body}`)
        .then(res => res.json())
        .then(data => console.log(data))
        .catch(err => console.log(err.message))
	}
	createPost()
    title = ''
    body = ''
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

					<div class="submit">
						<button>Create an account</button>
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

	.pill {
    display: inline-block;
    margin: 20px 10px 0 0;
    padding: 6px 12px;
    background: #eee;
    border-radius: 20px;
    font-size: 12px;
    letter-spacing: 1px;
    font-weight: bold;
    color: #777;
    cursor: pointer;
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