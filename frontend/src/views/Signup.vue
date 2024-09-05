<script setup>
let email = ''
let password = ''
let passwordError = ''

const handleSubmit = () => {
	// passwordError = password.length > 5 ? '' : 'Password must be at least 5 chars long'
	console.log("a")
	const register = async () => {
    await fetch(`http://localhost:3000/signup?email=${email}&password=${password}`)
        .then(res => res.json())
        .then(data => localStorage.setItem("csrf", data['csrf']))
        .catch(err => console.log(err.message))
	}
	register()
}
</script>

<template>
	<div class="container mx-auto">
		<form @submit.prevent="handleSubmit">
			<label>Email:</label>
			<input type="email" required v-model="email">

			<label>Password:</label>
			<input type="password" required v-model="password">
			<div v-if="passwordError" class="error">{{ passwordError }}</div>

			<div class="submit">
				<button>Create an account</button>
			</div>
		</form>		
	</div>
</template>

<style type="text/css">

	.error {
	    color: #ff0062;
	    margin-top: 10px;
	    font-size: 0.8em;
	    font-weight: bold;
	}

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

	input, select {
		display: block;
		padding: 10px 6px;
		width: 100%;
		box-sizing: border-box;
		border: none;
		border-bottom: 1px solid #ddd;
		color: #555;
	}
	input[type="checkbox"] {
		display: inline-block;
		width: 16px;
		margin: 0 10px 0 0;
		position: relative;
		top: 2px;
	}
</style>