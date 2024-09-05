<script setup>
let email = ''
let password = ''
let passwordError = ''

const handleSubmit = () => {
	console.log('hello')
	passwordError = password.length > 5 ? '' : 'Password must be at least 5 chars long'
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