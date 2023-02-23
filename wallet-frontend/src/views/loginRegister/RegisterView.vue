<template>
  <section class="vh-100 gradient-custom">
    <div class="container py-5 h-100">
      <div class="row d-flex justify-content-center align-items-center h-100">
        <div class="col-12 col-md-8 col-lg-6 col-xl-5">
          <div class="card bg-dark text-white" style="border-radius: 1rem">
            <div class="card-body p-5 text-center">
              <div class="mb-md-5 mt-md-4 pb-5">
                <div class="row">
                  <div class="col-md-12">
                    <ul v-for="(error, index) in this.errors" :key="index">
                      <li class="alert-warning">
                        <p class="text-danger">{{ error }}</p>
                      </li>
                    </ul>
                  </div>
                </div>
                <h2 class="fw-bold mb-2 text-uppercase">Create Account</h2>
                <div class="form-outline form-white mb-4">
                  <input
                    v-model="model.registerData.name"
                    type="text"
                    name="name"
                    class="form-control form-control-lg"
                    placeholder="Name.."
                  />
                </div>
                <div class="form-outline form-white mb-4">
                  <input
                    v-model="model.registerData.email"
                    type="email"
                    id="typeEmailX"
                    name="email"
                    class="form-control form-control-lg"
                    placeholder="Email..."
                  />
                </div>

                <div class="form-outline form-white mb-4">
                  <input
                    v-model="model.registerData.password"
                    type="password"
                    name="password"
                    id="typePasswordX"
                    class="form-control form-control-lg"
                    placeholder="Password..."
                  />
                </div>

                <button
                  @click="createAccount"
                  class="btn btn-outline-light btn-lg px-5"
                  type="submit"
                >
                  Sign Up
                </button>
              </div>
              <div>
                <p class="mb-0">
                  Have an account?
                  <RouterLink to="/login" class="text-white-50 fw-bold"
                    >Sign in</RouterLink
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
export default {
  name: "registerView",
  data() {
    return {
      errors: [],
      model: {
        registerData: {
          name: "",
          email: "",
          password: "",
        },
      },
    };
  },
  methods: {
    createAccount() {
      axios
        .post("http://127.0.0.1:8000/api/register", this.model.registerData)
        .then((res) => {
          if (res.data.success) {
            this.errors = "";
            alert(res.data.success);
          } else if ((res.data.status = 422)) {
            this.errors = res.data.errors;
          }
        });
    },
  },
};
</script>
