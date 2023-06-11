<template>
  <div class="mid-container" v-if="!isAuthenticated">
    <router-link
      class="href"
      v-for="(video, index) in allvideos"
      :key="index"
      :to="'/video/' + video.video_id"
    >
      <eachAllVideo
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
import eachAllVideo from "../main/include/eachAllVideo.vue";

export default {
  name: "recommendVideo",
  components: {
    eachAllVideo,
  },
  computed: {
    ...mapState(["allvideos", "isAuthenticated"]),
  },
  created() {
    if (!this.isAuthenticated) {
      this.$store.dispatch("getAllVideos");
    }
  },
};
</script>

<style scoped>
.mid-container {
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
