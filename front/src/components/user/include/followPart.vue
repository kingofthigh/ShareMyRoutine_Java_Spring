<template>
  <b-card v-if="pageUser" :header="`${this.pageUser.user_id}님 정보`" header-tag="header" class="mb-3">
    <b-row class="align-items-center mb-3">
      <b-col sm="4" class="text-center">
        <b-avatar variant="info" size="96" class="mb-2">사진</b-avatar>
      </b-col>
      <b-col sm="8">
        <b-row>
          <b-col>
            <h4>게시글</h4>
            <b-card-text>{{ postCount }}</b-card-text>
          </b-col>
          <b-col>
            <h4 class="username-link" @click="showFollowersModal">팔로워</h4>
            <b-card-text class="username-link" @click="showFollowersModal" style="margin-left: 35px;">{{
              followersLength
            }}</b-card-text>
          </b-col>
          <b-col>
            <h4 class="username-link" @click="showFollowingsModal">팔로잉</h4>
            <b-card-text class="username-link" @click="showFollowingsModal" style="margin-left: 35px;">{{
              followingsLength
            }}</b-card-text>
          </b-col>
        </b-row>
        <b-row>
          <b-col>
            <b-button v-if="isAuthenticated && pageUser.user_id !== user.user_id && loginUserFollowing"
              @click="removeFollow" variant="danger">
              언팔로우
            </b-button>
            <b-button v-else-if="isAuthenticated && pageUser.user_id !== user.user_id && !loginUserFollowing"
              @click="addFollow" variant="primary">
              팔로우
            </b-button>
            <span v-else-if="pageUser.user_id == user.user_id"></span>
            <router-link v-else :to="{ name: 'user-login' }">
              <b-button variant="outline-primary">로그인</b-button>
            </router-link>
          </b-col>
        </b-row>
      </b-col>
    </b-row>
    <!-- Followers Modal -->
    <b-modal id="followers-modal" centered title="Followers">
      <p v-if="followersLength === 0">아직 팔로워가 없습니다.</p>
      <div v-else>
        <router-link
    v-for="(follower, index) in followers"
    :key="index"
    :to="`/user/mypage/${follower.user_id}`"
    class="username-link"
    @click.native="closeModal"
  >
    {{ follower.user_id }}
  </router-link>
  
</div>
</b-modal>
    <!-- Followings Modal -->
    <b-modal id="followings-modal" centered title="Followings">
      <p v-if="followingsLength === 0">아직 팔로잉이 없습니다.</p>
      <div v-else>
        <router-link
      v-for="(following, index) in followings"
      :key="index"
      :to="`/user/mypage/${following.user_id}`"
      class="username-link"
      @click.native="closeModal"
    >
      {{ following.user_id }}
    </router-link>
      </div>
    </b-modal>
  </b-card>
</template>


<script>
import { mapState } from "vuex";

export default {
  name: "followPart",
  props: {
    pageUser: {
      type: Object,
      required: true,
    },
  },
  computed: {
    ...mapState(["followings", "followers", "user", "isAuthenticated"]),
    followingsLength() {
      return this.followings.length;
    },
    followersLength() {
      return this.followers.length;
    },
    loginUserFollowing() {
      for (let i = 0; i < this.followers.length; i++) {
        console.log("이 페이지 주인의 팔로워");
        console.log(this.followers[i].user_id);
        console.log("방문자");
        console.log(this.user.user_id);
        if (this.followers[i].user_id == this.user.user_id) {
          console.log(this.pageUser.user_id);
          return true;
        }
      }
      return false;
    },
  },
  created() {
    this.$store.dispatch("getFollowerList", this.$route.params.user_id);
    this.$store.dispatch("getFollowingList", this.$route.params.user_id);
  },
  methods: {
    closeModal() {
      this.$bvModal.hide('followers-modal');
      this.$bvModal.hide('followings-modal');
    },
    addFollow() {
      let follow = {
        following: this.pageUser.user_id,
        follower: this.user.user_id,
      };
      this.$store.dispatch("addFollow", follow);
    },
    removeFollow() {
      let follow = {
        following: this.pageUser.user_id,
        follower: this.user.user_id,
      };
      this.$store.dispatch("removeFollow", follow);
    },
    showFollowersModal() {
      if (this.followersLength === 0) {
        alert("아직 팔로워가 없습니다.");
        return;
      }
      this.$bvModal.show("followers-modal");
    },
    showFollowingsModal() {
      if (this.followingsLength === 0) {
        alert("아직 팔로잉이 없습니다.");
        return;
      }
      this.$bvModal.show("followings-modal");
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
</style>
