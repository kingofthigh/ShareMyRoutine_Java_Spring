<template>
  <b-navbar style="background-color: white !import" toggleable="lg" variant="light" type="light">
    <router-link to="/" class="nav-link">
      <b-navbar-brand>
        <img src="@/assets/com.png" alt="logo" width="300px" />
      </b-navbar-brand>
    </router-link>

    <b-navbar-toggle target="nav-collapse">
    </b-navbar-toggle>
    <!-- <router-link v-if="isAutehnticated" :to="{name: 'work-page'}">운동</router-link> -->
    
    
    <b-collapse  id="nav-collapse" is-nav> </b-collapse>
    <span v-if="isAuthenticated">
      <router-link class="head" :to="'/workout'">운동</router-link>
    </span>
    <span  v-else>
      <a class="head" href="#" @click.prevent="checkAuthentication">운동</a>
    </span> | 
    <router-link  class="head" :to="{name: 'post-list'}">게시물</router-link> |
  <div v-if="isAuthenticated">
            <router-link class="head" :to="'/user/mypage/' + user.user_id"
              >마이 페이지</router-link
            >
          </div>
          <div v-else>
            <a class="head" href="#" @click.prevent="checkAuthentication">마이 페이지</a>
          </div>
    <b-navbar-nav class="ml-auto">
      <b-nav-item v-if="isAuthenticated">
        <span class="username" style="color: black"
          >{{ user.user_id }}님 반갑습니다!
        </span>
        <b-button variant="outline-danger" @click="logout">로그아웃</b-button>
      </b-nav-item>
      <template v-if="!isAuthenticated">
        <b-nav-item :to="{ name: 'user-insert' }">회원가입</b-nav-item>
        <b-nav-item :to="{ name: 'user-login' }">로그인</b-nav-item>
      </template>
    </b-navbar-nav>
  </b-navbar>
</template>

<script>
import { mapState } from "vuex";

export default {
  name: "HeaderNav",
  computed: {
    ...mapState(["user", "isAuthenticated"]),
  },
  methods: {
    logout() {
      this.$store.dispatch("logout");
      this.$router.push("/").catch((error) => {
        if (error.name !== "NavigationDuplicated") {
          throw error;
        }
      });
    },
    checkAuthentication() {
      if (!this.isAuthenticated) {
        alert("로그인 후 사용하세요!");
      } else {
        this.$router.push("/workout");
      }
    },
  },
};
</script>

<style scoped>
.nav-link {
  text-decoration: none;
}
.b-navbar {
  background-color: skyblue;
  line-height: 70px;
  padding: 0px 30px;
}

.b-navbar a {
  text-decoration: none;
  color: white;
}

.b-navbar-brand {
  display: inline-block;
  font-size: 2rem;
  font-weight: bold;
  color: white;
}

.b-navbar-brand router-link,
.b-navbar-brand router-link:visited,
.b-navbar-brand router-link:hover {
  text-decoration: none;
}

.username {
  font-weight: bold;
  color: white;
}
.head{
  text-decoration: none;
  font-weight: 600;
  color: skyblue;
}
</style>
