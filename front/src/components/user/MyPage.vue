<template>
  <b-container :style="switchTabStyle(currentTab)" class="my-3">
    <b-card no-body>
      <b-tabs card>
        <b-tab title="정보" active>
          <b-card-group deck>
            <follow-part :pageUser="pageUser"></follow-part>
            <b-card class="mt-4">
              <b-row>
                <b-col cols="5">
                  <b-table striped hover :items="getItems1()"></b-table>
                </b-col>
                <b-col cols="4">
                  <b-table striped hover :items="getItems2()"></b-table>
                </b-col>
                <b-col cols="3">
                  <b-table striped hover :items="getItems3()"></b-table>
                </b-col>
              </b-row>
            </b-card>
          </b-card-group>
        </b-tab>
        <b-tab title="좋아요 영상">
          <b-card-group deck>
            <b-card class="mt-4">
              <like-video :userId="pageUser.user_id"></like-video>
            </b-card>
          </b-card-group>
        </b-tab>
      </b-tabs>
      <a style="text-align: right; margin-right: 20px;" class="regist" @click="modifyUser">정보 변경</a>
    </b-card>
  </b-container>
</template>

<script>
import axios from "axios";
import LikeVideo from "@/components/main/LikeVideo.vue";
import { mapState } from "vuex";
import followPart from "./include/followPart.vue";

export default {
  name: "MyPage",
  components: {
    LikeVideo,
    followPart,
  },
  data() {
    return {
      pageUser: null,
      tabStyles: {
        정보: { maxWidth: "1000px" },
        좋아요영상: { maxWidth: "1300px" },
      },
    };
  },
  computed: {
    ...mapState(["user", "isAuthenticated"]),
  },
  created() {
    axios({
      method: "GET",
      url: `http://localhost:9999/user/${this.$route.params.user_id}`,
    }).then((response) => {
      this.pageUser = response.data;
    });
  },
  methods: {
    modifyUser() {
      
    },
    switchTabStyle(tab) {
      return this.tabStyles[tab];
    },
    getItems1() {
      return [{ "e-mail": this.pageUser.email, 성별: this.pageUser.gender }];
    },
    getItems2() {
      let careerText = "";
      if (this.pageUser.career === 1) {
        careerText = "1~3달";
      } else if (this.pageUser.career === 2) {
        careerText = "3달~1년";
      } else if (this.pageUser.career === 3) {
        careerText = "1년 이상";
      }
      return [
        {
          키: this.pageUser.height,
          몸무게: `${this.pageUser.weight}kg`,
          경력: careerText,
        },
      ];
    },
    getItems3() {
      return [
        {
          목표: this.pageUser.goal,
          목표부위: this.pageUser.growpart,
          골격근량: `${this.pageUser.smm}kg`,
        },
      ];
    },
  },
};
</script>

<style scoped>
.regist {
   text-decoration: none;
   cursor: pointer;
}
.my-3 {
  margin-top: 3rem;
  margin-bottom: 3rem;
}
</style>
