<template>
<div class="container mt-5">
    <div class="card p-5">
        <div class="row">
            <div class="col-md-2 my-2">
                <RouterLink to="/dashboard" class="btn btn-primary btn-sm">Back</RouterLink>
            </div>
        </div>
        <div class="card-header">Edit User</div>
        <form>
            <div class="row">
                <div class="col-6 mt-3">
                    <input type="text" v-model="model.editData.name" class="form-control" placeholder="name" />
                </div>
                <div class="col-6 mt-3">
                    <input type="email" v-model="model.editData.email" class="form-control" placeholder="email" />
                </div>
                <div class="col-6 mt-3">
                    <select name="currency" @change="onChange($event)" class="form-select form-control">
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
                    <select name="role" @change="onChangeRole($event)" class="form-select form-control">
                        <option value="">-------Select Role-------</option>
                        <option value="admin">Admin</option>
                        <option value="customer">Customer</option>
                    </select>
                </div>
            </div>
            <button class="mt-2 btn btn-success btn-sm" type="button" @click="updateUser">
                Update
            </button>
        </form>
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
                editData: {
                    name: "",
                    email: "",
                    role: "",
                    currency: "",
                },
            },
            onChange(e) {
                this.model.editData.currency = e.target.value;
            },
            onChangeRole(e) {
                this.model.editData.role = e.target.value;
                console.log(this.model.editData);
            },
        };
    },
    mounted() {
        this.id = this.$route.params.id;
        this.getUserData(this.id);
    },
    methods: {
        getUserData(userId) {
            axios
                .get(`http://127.0.0.1:8000/api/users/${userId}/edit`)
                .then((res) => {
                    this.model.editData = res.data.user;
                });
        },
        updateUser() {
            axios
                .put(
                    `http://127.0.0.1:8000/api/users/${this.id}/edit`,
                    this.model.editData
                )
                .then((res) => {
                    if (res) {
                        alert(res.data.message);
                    }
                })
                .catch((e) => {
                    console.log("error from edit", e);
                });
        },
    },
};
</script>
