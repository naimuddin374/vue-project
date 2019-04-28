<template>
  <div class="container">
    <br>
    <div class="row justify-content-center">
      <div class="col-md-12">
        <div class="row">
          <div class="col-md-3"><input type="text" class="form-control" @keyup="userSerach" v-model="search.name" placeholder="Search for user name"></div>
          <div class="col-md-3"><input type="text" class="form-control" @keyup="userSerach" v-model="search.email" placeholder="Search for user email"></div>
          <div class="col-md-3"><input type="text" class="form-control" @keyup="userSerach" v-model="search.contact_no" placeholder="Search for user phone number"></div>
          <div class="col-md-3"><input type="text" class="form-control" @keyup="userSerach" v-model="search.address" placeholder="Search for user address"></div>
        </div><br>

        <div class="row">
          <div class="col-md-12 text-right">
            <button type="button" class="btn btn-info" data-toggle="modal" data-target="#insertUserModel">Add New</button>
          </div>
        </div>

        <p class="alert alert-success" v-if="success.length > 0">{{ success }}</p>
        <table class="table">
          <thead class="thead-dark">
            <tr>
              <th>ID</th>
              <th scope="col">Image</th>
              <th scope="col">Name</th>
              <th scope="col">Email Address</th>
              <th scope="col">Phone Number</th>
              <th scope="col">Address</th>
              <th scope="col">Action</th>
            </tr>
          </thead>
          <tbody>
            <tr v-for="data in all_data.data">
              <th>{{data.id}}</th>
              <th>
                <img v-if="data.image" :src="data.image" class="img-responsive" width="100">
                <img v-else src="images/no_image.jpg" class="img-responsive" width="100">
              </th>
              <td>{{data.name}}</td>
              <td>{{data.email}}</td>
              <td>{{data.contact_no}}</td>
              <td>{{data.address}}</td>
              <td>
                <a href="#" class="btn btn-primary" data-toggle="modal" data-target="#editUserModel" @click="editSelUser(data.id)">Edit</a>
                <a href="#" class="btn btn-danger" @click="deleteUser(data.id)">Delete</a>
              </td>
            </tr>

            <pagination :data="all_data" @pagination-change-page="getResults"></pagination> 
          </tbody>
        </table>
      </div>
    </div>
    <div id="popupModel">
      <addUser @addednewuser="refreshRecord"></addUser>
      <editUser :rec="editSelUserData" @updateUserData="refreshRecord"></editUser>
    </div>
  </div>
</template>

<script type="text/javascript">
import Vue from 'vue';
Vue.component('pagination', require('laravel-vue-pagination'));
Vue.component('addUser', require('./AddUserModal.vue'));
Vue.component('editUser', require('./EditUserModal.vue'));

export default{
  data(){
    return{
      all_data:{},
      editSelUserData:{},
      success:'',
      search:{
        'name': '',
        'email': '',
        'contact_no': '',
        'address': '',
      },
    }
  },
  methods:{
    getResults(page = 1) {
      axios.get('users?page=' + page)
      .then(response => {
        this.all_data = response.data
      })
      .catch((error) => console.log(error))
    },
    refreshRecord(record){
      this.all_data = record.data
    },
    editSelUser(id){
      axios.get('/editeuser/'+id)
      .then(response => {
        this.editSelUserData = response.data[0]
      })
      .catch((error) => console.log(error))
    },
    deleteUser(id){
      const reply = confirm('Are you sure, you want to delete this user ?');
      if(reply){
        axios.get('/deleteuser/'+id)
        .then(response => {
          this.success = 'User delete successfully!!!';
          this.refreshRecord(response);
        })
        .catch((error) => console.log(error))
      }
    },
    userSerach(){
      if((this.search.name.length > 0) || (this.search.email.length > 0) || (this.search.contact_no.length > 0) || (this.search.address.length > 0)){
        axios.post('/usersearch', this.search)
        .then(response => {
          this.all_data = response;
        })
        .catch((error) => console.log(error))
      }else{
        this.getResults();
      }
    }
  },
  created(){
    axios.get('/users')
    .then(response => this.refreshRecord(response))
    .catch((error) => console.log(error))
  }
};
</script>
