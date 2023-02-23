import {
  createRouter,
  createWebHistory
} from 'vue-router'
import HomeView from '../views/HomeView.vue'
import LoginView from '../views/loginRegister/LoginView.vue'
import RegisterView from '../views/loginRegister/RegisterView.vue'
import DashboardView from '../views/admin/DashboardView.vue'
import UserEditView from '../views/admin/UserEditView.vue'
import AddUserView from '../views/admin/AddUserView.vue'
import DepositView from '../views/admin/DepositView.vue'
import UserView from '../views/admin/UserView.vue'
import UserListView from '../views/user/UserListView.vue'
import LogoutView from '../views/logout/LogoutView.vue'

const router = createRouter({
  history: createWebHistory(
    import.meta.env.BASE_URL),
  routes: [{
      path: '/',
      name: 'home',
      component: HomeView
    },
    {
      path: '/about',
      name: 'about',
      component: () => import('../views/AboutView.vue')
    }, {
      path: '/login',
      name: 'login',
      component: LoginView
    }, {
      path: '/logout',
      name: 'logout',
      component: LogoutView
    }, {
      path: '/register',
      name: 'register',
      component: RegisterView
    }, {
      path: '/dashboard',
      name: 'dashboard',
      component: DashboardView
    }, {
      path: '/addUser',
      name: 'addUser',
      component: AddUserView
    }, {
      path: '/users/:id',
      name: 'userView',
      component: UserView
    }, {
      path: '/users/:id/edit',
      name: 'userEdit',
      component: UserEditView
    }, {
      path: '/users/:id/deposit',
      name: 'deposit',
      component: DepositView
    }, {
      path: '/users/list',
      name: 'UsersList',
      component: UserListView
    },
  ]
})

export default router