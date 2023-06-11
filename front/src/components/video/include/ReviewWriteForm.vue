<template>
  <div>
    <div class="card writeForm">
      <div class="card-body">
        <label for="review_content"></label>
        <b-form-textarea
          id="review_content"
          v-model="review_content"
          placeholder="댓글 작성"
          @keyup.enter="registReview"
        ></b-form-textarea>
        <b-button v-if="isLoggedIn" variant="primary" @click="registReview"
          >등록</b-button
        >
        <b-button v-else variant="primary" @click="redirectToLoginForm"
          >로그인 후 사용하세요</b-button
        >
      </div>
    </div>
  </div>
</template>

<script>
export default {
  name: "ReviewWriteForm",
  data() {
    return {
      review_content: "",
      video_id: this.$route.params.video_id,
      user_id: "",
    };
  },
  computed: {
    isLoggedIn() {
      return this.$store.state.isAuthenticated;
    },
    user() {
      return this.$store.state.user;
    },
  },
  methods: {
    registReview() {
      if (this.review_content === "") {
        alert("내용을 입력해주세요!");
      } else {
        let newReview = {
          review_content: this.review_content,
          video_id: this.video_id,
          user_id: this.user.user_id,
        };
        this.$store.dispatch("registReview", newReview);
        this.review_content = ""; // 입력 필드를 빈 문자열로 설정
      }
    },
    redirectToLoginForm() {
      // 로그인 페이지로 이동하기 전에 현재 경로를 저장
      this.$store.commit("SET_PREVIOUS_PATH", this.$route.fullPath);
      this.$router.push("/user/login"); // LoginForm.vue로 이동
    },
  },
};
</script>

<style scoped>
.writeForm {
  max-width: 820px;
  margin: 15px auto;
}

.card-body {
  padding: 20px 40px;
}

.input {
  width: 500px;
  height: 70px;
  margin-right: 20px;
}

.card-footer {
  display: flex;
  justify-content: flex-end;
}
</style>
