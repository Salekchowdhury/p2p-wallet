<template>
  <section class="vh-100 gradient-custom">
    <div class="container py-5 h-100">
      <div class="row d-flex justify-content-center align-items-center h-100">
        <div class="col-12 col-md-8 col-lg-6 col-xl-5">
          <div class="card bg-dark text-white" style="border-radius: 1rem">
            <div class="card-body p-5 text-center">
              <div class="mb-md-5 mt-md-4 pb-5">
                <h2 class="fw-bold mb-2 text-uppercase">Login</h2>

                <div class="form-outline form-white mb-4">
                  <input
                    v-model="model.login.email"
                    type="email"
                    id="typeEmailX"
                    name="email"
                    class="form-control form-control-lg"
                    placeholder="Type Email..."
                  />
                </div>

                <div class="form-outline form-white mb-4">
                  <input
                    v-model="model.login.password"
                    type="password"
                    name="password"
                    id="typePasswordX"
                    class="form-control form-control-lg"
                    placeholder="Type Password"
                  />
                </div>

                <button
                  @click="login"
                  class="btn btn-outline-light btn-lg px-5"
                  type="submit"
                >
                  Login
                </button>
              </div>
              <div>
                <p class="mb-0">
                  Don't have an account?
                  <RouterLink to="/register" class="text-white-50 fw-bold"
                    >Sign Up</RouterLink
                  >
                </p>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </section>
</template>

<script>
import axios from "axios";
// window.location.reload();
// response.setIntHeader("Refresh", 1);
// if (location.href.indexOf("reload") == -1) {
//   location.href = location.href + "?reload";
// }
export default {
  name: "loginView",
  data() {
    return {
      userData: "",
      role: "",
      count: 1,
      foo: true,
      model: {
        login: {
          email: "",
          password: "",
        },
      },
    };
  },
  mounted() {
    if (localStorage.getItem("reloaded")) {
      // The page was just reloaded. Clear the value from local storage
      // so that it will reload the next time this page is visited.
      localStorage.removeItem("reloaded");
    } else {
      // Set a flag so that we know not to reload the page twice.
      localStorage.setItem("reloaded", "1");
      location.reload();
    }
  },

  methods: {
    login() {
      axios
        .post("http://127.0.0.1:8000/api/login", this.model.login)
        .then((res) => {
          this.userData = res.data.user;
          if (res.status == "200") {
            alert("Login Successfully");
            location.reload();
            localStorage.setItem("id", res.data.user.id);
            localStorage.setItem("role", res.data.user.role);

            if (localStorage.getItem("role") == "admin") {
              this.$router.push({
                path: "/dashboard",
              });
            } else if (localStorage.getItem("role") == "customer") {
              this.$router.push({
                path: "/login",
              });
            }
          }
        });
    },
  },
};
</script>
