import { reactive } from 'vue'

const store = reactive({
	posts: [],
	editPost: {},
	showPost: {},
	isAuth: function() { 
		if (localStorage.getItem('access') !== null) {
			return true
		} else {
			return false
		}
	},
	passwordError: ''
})

export default store;
