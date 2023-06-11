<template>
  <div class="main-stream">
    <span v-if="isAuthenticated" class="recommend">추천 운동 영상</span>
    <span v-if="!isAuthenticated" class="recommend">전체 운동 영상</span>
    <hr />
    <recommend-video></recommend-video>
    <all-video></all-video>
    <span class="parttitle">부위별 운동 영상</span>
    <hr />
    <part-video></part-video>
  </div>
</template>

<script>
import recommendVideo from "@/components/main/recommendVideo.vue";
import partVideo from "@/components/main/partVideo.vue";
import { mapState } from "vuex";
import AllVideo from "@/components/main/AllVideo.vue";

export default {
  name: "HomeView",
  components: {
    recommendVideo,
    partVideo,
    AllVideo,
  },
  computed: {
    ...mapState(["isAuthenticated"]),
  },
};
</script>

<style scoped>
.main-stream {
  margin: 0 auto;
  width: 1200px;
}
.recommend,
.parttitle {
  display: block;
  margin-top: 40px;
  margin-bottom: 10px;
  padding-left: 10px;
  background-color: deepskyblue;
  color: white;
  font-weight: 800;
  border-radius: 17px 17px 17px 17px;
  font-size: 40px;
  padding-top: 6px;
}
</style>
