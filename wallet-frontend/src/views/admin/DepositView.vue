<template>
  <div class="container mt-5">
    <div class="card p-5">
      <div class="row">
        <!-- <div class="col-md-2 my-2">
        
          <RouterLink to="/dashboard" class="btn btn-primary btn-sm"
            >Back</RouterLink
          >
        </div> -->
      </div>
      <div class="card-header">SEND MONEY</div>
      <div class="row">
        <div class="col-md-4">
          <ul v-for="(error, index) in this.errors" :key="index">
            <li class="alert-warning">
              <p class="text-danger">{{ error }}</p>
            </li>
          </ul>
        </div>
      </div>
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
                disabled
                v-model="model.deposit.name"
                class="form-control"
                placeholder="name"
              />
            </div>
            <div class="col-6 mt-3">
              <input
                type="email"
                disabled
                v-model="model.deposit.email"
                class="form-control"
                placeholder="email"
              />
            </div>
            <div class="col-6 mt-3">
              <input
                type="number"
                required
                v-model="model.deposit.balance"
                class="form-control"
                placeholder="balance"
              />
            </div>
          </div>
          <button
            class="mt-2 btn btn-success btn-sm"
            type="button"
            @click="DepositAmount"
          >
            Send
          </button>
        </form>
      </div>
    </div>
  </div>
</template>

<script>
import axios from "axios";
export default {
  name: "depositView",
  id: "",
  data() {
    return {
      text: "",
      errors: [],
      model: {
        deposit: {
          name: "",
          email: "",
          currency: "",
          receiver_id: "",
          sender_id: "",
          balance: "",
          cash_in: "in",
          cash_out: "out",
        },
      },
    };
  },
  mounted() {
    this.model.deposit.receiver_id = this.$route.params.id;
    this.id = this.$route.params.id;
    this.getUserData(this.id);
    this.model.deposit.sender_id = localStorage.getItem("id");
    console.log(this.model.deposit);
  },
  methods: {
    getUserData(userId) {
      axios
        .get(`http://127.0.0.1:8000/api/users/${userId}/edit`)
        .then((res) => {
          this.model.deposit = res.data.user;
        });
    },
    DepositAmount() {
      axios
        .post(
          "http://127.0.0.1:8000/api/deposit",
          {
            receiver_id: this.$route.params.id,
            sender_id: localStorage.getItem("id"),
            cash_in: "in",
            cash_out: "out",
            currency: this.model.deposit.currency,
            balance: this.model.deposit.balance,
          },
          {
            headers: {
              "Access-Control-Allow-Origin": "*",
              "Access-Control-Allow-Methods":
                "GET, POST, PATCH, PUT, DELETE, OPTIONS",
              "Access-Control-Allow-Headers":
                "Origin, Content-Type, X-Auth-Token",
            },
          }
        )
        .then((res) => {
          if (res.data.status == 200) {
            this.errors = "";
            alert("Deposit Data Successfully");
          } else if (res.data.status == 422) {
            this.errors = res.data.errors;
          }
        })
        .catch((err) => {
          console.log(err.response);
        });
    },
  },
};
</script>
