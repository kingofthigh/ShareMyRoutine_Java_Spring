<template>
  <div class="container" v-if="isAuthenticated">
    <div class="video-container" v-if="likevideos && likevideos.length > 0">
      <div v-for="(video, index) in likevideos" :key="index">
        <router-link class="href" :to="'/video/' + video.video_id">
          <eachLikeVideo
            :video_id="video.video_id"
            :video_title="video.video_title"
            :channel_name="video.channel_name"
            :view_cnt="video.view_cnt"
            :category="video.category"
          />
        </router-link>
      </div>
    </div>
    <div v-else class="empty-message">
      <h1>아직 '좋아요'하신 영상이 없습니다.</h1>
    </div>
  </div>
</template>

<script>
import { mapState } from "vuex";
import eachLikeVideo from "../main/include/eachLikeVideo.vue";

export default {
  name: "LikeVideo",
  props: {
    userId: String, // Add props
  },
  components: {
    eachLikeVideo,
  },
  computed: {
    ...mapState(["likevideos", "isAuthenticated"]),
  },
  created() {
    if (this.isAuthenticated) {
      this.$store.dispatch("getLikeVideos", this.userId);
    }
  },
};
</script>

<style scoped>
.container {
  width: 100%;
  height: 100%;
  display: flex;
  flex-direction: row;
  justify-content: flex-start;
  align-items: center;
  overflow: auto;
  padding: 0 20px;
  flex-wrap: nowrap;
}
.video-container {
  display: flex;
  flex-direction: row;
  justify-content: space-between;
  overflow: auto;
  padding: 0 20px; /* left and right padding */
}
.empty-message {
  width: 100%;
  text-align: center;
}
.href {
  text-decoration: none;
}
</style>
