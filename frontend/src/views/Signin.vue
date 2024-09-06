<script setup>
import { useRouter } from 'vue-router'
import store from '../store.js'

let email = 'alexandre.page2@gmail.com'
let password = 'hellomotoqdkljhezj'

const router = useRouter()
const handleSubmit = () => {
	const register = async () => {
    await fetch('http://localhost:3000/signin', {
	    headers: {
	      'Accept': 'application/json',
	      'Content-Type': 'application/json'
	    },
	    method: "POST",
	    body: JSON.stringify({email: email, password: password})
	})
		.catch(err => console.log(err.message))
        .then(res => res.json())
        .then(data => {
        	if (data['access']) {
    			localStorage.setItem("access", data['access'])
    			router.push('/')
        	} else {
        		store.passwordError = 'There is a password error'
        	}
    	})
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
			<div v-if="store.passwordError" class="error">
				<span>{{ store.passwordError }}</span>
			</div>

			<div class="submit">
				<button>Sign in</button>
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