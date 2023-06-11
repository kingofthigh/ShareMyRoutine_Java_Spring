<template>
  <div class="container" v-if="isAuthenticated">
    <router-link
      class="href"
      v-for="(video, index) in videos"
      :key="index"
      :to="'/video/' + video.video_id"
    >
      <eachVideo
        :video_id="video.video_id"
        :video_title="video.video_title"
        :channel_name="video.channel_name"
        :view_cnt="video.view_cnt"
        :category="video.category"
      />
    </router-link>
  </div>
</template>

<script>
import { mapState } from "vuex";
import eachVideo from "../main/include/eachVideo.vue";

export default {
  name: "recommendVideo",
  components: {
    eachVideo,
  },
  computed: {
    ...mapState(["videos", "user", "isAuthenticated"]),
  },
  created() {
    if (this.isAuthenticated) {
      this.$store.dispatch("getVideos", this.user);
    }
  },
};
</script>

<style scoped>
.container {
  width: 4000px;
  display: flex;
  flex-direction: row;
  justify-content: space-between;
  overflow: scroll;
}
.href {
  text-decoration: none;
}
</style>
