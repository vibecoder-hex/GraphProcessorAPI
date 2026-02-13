import { createRouter, createWebHistory } from 'vue-router'
import GraphDataInputView from "../views/GraphDataInputView.vue"
import AboutPageView from "../views/AboutPageView.vue"

const router = createRouter({
    history: createWebHistory(import.meta.env.BASE_URL),
    routes: [
        { path: '/', component: GraphDataInputView },
        { path: '/about', component: AboutPageView}
    ],
})

export default router
