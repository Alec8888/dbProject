

//const routes = [

export default [
  {
    path: '/',
    component: () => import('layouts/MainLayout.vue'),

    children: [
      { path: '', component: () => import('pages/IndexPage.vue') },
      { path: 'queryOne', component: () => import('pages/queryOne.vue') },
      { path: 'queryTwo', component: () => import('pages/queryTwo.vue') },
      { path: 'queryThree', component: () => import('pages/queryThree.vue') },
      { path: 'queryFour', component: () => import('pages/queryFour.vue') },
      { path: 'queryFive', component: () => import('pages/queryFive.vue') },
      { path: 'feedback', component: () => import('pages/submitFeedback.vue') },
      { path: 'thanks', component: () => import('pages/thankYou.vue') },
    ]
  },

  // Always leave this as last one,
  // but you can also remove it
  {
    path: '/:catchAll(.*)*',
    component: () => import('pages/ErrorNotFound.vue')
  }
]

//]

//export default routes
