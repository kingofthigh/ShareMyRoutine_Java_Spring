<template>
  <div class="main-stream">
    <div class="border">
    <router-link class="each-post" :to="{name: 'post-detail', params: {post_id: post_id}}">
      <div class="user-id">{{ user_id }}</div><hr>
      <div class="post-content">{{ post_content }}</div><hr>
      <div class="post-im">{{ created_date }}</div>
    </router-link>
    </div>
  </div>
</template>

<script>
import moment from "moment";

export default {
  name: "eachPost",
  props: {
  post_id: Number,
  workpage_id: Number,
  user_id: String,
  post_img: String,
  post_content: String,
  created_date: Array,
  },
  methods:{
    formatDate(date) {
      return moment(date).format("YYYY/MM/DD");
    },
  }
};
</script>

<style scoped>

.border {
  border: solid 1px black;
  border-radius: 10px 10px 10px 10px;
  width: 160px;
  height: 200px;
  padding: 15px;
}
.each-post {
  text-decoration: none;
  color: black;
  
}
</style>
