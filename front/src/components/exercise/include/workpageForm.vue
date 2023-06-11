<template>
  <div>
    <button class="btn btn-primary" @click="openModal">운동하기</button>

    <!-- 회원가입 모달 -->
    <div class="modal" tabindex="-1" role="dialog" :class="{ 'd-block': showModal }">
      <div class="modal-dialog" role="document">
        <div class="modal-content">
          <div class="modal-header">
            <h5 class="modal-title">오늘의 운동 메모</h5>
            <button type="button" class="close" @click="closeModal">
              <span>&times;</span>
            </button>
          </div>
          <div class="modal-body">
            <form>
              <div class="form-group">
                <label for="id">오늘의 운동</label><br />
                <select name="part" v-model="part">
                  <option value="">운동 부위 선택</option>
                  <option value="1">가슴</option>
                  <option value="2">등</option>
                  <option value="3">하체</option>
                  <option value="4">어깨</option>
                </select>
                <input type="textarea" class="form-control" id="id" v-model="memo" />
              </div>
            </form>
          </div>
          <div class="modal-footer">
            <button type="button" class="btn btn-secondary" @click="closeModal">
              취소
            </button>
            <button type="button" class="btn btn-primary" @click="registerWorkPage">
              등록
            </button>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
import { mapState } from "vuex";

export default {
  name: "WorkPageForm",
  data() {
    return {
      showModal: false,
      memo: "",
      part: "",
    };
  },
  computed: {
    ...mapState(["user"]),
  },
  methods: {
    openModal() {
      this.showModal = true;
    },
    closeModal() {
      this.showModal = false;
    },

    registerWorkPage() {
      if (this.part == "") {
        alert("메인 운동 부위를 선택해주세요");
      } else {
        this.$store.dispatch("registWorkPage", {
          workpage_id: 0,
          user_id: this.user.user_id,
          memo: this.memo,
          part_id: this.part,
        });
        this.closeModal();
      }
      this.memo = "";
    },
  },
};
</script>

<style>
.modal {
  display: none;
}
</style>
