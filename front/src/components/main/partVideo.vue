<template>
  <div>
    <div class="btn-container">
      <b-button variant="primary" @click="changeCategory('가슴')"
        >가슴</b-button
      >
      <b-button variant="primary" @click="changeCategory('등')">등</b-button>
      <b-button variant="primary" @click="changeCategory('어깨')"
        >어깨</b-button
      >
      <b-button variant="primary" @click="changeCategory('하체')"
        >하체</b-button
      >
    </div>
    <div class="container">
      <router-link
        class="noUnderline"
        v-for="(video, index) in partvideos"
        :key="index"
        :to="'/video/' + video.video_id"
      >
        <each-part-video
          :video_id="video.video_id"
          :video_title="video.video_title"
          :channel_name="video.channel_name"
          :view_cnt="video.view_cnt"
          :category="video.category"
        />
      </router-link>
    </div>
  </div>
</template>

<script>
import { mapState } from "vuex";
import eachPartVideo from "./include/eachPartVideo.vue";

export default {
  name: "partVideo",
  data() {
    return {
      category: "가슴",
    };
  },
  components: {
    eachPartVideo,
  },
  computed: {
    ...mapState(["partvideos"]),
  },
  methods: {
    changeCategory(newCategory) {
      this.category = newCategory;
      this.$store.dispatch("getPartVideos", this.category);
    },
  },
  created() {
    this.$store.dispatch("getPartVideos", this.category);
  },
};
</script>

<style scoped>
.noUnderline {
  text-decoration: none;
}
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

.btn-container {
  margin-top: 15px;
  margin-bottom: 20px;
}
</style>
