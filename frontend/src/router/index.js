import { createRouter, createWebHistory } from 'vue-router'

const router = createRouter({
  history: createWebHistory(import.meta.env.BASE_URL),
  routes: [
    {
      path: '/',
      name: 'Home',
      component: () => import('../views/Home.vue')
    },
    {
      path: '/post/:id',
      name: 'Post',
      component: () => import('../views/Post.vue')
    },
    {
      path: '/signup',
      name: 'Signup',
      component: () => import('../views/Signup.vue')
    },
    {
      path: '/create-blog',
      name: 'CreatePost',
      component: () => import('../views/CreatePost.vue')
    },
    {
      path: '/edit/:id',
      name: 'EditPost',
      component: () => import('../views/EditPost.vue')
    }    
  ]
})

export default router
