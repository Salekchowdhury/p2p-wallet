<template>
  <div class="container mt-5">
    <div class="row">
      <div class="col-8">
        <div class="card">
          <div class="row container">
            <div class="col-md-2 mr-2 my-2">
              <RouterLink to="/addUser" class="btn btn-primary btn-sm"
                >Add User</RouterLink
              >
            </div>
          </div>
          <div class="card-header">Users</div>
          <div class="card-body">
            <table class="table table-bordered">
              <thead>
                <tr>
                  <td>ID</td>
                  <td>Name</td>
                  <td>Role</td>
                  <td>Currency</td>
                  <td>Action</td>
                </tr>
              </thead>
              <tbody v-if="this.users.length > 0">
                <tr v-for="(user, index) in this.users" :key="index">
                  <td>{{ user.id }}</td>
                  <td>{{ user.name }}</td>
                  <td>{{ user.role }}</td>
                  <td>{{ user.currency }}</td>
                  <td>
                    <RouterLink
                      class="btn btn-success btn-sm me-2"
                      :to="{ path: '/users/' + user.id + '/edit' }"
                      >Edit</RouterLink
                    >
                    <RouterLink
                      class="btn btn-primary btn-sm me-2"
                      :to="{ path: '/users/' + user.id + '/deposit' }"
                      >Deposit</RouterLink
                    >
                    <button
                      class="btn btn-danger btn-sm"
                      @click="deleteUser(user.id)"
                    >
                      Delete
                    </button>
                  </td>
                </tr>
              </tbody>
              <tbody v-else>
                <tr>
                  <td collapse="4">Loading...</td>
                </tr>
              </tbody>
            </table>
          </div>
        </div>
      </div>
      <div class="col-4">
        Most Transactioner Name:<strong class="font-weight-bold">{{
          this.toperName
        }}</strong
        ><br />
        Most Transaction:<strong class="font-weight-bold">{{
          this.topTransaction
        }}</strong>
        <h5 class="mt-3">Three highest number of transaction Users</h5>
        <table class="table table-bordered">
          <thead>
            <tr>
              <td>ID</td>
              <td>Name</td>
              <td>Action</td>
            </tr>
          </thead>
          <tbody v-if="this.users.length > 0">
            <tr v-for="(user, index) in this.TopThreeUsers" :key="index">
              <td>{{ user.sender_id }}</td>
              <td>{{ user.total }}</td>
              <td>
                <RouterLink
                  class="btn btn-primary btn-sm me-2"
                  :to="{ path: '/users/' + user.sender_id }"
                  >View</RouterLink
                >
              </td>
            </tr>
          </tbody>
        </table>
      </div>
    </div>
  </div>
</template>

<script>
import axios from "axios";
export default {
  name: "dashboardView",
  data() {
    return {
      users: [],
      TopThreeUsers: [],
      topTransaction: "",
      toperName: "",
    };
  },
  mounted() {
    this.showAllUserData();
    this.showTopTransactionUser();
    this.showTopThreeTransactionUser();
  },
  methods: {
    showAllUserData() {
      axios.get(`http://127.0.0.1:8000/api/users`).then((res) => {
        if (res.data.users) {
          this.users = res.data.users;
        }
      });
    },
    showTopTransactionUser() {
      axios.get(`http://127.0.0.1:8000/api/topTransaction`).then((res) => {
        if (res.status == 200) {
          this.topTransaction = res.data.data.total;
          this.toperName = res.data.user;
        }
      });
    },
    showTopThreeTransactionUser() {
      axios.get(`http://127.0.0.1:8000/api/topThreeTransaction`).then((res) => {
        if (res.status == 200) {
          this.TopThreeUsers = res.data.data;
          // console.log(this.TopThreeUsers);
        }
      });
    },
    deleteUser(id) {
      axios
        .delete(`http://127.0.0.1:8000/api/users/${id}/delete`)
        .then((res) => {
          alert(res.data.message);
          this.showAllUserData();
        });
    },
  },
};
</script>
