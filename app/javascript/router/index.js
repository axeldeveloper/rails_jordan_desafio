import Vue from 'vue'
import Router from 'vue-router'


import Home from '../components/Home'
import Search from '../components/Search'
import Status from '../components/Status'

Vue.use(Router)

export default new Router({
  routes: [
    { path: '/',       name: 'Home',   component: Home   },
    { path: '/Search', name: 'Search', component: Search },
    { path: '/Status', name: 'Status', component: Status }
  ]
})