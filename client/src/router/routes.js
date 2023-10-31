export default [
  {
    path: '/',
    component: () => import('layouts/MainLayout.vue'),

    children: [
      { path: '', component: () => import('pages/homePage.vue'), meta: { title: 'Home' } },
      { path: 'queryOne', component: () => import('pages/queryOne.vue'), meta: { title: 'Runs-to-Outs by Salary range' } },
      { path: 'queryTwo', component: () => import('pages/queryTwo.vue'), meta: { title: 'Team Spending Per Win' } },
      { path: 'queryThree', component: () => import('pages/queryThree.vue'), meta: { title: 'Foreign-born MLB player distributions' } },
      { path: 'queryFour', component: () => import('pages/queryFour.vue'), meta: { title: 'Player Height & Performance' } },
      { path: 'queryFive', component: () => import('pages/queryFive.vue'), meta: { title: 'Home Runs & Post Season' } },
      { path: 'feedback', component: () => import('pages/submitFeedback.vue'), meta: { title: 'Feedback' } },
      { path: 'thanks', component: () => import('pages/thankYou.vue'), meta: { title: 'Thank You' } },
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
