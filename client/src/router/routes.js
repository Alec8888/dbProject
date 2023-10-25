

//const routes = [

export default [
  {
    path: '/',
    component: () => import('layouts/MainLayout.vue'),

    children: [
      { path: '',
       component: () => import('pages/indexPage.vue') },
      { path: 'queryOne',
       component: () => import('pages/queryOne.vue') },
       { path: 'queryTwo',
       component: () => import('pages/queryTwo.vue') }
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
