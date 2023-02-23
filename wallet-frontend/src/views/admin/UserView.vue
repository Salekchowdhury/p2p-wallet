<template>
<div class="container mt-5">
    <div class="card p-5">
        <div class="row">
            <div class="col-md-2 my-2">
                <RouterLink to="/dashboard" class="btn btn-primary btn-sm">Back</RouterLink>
            </div>
        </div>
        <div class="card-header">User</div>
        <div class="row">
            <div class="col-6 mt-3">
                <input disabled v-model="model.user.name" class="form-control" placeholder="name" />
            </div>
            <div class="col-6 mt-3">
                <input disabled v-model="model.user.email" class="form-control" placeholder="email" />
            </div>
            <div class="col-6 mt-3">
                <input disabled v-model="model.user.currency" class="form-control" placeholder="email" />
            </div>
            <div class="col-6 mt-3">
                <input disabled v-model="model.user.role" class="form-control" placeholder="email" />
            </div>
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
            id: "",
            model: {
                user: {
                    name: "",
                    email: "",
                    role: "",
                    currency: "",
                },
            },
        };
    },
    mounted() {
        this.id = this.$route.params.id;
        this.getUserData(this.id);
    },
    methods: {
        getUserData(userId) {
            axios.get(`http://127.0.0.1:8000/api/users/${userId}`).then((res) => {
                if (res.status == 200) {
                    this.model.user = res.data.user;
                }
            });
        },
    },
};
</script>
