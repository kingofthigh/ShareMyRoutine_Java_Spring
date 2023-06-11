<template>
  <div class="pb-4">
    <div v-for="(review, index) in reviews" :key="index" class="mb-4">
      <div class="card each-review">
        <div class="card-header top">
          <span>
            <router-link
              :to="'/user/mypage/' + review.user_id"
              class="username-link"
            >
              {{ review.user_id }}
            </router-link>
          </span>
          <span
            >마지막 작성(수정)일 {{ formatDate(review.modified_date) }}</span
          >
        </div>
        <div class="card-body">{{ review.review_content }}</div>
        <div class="card-footer">
          <b-button
            v-if="review.user_id === $store.state.user.user_id"
            variant="danger"
            @click="confirmDelete(review)"
          >
            삭제
          </b-button>
          <b-button
            v-if="review.user_id === $store.state.user.user_id"
            variant="primary"
            @click="editReview(review)"
          >
            수정
          </b-button>
        </div>
      </div>
    </div>
    <div v-if="editingReview">
      <div class="card writeForm">
        <div class="card-body">
          <label for="review_content"></label>
          <b-form-textarea
            id="review_content"
            v-model="editingReview.review_content"
            placeholder="댓글 작성"
            @keyup.enter="updateReview"
          ></b-form-textarea>
        </div>
        <div class="card-footer">
          <b-button class="mr-2" variant="success" @click="updateReview"
            >수정 완료</b-button
          >
          <b-button variant="secondary" @click="editingReview = null"
            >취소</b-button
          >
        </div>
      </div>
    </div>
  </div>
</template>

<script>
import moment from "moment";

export default {
  name: "ReviewPart",
  props: {
    reviews: {
      type: Array,
      required: true,
    },
  },
  data() {
    return {
      editingReview: null, // 현재 수정 중인 리뷰 정보
    };
  },
  methods: {
    formatDate(date) {
      return moment(date).format("YYYY/MM/DD HH:mm");
    },
    confirmDelete(review) {
      if (confirm("정말 삭제하시겠습니까?")) {
        this.deleteReview(review);
      }
    },
    deleteReview(review) {
      this.$store.dispatch("deleteReview", review);
      alert("삭제되었습니다.");
    },
    editReview(review) {
      // 리뷰 수정 버튼 클릭 시 호출되는 메소드
      this.editingReview = { ...review };
    },
    updateReview() {
      this.$store.dispatch("updateReview", this.editingReview);
      this.editingReview = null;
      alert("수정이 완료되었습니다.");
    },
    getUserProfileLink(user_id) {
      return { name: "mypage", params: { user_id: user_id } };
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
.each-review {
  max-width: 800px;
  margin: 0 auto;
}

.card-header {
  display: flex;
  justify-content: space-between;
}

.writeForm {
  max-width: 800px;
  margin: 0 auto;
}
</style>
