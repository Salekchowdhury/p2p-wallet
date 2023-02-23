<template>
  <div class="container mt-5">
    <div class="row">
      <div class="col-8">
        <div class="card">
          <div class="row container"></div>
          <div class="card-header">Users List</div>
          <div class="card-body">
            <table class="table table-bordered">
              <thead>
                <tr>
                  <td>ID</td>
                  <td>Name</td>
                  <td>Currency</td>
                  <td>Action</td>
                </tr>
              </thead>
              <tbody v-if="this.users.length > 0">
                <tr v-for="(user, index) in this.users" :key="index">
                  <td>{{ user.id }}</td>
                  <td>{{ user.name }}</td>
                  <td>{{ user.currency }}</td>
                  <td v-if="this.id == user.id">
                    <button class="btn btn-sm btn-primary" disabled>
                      send
                    </button>
                  </td>
                  <td v-else="">
                    <RouterLink
                      class="btn btn-primary btn-sm me-2"
                      disabled
                      :to="{ path: '/users/' + user.id + '/deposit' }"
                      >Send</RouterLink
                    >
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
    </div>
  </div>
</template>

<script>
import axios from "axios";
export default {
  name: "userList",
  data() {
    return {
      users: [],
      id: "",
    };
  },
  mounted() {
    this.usersList();
    this.id = localStorage.getItem("id");
  },
  methods: {
    usersList() {
      axios.get(`http://127.0.0.1:8000/api/users`, this.status).then((res) => {
        if (res.data.users) {
          this.users = res.data.users;
        }
      });
    },
  },
};
</script>
