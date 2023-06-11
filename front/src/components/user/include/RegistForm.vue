<template>
  <div class="regist">
    <h1 v-if="type === 'regist'" class="underline">회원가입</h1>
    <div class="regist_form">
      <label for="user_id">아이디</label>
      <input
        type="text"
        id="user_id"
        name="user_id"
        v-model="user_id"
        ref="user_id"
      />
      <label for="user_password">비밀번호</label>
      <input
        type="password"
        id="user_password"
        name="user_password"
        v-model="user_password"
        ref="user_password"
      />
      <label for="email">e-mail</label>
      <input type="text" id="email" name="email" v-model="email" ref="email" />
      <label for="gender">성별</label>
      <div style="display: flex; width: 100%">
        <label>
          <input type="radio" name="gender" value="남자" v-model="gender" />
          남자
        </label>
        <label>
          <input type="radio" name="gender" value="여자" v-model="gender" />
          여자
        </label>
      </div>
      <br />
      <label for="height">키</label>
      <input
        type="text"
        id="height"
        name="height"
        v-model="height"
        ref="height"
      />
      <label for="weight">몸무게</label>
      <input
        type="text"
        id="weight"
        name="weight"
        v-model="weight"
        ref="weight"
      />
      <label for="career">경력</label>
      <div style="display: flex; width: 100%">
        <label>
          <input type="radio" name="career" value="1" v-model="career" />
          초보
        </label>
        <label>
          <input type="radio" name="career" value="2" v-model="career" />
          중수
        </label>
        <label>
          <input type="radio" name="career" value="3" v-model="career" />
          고수
        </label>
      </div>
      <br />
      <label for="goal">목표</label>
      <div style="display: flex; width: 100%">
        <label>
          <input type="radio" name="goal" value="다이어트" v-model="goal" />
          다이어트
        </label>
        <label>
          <input type="radio" name="goal" value="벌크업" v-model="goal" />
          벌크업
        </label>
        <label>
          <input type="radio" name="goal" value="린매스업" v-model="goal" />
          린매스업
        </label>
      </div>
      <br />
      <label for="growpart">원하는 부위</label>
      <div style="display: flex; width: 100%">
        <label>
          <input type="radio" name="growpart" value="가슴" v-model="growpart" />
          가슴
        </label>
        <label>
          <input type="radio" name="growpart" value="등" v-model="growpart" />
          등
        </label>
        <label>
          <input type="radio" name="growpart" value="어깨" v-model="growpart" />
          어깨
        </label>
        <label>
          <input type="radio" name="growpart" value="하체" v-model="growpart" />
          하체
        </label>
      </div>
      <br />
      <label for="smm">골격근량</label>
      <input type="text" id="smm" name="smm" v-model="smm" ref="smm" />
      <button v-if="type === 'regist'" @click="registUser">가입</button>
      <button @click="moveList">목록</button>
    </div>
  </div>
</template>
<script>
import axios from "axios";

export default {
  name: "RegistForm",
  props: {
    type: { type: String },
  },
  data() {
    return {
      user_id: "",
      user_password: "",
      email: "",
      gender: "",
      height: "",
      weight: "",
      career: "",
      goal: "",
      growpart: "",
      smm: "",
    };
  },
  methods: {
    registUser() {
      let newUser = {
        user_id: this.user_id,
        user_password: this.user_password,
        email: this.email,
        gender: this.gender,
        height: this.height,
        weight: this.weight,
        career: this.career,
        goal: this.goal,
        growpart: this.growpart,
        smm: this.smm,
      };
      console.log(newUser);
      axios({
        url: "http://localhost:9999/user/regist",
        method: "POST",
        data: newUser,
      }).then(() => {
        alert("가입완료! 로그인해주세요!");
        this.$store.dispatch("modifyUser", newUser);
        this.moveList();
      });
      // console.log(newUser.id);
      // Perform registration logic here
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
}

.regist_form {
  text-align: left;
  border-radius: 5px;
  background-color: #f2f2f2;
  padding: 20px;
}

.regist_form label {
  font-size: 1.2em;
  /* Adjust as needed */
  font-weight: bold;
  /* Adjust as needed */
}

.regist_form div label {
  font-size: 1em;
  /* Adjust as needed */
  font-weight: normal;
  /* Adjust as needed */
}

.regist_form label {
  font-size: 1.2em;
  /* Adjust as needed */
  font-weight: bold;
  /* Adjust as needed */
}

.regist_form div label {
  font-size: 1em;
  /* Adjust as needed */
  font-weight: normal;
  /* Adjust as needed */
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
