<template>
  <div>
    <div class="mycontainer">
      <div class="my-info">
        <div class="profile-img"></div>
        <div class="info">
          <div class="user id">ID : {{ user.user_id }}</div>
          <div class="user growpart">타겟 부위 : {{ user.growpart }}</div>
          <div class="user goal">현재 목표 : {{ user.goal }}</div>
          <div v-if="isAuthenticated">
            <router-link :to="'/user/mypage/' + user.user_id"
              >마이 페이지</router-link
            >
          </div>
          <div v-else>
            <a href="#" @click.prevent="checkAuthentication">마이 페이지</a>
          </div>
        </div>
      </div>
      <div class="weighttrack">
        <div v-for="(weight, index) in userWeight" :key="index">
          <div class="weight">
            {{ weight.weight }} | {{ formatDate(weight.created_date) }}
          </div>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
import moment from "moment";
import { mapState } from "vuex";

export default {
  name: "WeightTrack",
  computed: {
    ...mapState(["user", "userWeight", "isAuthenticated"]),
  },
  methods: {
    checkAuthentication() {
      if (!this.isAuthenticated) {
        alert("로그인 후 사용하세요!");
      } else {
        this.$router.push("/user/mypage/" + this.user.user_id);
      }
    },
    formatDate(date) {
      return moment(date).format("YYYY/MM/DD HH:mm");
    },
  },
  created() {
    if (!this.isAuthenticated) {
      console.log("작동하나?");
    } else {
      console.log("dkdkd");
      this.$store.dispatch("getUserWeight", this.user.user_id);
    }
  },
};
</script>

<style scoped>
.mycontainer {
  width: 940px;
  background-color: navy;
  height: 270px;
  margin: 0 auto;
  display: flex;
  flex-direction: row;
  justify-content: space-between;
}
.weighttrack {
  width: 850px;
  height: 100%;
  background-color: red;
}
.my-info {
  width: 270px;
  height: 100%;
  background-color: skyblue;
  text-align: center;
  padding-top: 20px;
}
.info {
  width: 75%;
}
.user {
  color: white;
  text-align: center;
}
.profile-img {
  width: 120px;
  height: 120px;
  background-color: white;
  border-radius: 50% 50% 50% 50%;
  margin: 15px auto;
}
.weight {
  color: white;
}
</style>
