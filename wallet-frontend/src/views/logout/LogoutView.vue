<template>
  <section class="vh-100 gradient-custom"></section>
</template>

<script>
import axios from "axios";

export default {
  name: "logoutView",

  mounted() {
    this.logout();
  },

  methods: {
    logout() {
      axios.get("http://127.0.0.1:8000/api/logout").then((res) => {
        // console.log(res);
        if (res.status == 200) {
          localStorage.removeItem("role");
          localStorage.removeItem("id");
          this.$router.push({
            path: "/login",
          });
        }
      });
    },
  },
};
</script>
