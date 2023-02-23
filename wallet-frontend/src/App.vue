<!-- <script> -->

<!-- </script> -->
import { RouterLink, RouterView } from "vue-router"; import HelloWorld from
"./components/HelloWorld.vue";
<template>
  <header>
    <div class="wrapper">
      <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
        <div class="container-fluid">
          <RouterLink class="navbar-brand" to="/">Logo</RouterLink>

          <button
            class="navbar-toggler"
            type="button"
            data-bs-toggle="collapse"
            data-bs-target="#navbarSupportedContent"
            aria-controls="navbarSupportedContent"
            aria-expanded="false"
            aria-label="Toggle navigation"
          >
            <span class="navbar-toggler-icon"></span>
          </button>
          <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul
              v-if="model.sessionData.role == 'super-admin'"
              class="navbar-nav mb-2 ms-auto mb-lg-0"
            >
              <li class="nav-item">
                <RouterLink
                  class="nav-link active"
                  aria-current="page"
                  to="/dashboard"
                  >Dashboard</RouterLink
                >
              </li>
              <li class="nav-item">
                <RouterLink class="nav-link" aria-current="page" to="/logout"
                  >Logout</RouterLink
                >
              </li>
            </ul>
            <ul
              v-if="model.sessionData.role == 'customer'"
              class="navbar-nav mb-2 ms-auto mb-lg-0"
            >
              <li class="nav-item">
                <RouterLink
                  class="nav-link active"
                  aria-current="page"
                  to="/users/list"
                  >Home</RouterLink
                >
              </li>
              <li class="nav-item">
                <RouterLink class="nav-link" aria-current="page" to="/logout"
                  >Logout</RouterLink
                >
              </li>
            </ul>
          </div>
        </div>
      </nav>
    </div>
  </header>

  <RouterView />
</template>

<script>
export default {
  name: "app",
  data() {
    return {
      model: {
        sessionData: {
          id: localStorage.getItem("id"),
          role: localStorage.getItem("role"),
        },
      },
    };
  },
};
</script>

<style scoped></style>
