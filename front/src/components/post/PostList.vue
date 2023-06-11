<template>
  <div class="main-stream">
    <each-post
      class="popo"
      v-for="(post, index) in posts"
      :key="index"
      :post_id="post.post_id"
      :user_id="post.user_id"
      :post_content="post.post_content"
      :post_img="post.post_img"
      :workpage_id="post.workpage_id"
      :created_date="post.created_date"
    >
    </each-post>
  </div>
</template>

<script>
import { mapGetters } from "vuex";
import eachPost from "@/components/post/include/eachPost.vue";

export default {
  name: "PostDetail",
  components: {
    eachPost,
  },
  computed: {
    ...mapGetters(["posts"]),
  },
  created() {
    this.$store.dispatch("getAllPost");
  },
};
</script>

<style scoped>
.main-stream {
  width: 1000px;
  margin: 50px auto;
  display: flex;
  flex-direction: row;
  justify-content: space-around;
  flex-wrap: wrap;
}
.popo {
  width: 200px;
}
</style>
