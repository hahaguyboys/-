import Vue from 'vue'
import VueRouter from 'vue-router'

Vue.use(VueRouter)

const routes = [
  // {
  //   path: '/',
  //   name: 'LoginUi',
  //   component: () => import('../views/LoginUi.vue')
  // },
  {
    path: '/',
    redirect: 'LoginUi',
  },
  {
    path: '/LoginUi',
    name: 'LoginUi',
    component: () => import('../views/LoginUi.vue')
  },
 
  {
    path: '/AdminCenter',
    name: 'AdminCenter',
    component: () => import('../views/Admin/Admin_User/AdminCenter.vue')
  },
  {
    path: '/AppUser',
    name: 'AppUser',
    component: () => import('../views/Admin/Admin_User/AppUser.vue')
  },
  {
    path: '/ComplaintsUser',
    name: 'ComplaintsUser',
    component: () => import('../views/Admin/Admin_User/ComplaintsUser.vue')
  },
  {
    path: '/InfoUser',
    name: 'InfoUser',
    component: () => import('../views/Admin/Admin_User/InfoUser.vue')
  },
  {
    path: '/InfoUser',
    name: 'InfoUser',
    component: () => import('../views/Admin/Admin_User/InfoUser.vue')
  },
  {
    path: '/AdminPetApp',
    name: 'AdminPetApp',
    component: () => import('../views/Admin/Admin_Pet/AdminPetApp.vue')
  },
  {
    path: '/AdminPetInfo',
    name: 'AdminPetInfo',
    component: () => import('../views/Admin/Admin_Pet/AdminPetInfo.vue')
  },
  {
    path: '/AdminNotification',
    name: 'AdminNotification',
    component: () => import('../views/Admin/Admin_notification/AdminNotification.vue')
  },
  {
    path: '/petCount',
    name: 'petCount',
    component: () => import('../views/Admin/Admin_Count/petCount.vue')
  },
  {
    path: '/elseCount',
    name: 'elseCount',
    component: () => import('../views/Admin/Admin_Count/elseCount.vue')
  },
  {
    path: '/PetTag',
    name: 'PetTag',
    component: () => import('../views/Admin/Admin_Pet/AdminPetTag.vue')
  },


]

const router = new VueRouter({
  routes
})

export default router
