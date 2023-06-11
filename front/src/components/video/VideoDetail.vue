<template>
  <div>
    <div class="container mt-4">
      <div class="row">
        <div class="col-md-8 offset-md-2">
          <b-card class="video-container p-4">
            <div class="video-box mb-4">
              <iframe
                class="video"
                :src="`https://www.youtube.com/embed/${this.video_id}`"
                width="100%"
                height="480"
              >
                <p>사용 중인 브라우저는 iframe을 지원하지 않습니다.</p>
              </iframe>
            </div>
            <h3>{{ video.video_title }}</h3>
            <div class="d-flex justify-content-between align-items-center">
              <span class="category badge badge-warning">{{
                video.category
              }}</span>
              <span>조회수 {{ video.view_cnt }}</span>
              <span @click="toggleLike" class="username-link"
                >좋아요 {{ this.videoLikeCnt }}</span
              >
            </div>
          </b-card>
        </div>
      </div>
    </div>
    <review-write-form />
    <review-part :reviews="reviews"></review-part>
  </div>
</template>

<script>
import ReviewPart from "./include/ReviewPart.vue";
import ReviewWriteForm from "./include/ReviewWriteForm.vue";
import { mapState } from "vuex";

export default {
  components: {
    ReviewPart,
    ReviewWriteForm,
  },
  data() {
    return {
      video_id: this.$route.params.video_id,
    };
  },
  computed: {
    ...mapState(["video", "reviews", "videoLikeInfo"]),
    videoLikeCnt() {
      return this.videoLikeInfo.length;
    },
    isLiked() {
      return this.videoLikeInfo.some(
        (like) => like.user_id === this.$store.state.user.user_id
      );
    },
  },
  created() {
    console.log(this.videoLikeInfo.length)
    this.$store.dispatch("getDetailVideo", this.video_id);
  },
  methods: {
    toggleLike() {
      if (this.$store.state.isAuthenticated) {
        if (!this.isLiked) {
          // isLiked는 해당 비디오를 사용자가 좋아하는지 여부를 나타내는 변수입니다.
          this.$store.dispatch("addLike", {
            user_id: this.$store.state.user.user_id,
            video_id: this.video_id,
          });
        } else {
          this.$store.dispatch("deleteLike", {
            user_id: this.$store.state.user.user_id,
            video_id: this.video_id,
          });
        }
      } else {
        alert("로그인 후 가능합니다.");
      }
    },
  },
};
</script>

<style scoped>
.username-link {
  cursor: pointer;
  text-decoration: none;
  color: black;
}
.category {
  border-radius: 28% 28% 28% 28% / 40% 40% 40% 40%;
  font-size: 17px;
  font-weight: 600;
}

.video-container {
  border: solid 0.5px black;
  padding: 20px;
}

.video-box {
  text-align: center;
}

.video {
  width: 100%;
  height: 480px;
}
</style>
