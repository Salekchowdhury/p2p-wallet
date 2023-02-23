<template>
  <div class="container mt-5">
    <div class="card p-5">
      <div class="row">
        <div class="col-md-2 my-2">
          <RouterLink to="/dashboard" class="btn btn-primary btn-sm"
            >Back</RouterLink
          >
        </div>
      </div>
      <div class="card-header">Add User</div>

      <div class="card-body">
        <div class="row">
          <div class="col-md-4">
            <ul v-for="(error, index) in this.errors" :key="index">
              <li class="alert-warning">
                <p class="text-danger">{{ error }}</p>
              </li>
            </ul>
          </div>
        </div>

        <form>
          <div class="row">
            <div class="col-6 mt-3">
              <input
                type="text"
                v-model="model.storData.name"
                class="form-control"
                placeholder="name"
              />
            </div>
            <div class="col-6 mt-3">
              <input
                type="email"
                v-model="model.storData.email"
                class="form-control"
                placeholder="email"
              />
            </div>
            <div class="col-6 mt-3">
              <input
                type="password"
                v-model="model.storData.password"
                class="form-control"
                placeholder="password"
              />
            </div>
            <div class="col-6 mt-3">
              <select
                name="currency"
                @change="onChange($event)"
                class="form-select form-control"
              >
                <option value="">-------Select Currency-------</option>
                <option value="usd">USD</option>
                <option value="eur">EUR</option>
                <option value="cad">CAD</option>
                <option value="Aud">AUD</option>
                <option value="rub">RUB</option>
                <option value="bdt">BDT</option>
              </select>
            </div>
            <div class="col-6 mt-3">
              <select
                name="role"
                @change="onChangeRole($event)"
                class="form-select form-control"
              >
                <option value="">-------Select Role-------</option>
                <option value="admin">Admin</option>
                <option value="customer">Customer</option>
              </select>
            </div>
          </div>
          <button
            class="mt-2 btn btn-success btn-sm"
            type="button"
            @click="CreateUser"
          >
            Submit
          </button>
        </form>
      </div>
    </div>
  </div>
</template>
<script>
import axios from "axios";
export default {
  name: "userEditView",
  data() {
    return {
      text: "",
      errors: [],
      model: {
        storData: {
          name: "",
          email: "",
          password: "",
          role: "",
          currency: "",
        },
      },
      onChange(e) {
        this.model.storData.currency = e.target.value;
      },
      onChangeRole(e) {
        this.model.storData.role = e.target.value;
        console.log(this.model.editData);
      },
    };
  },
  mounted() {},
  methods: {
    CreateUser() {
      axios
        .post(`http://127.0.0.1:8000/api/users`, this.model.storData)
        .then((res) => {
          if (res.data.errors) {
            this.errors = res.data.errors;
            console.log(this.errors);
          }
        })
        .catch(function (error) {
          if (error.res) {
            colsole.log(error.res.data);
          }
        });
    },
  },
};
</script>
