<template>
  <b-card class="eachVideo">
    <b-card-img
      class="b-card-img"
      :src="`https://img.youtube.com/vi/${video_id}/mqdefault.jpg`"
      alt="Image"
      top
    ></b-card-img>
    <b-card-title class="video-title">{{ video_title }}</b-card-title>
    <hr />
    <b-card-text class="channel-name">{{ channel_name }}</b-card-text>
    <div class="bottom">
      <b-badge class="category">{{ category }}</b-badge>
      <b-card-text>조회수 {{ view_cnt }}</b-card-text>
    </div>
  </b-card>
</template>

<script>
export default {
  name: "eachVideo",
  props: {
    video_id: String,
    video_title: String,
    channel_name: String,
    category: String,
    view_cnt: Number,
  },
};
</script>

<style scoped>
.eachVideo {
  width: 300px;
  text-decoration: none;
  color: black;
}

.b-card-img {
  height: 180px;
  margin-bottom: 5px;
}
.bottom {
  display: flex;
  justify-content: space-between;
}

.category {
  border-radius: 25% 25% 25% 25% / 50% 50% 50% 50%;
  background-color: black;
  color: white;
  padding-top: 5px;
}

.eachVideo {
  font-size: 12px;
}

.video-title {
  font-size: 16px;
  font-weight: 600;
  height: 40px;
  overflow: hidden;
  /* text-overflow: ellipsis; */
  white-space: wrap;
  word-break: break-all;
}
</style>
