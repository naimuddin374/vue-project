<template>
  <div id="editUserModel" class="modal fade" role="dialog">
    <div class="modal-dialog">

      <div class="modal-content">
        <div class="modal-header">
          <h4 class="modal-title">Add new user</h4>
          <button type="button" class="close" data-dismiss="modal" @click="clearError">&times;</button>
        </div>
        <div class="modal-body">
          <p class="alert alert-success" v-if="success.length > 0">{{ success }}</p>
          <p class="alert alert-danger" v-if="error.length > 0">{{ error }}</p>
          <form @submit.prevent="updateData" method="post">
            <div class="form-group">
              <label>Full Name<span style="color:red;">*</span></label>
              <input type="text" v-model="rec.name" class="form-control" placeholder="Enter full name">
              <p class="alert-danger alert" v-for="err of error.name">{{ err }}</p>
            </div>

            <div class="form-group">
              <label>Email address<span style="color:red;">*</span></label>
              <input type="email" v-model="rec.email" class="form-control" placeholder="Enter email">
              <p class="alert-danger alert" v-for="err of error.email">{{ err }}</p>
            </div>

            <div class="form-group">
              <label>Contact Number<span style="color:red;">*</span></label>
              <input type="number" v-model="rec.contact_no" class="form-control" placeholder="Enter contact number">
              <p class="alert-danger alert" v-for="err of error.contact_no">{{ err }}</p>
            </div>

            <div class="form-group">
              <label>Address<span style="color:red;">*</span></label>
              <input type="text" v-model="rec.address" class="form-control" placeholder="Enter address">
            </div>

            <div class="form-group">
              <label>Image</label>
              <input type="file" v-on:change="onFileChange" class="form-control">
            </div>

            <div class="form-group">
              <img v-if="rec.image" :src="rec.image" class="img-responsive" width="150">
              <img v-else src="images/no_image.jpg" class="img-responsive" width="150">
            </div>


            <button type="submit" class="btn btn-primary" @click="updateData">Submit</button>
          </form>
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-default" data-dismiss="modal" @click="clearError">Close</button>
        </div>
      </div>
    </div>
  </div>
</template>

<script type="text/javascript">
export default{
  props:['rec'],
  data(){
    return{
      success:'',
      error:[],
      image:'',
    }
  },
  methods:{
    updateData(){
      axios.post('/storeuser', this.rec)
      .then(response => {
        this.$emit('updateUserData', response);
        this.success = 'User update successfully!!!';
        // console.log(response);
      })
      .catch(error => this.error = error.response.data.errors)
    },
    onFileChange(e) {
      let files = e.target.files || e.dataTransfer.files;
      if (!files.length)
        return;
      this.createImage(files[0]);
    },
    createImage(file) {
      let reader = new FileReader();
      let vm = this.rec;
      reader.onload = (e) => {
        vm.image = e.target.result;
      };
      reader.readAsDataURL(file);
    },
    clearError(){
      this.success='';
      this.error=[];
    }
  },
};
</script>


