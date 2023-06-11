<template>
  <div class="regist">
    <h1 v-if="type === 'login'" class="underline">로그인</h1>
    <div class="regist_form">
      <label for="user.user_id">아이디</label>
      <input
        type="text"
        id="user.user_id"
        name="user.user_id"
        v-model="user.user_id"
        ref="user.user_id"
        placeholder="아이디"
        @keyup.enter="login"
      />
      <label for="user.user_password">비밀번호</label>
      <input
        type="password"
        id="user.user_password"
        name="user.user_password"
        v-model="user.user_password"
        ref="user.user_password"
        placeholder="비밀번호"
        @keyup.enter="login"
      /><br />
      <button v-if="type === 'login'" @click="login">로그인</button>
      <!-- <button v-if="type === 'modify'" @click="updateMovie">수정</button> -->
      <button @click="moveList">목록</button>
    </div>
  </div>
</template>

<script>
export default {
  name: "LoginForm",
  props: {
    type: String,
  },
  data() {
    return {
      user: {
        user_id: "",
        user_password: "",
      },
    };
  },
  methods: {
    login() {
      this.$store.dispatch("userLogin", this.user).then(() => {
        // After login, redirect to the previous path
        if (sessionStorage.getItem("access-token") !== null) {
          this.$router.push(this.$store.state.previousPath || "/");
        }
      });
    },

    moveList() {
      this.$router.push("/");
    },
  },
};
</script>

<style scoped>
.regist {
  padding: 10px;
  margin: 0 auto;
}
.regist_form {
  text-align: left;
  border-radius: 5px;
  background-color: #f2f2f2;
  padding: 20px;
}
input,
textarea,
.view {
  width: 100%;
  padding: 12px 20px;
  margin: 8px 0;
  display: inline-block;
  border: 1px solid #ccc;
  border-radius: 4px;
  box-sizing: border-box;
  color: #787878;
  font-size: medium;
}
</style>
