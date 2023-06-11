<template>
  <div class="mainborder">
    <h5>{{ workPage.memo }}</h5> <hr>
    <div class="registPost">
      <div class="regist_form">
        <label for="content">내용 작성</label><br />
        <b-form-textarea
          id="content"
          v-model="content"
          ref="content"
          rows="4"
          placeholder="내용을 입력해주세요"
        ></b-form-textarea>
        <b-button variant="primary" @click="registPost">등록</b-button>
      </div>
    </div>
  </div>
</template>

<script>
import { mapState } from "vuex";
export default {
  name: "PostCreate",
  props: {
    type: { type: String },
  },
  data() {
    return {
      content: "",
      img: "no",
    };
  },
  computed: {
    ...mapState(["workPage", "user"]),
  },
  created() {
    console.log(this.workPage.workpage_id);
  },
  methods: {
    registPost() {
      const newPost = {
        post_id: 0,
        user_id: this.user.user_id,
        post_content: this.content,
        post_img: this.img,
        workpage_id: this.workPage.workpage_id,
      };
      console.log(newPost);
      this.$store.dispatch("registPost", newPost);
      this.$router.push({ name: "post-detail", params: { post_id: newPost.post_id } });
    },
  },
};
</script>

<style>
.mainborder {
  width: 360px;
  height: 420px;
  margin: 100px auto;
  border: solid 1px lightgray;
  border-radius: 20px;
  padding: 20px;
  display: flex;
  flex-direction: column;
  justify-content: center;
  align-items: center;
}

.regist_form {
  width: 100%;
  max-width: 300px;
  margin-top: 20px;
}

.underline {
  text-decoration: underline;
}

label {
  display: block;
  margin-bottom: 5px;
}

textarea {
  width: 100%;
  padding: 10px;
  border: 1px solid lightgray;
  border-radius: 5px;
  resize: vertical;
}

button {
  margin-top: 10px;
  padding: 10px 20px;
}
</style>
