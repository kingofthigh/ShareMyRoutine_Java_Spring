import Vue from "vue";
import Vuex from "vuex";
import axios from "axios";
import router from "@/router";
import createPersistedState from "vuex-persistedstate";

Vue.use(Vuex);

export default new Vuex.Store({
  state: {
    yvideos: [],
    yvideo: null,
    user: {},
    isAuthenticated: false, // 로그인 상태를 추적하는 상태
    followers: [],
    followings: [],
    videos: [],
    video: {},
    partvideos: [],
    allvideos: [],
    reviews: [],
    videoLikeInfo: [],
    likevideos: [],
    userWeight: [],
    workoutList: [],
    workPage: {},
    sets: [],
    exercises: [],
    exercisesPart: [],
    DetailPost: {},
    allpost: [],
    previousPath: "/",
  },
  getters: {
    videos(state) {
      return state.videos;
    },
    posts(state) {
      return state.allpost;
    },
  },
  mutations: {
    SEARCH_YOUTUBE(state, yvideos) {
      state.yvideos = yvideos;
    },
    CLICK_VIDEO(state, yvideo) {
      state.yvideo = yvideo;
    },
    SET_PREVIOUS_PATH(state, path) {
      state.previousPath = path;
    },
    MOVE_TO_MAIN() {
      router.push("/").catch((error) => {
        if (
          !(
            error.name === "NavigationDuplicated" &&
            error.message.includes(
              "Avoided redundant navigation to current location"
            )
          )
        ) {
          throw error;
        }
      });
    },
    SET_USER(state, user) {
      state.user = user;
    },
    SET_AUTHENTICATED(state, value) {
      state.isAuthenticated = value;
    },
    setFollowerList(state, payload) {
      state.followers = payload;
    },
    setFollowingList(state, payload) {
      state.followings = payload;
    },

    setVideos(state, payload) {
      state.videos = payload;
    },
    setAllVideos(state, payload) {
      state.allvideos = payload;
    },
    setVideo(state, payload) {
      state.video = payload;
    },
    setPartVideos(state, payload) {
      state.partvideos = payload;
    },
    setVideoLikeInfo(state, payload) {
      state.videoLikeInfo = payload;
    },
    setVideoLikeCnt(state, payload) {
      state.videoLikeCnt = payload;
    },
    setReviews(state, payload) {
      state.reviews = payload;
    },
    setWeightList(state, payload) {
      state.userWeight = payload;
    },
    setSets(state, payload) {
      state.sets = payload;
    },
    LOGOUT(state) {
      state.user = {};
      state.isAuthenticated = false;
      sessionStorage.removeItem("access-token");
    },
    // SET_REDIRECT_TO(state, url) {
    //   state.redirectTo = url;
    // },
    setWorkoutList(state, payload) {
      state.workoutList = payload;
    },
    setExerciseList(state, payload) {
      state.exercises = payload;
    },
    setPartExerciseList(state, payload) {
      state.exercisesPart = payload;
    },
    setWorkPage(state, payload) {
      state.workPage = payload;
    },
    setDetailPost(state, payload) {
      state.DetailPost = payload;
    },
    setAllPost(state, payload) {
      state.allpost = payload;
    },
    ADD_LIKE(state, { user_id, video_id }) {
      state.videoLikeInfo.push({ user_id, video_id });
    },
    DELETE_LIKE(state, { user_id, video_id }) {
      state.videoLikeInfo = state.videoLikeInfo.filter(
        (like) => !(like.user_id === user_id && like.video_id === video_id)
      );
    },
  },
  actions: {
    //비동기 통신은 요기서 진행시켜~~
    searchYoutube({ commit }, payload) {
      const URL = "https://www.googleapis.com/youtube/v3/search";
      const API_KEY = process.env.VUE_APP_YOUTUBE_API_KEY;
      axios({
        url: URL,
        method: "GET",
        params: {
          key: API_KEY,
          part: "snippet",
          q: payload,
          type: "video",
          maxResults: 10,
        },
      })
        .then((res) => {
          commit("SEARCH_YOUTUBE", res.data.items);
        })
        .catch((err) => console.log(err));
    },
    //payload : 비디오 객체가 들어온다.
    clickVideo({ commit }, payload) {
      commit("CLICK_VIDEO", payload);
    },
    getUser(context, user_id) {
      axios({
        method: "GET",
        url: `http://localhost:9999/user/${user_id}`,
      }).then((response) => {
        const user = response.data;
        context.commit("SET_USER", user);
      });
    },
    userLogin({ commit, state }, user) {
      const API_URL = `http://localhost:9999/user/login`;
      axios({
        url: API_URL,
        method: "POST",
        params: user,
      })
        .then((res) => {
          if (res.status == 202) {
            sessionStorage.setItem("access-token", res.data["access-token"]);
            alert("로그인 성공!");
            this.dispatch("getUser", user.user_id);
            this.dispatch("getUserWeight", user.user_id);
            commit("SET_AUTHENTICATED", true);

            router.push(state.previousPath);
          } else {
            alert("로그인 실패1!");
          }
        })
        .catch((error) => {
          console.error(error);
          alert("로그인 실패2!");
        });
    },
    logout({ commit, dispatch }) {
      commit("LOGOUT");
      alert("로그아웃 완료!");
      commit("setWeightList", []);
      dispatch("getAllVideos");
    },
    getFollowerList(context, user_id) {
      axios({
        method: "GET",
        url: `http://localhost:9999/user/follower/${user_id}`,
      }).then((response) => {
        context.commit("setFollowerList", response.data);
      });
    },
    getFollowingList(context, user_id) {
      axios({
        method: "GET",
        url: `http://localhost:9999/user/following/${user_id}`,
      }).then((response) => {
        context.commit("setFollowingList", response.data);
      });
    },
    addFollow(context, follow) {
      axios({
        method: "POST",
        url: "http://localhost:9999/user/follow",
        data: follow,
      }).then((response) => {
        console.log(response);
        context.dispatch("getFollowerList", follow.following);
      });
    },
    removeFollow(context, follow) {
      axios({
        method: "DELETE",
        url: "http://localhost:9999/user/removefollow",
        data: follow,
      }).then((response) => {
        console.log(response);
        context.dispatch("getFollowerList", follow.following);
      });
    },
    modifyUser(context, user) {
      axios({
        method: "PUT",
        url: "http://localhost:9999/user/update",
        data: user,
      }).then((response) => {
        if (response.data) {
          context.dispatch("getUserWeight", user.user_id);
        }
      });
    },
    getVideos(context, user) {
      axios({
        method: "get",
        url: "http://localhost:9999/video/video",
        params: { user_id: user.user_id },
      })
        .then((response) => {
          const data = response.data;
          context.commit("setVideos", data);
        })
        .catch((error) => {
          console.error(error);
        });
    },
    getAllVideos(context) {
      axios({
        method: "get",
        url: "http://localhost:9999/video/",
      })
        .then((response) => {
          const data = response.data;
          context.commit("setAllVideos", data);
        })
        .catch((error) => {
          console.error(error);
        });
    },
    getPartVideos(context, category) {
      axios({
        method: "get",
        url: `http://localhost:9999/video/${category}`,
      })
        .then((response) => {
          const data = response.data;
          context.commit("setPartVideos", data);
        })
        .catch((error) => {
          console.error(error);
        });
    },
    getDetailVideo(context, video_id) {
      axios({
        method: "get",
        url: `http://localhost:9999/video/detail/${video_id}`,
      }).then((response) => {
        const data = response.data;
        context.commit("setVideo", data);
        context.dispatch("getDetailVideoReview", video_id);
        context.dispatch("getVideoLikeInfo", video_id);
      });
    },
    getDetailVideoReview(context, video_id) {
      axios({
        method: "get",
        url: `http://localhost:9999/video/detail/review/${video_id}`,
      }).then((response) => {
        const data = response.data;
        context.commit("setReviews", data);
      });
    },
    getVideoLikeInfo(context, video_id) {
      axios({
        method: "get",
        url: `http://localhost:9999/video/detail/like/${video_id}`,
      }).then((response) => {
        const data = response.data;
        context.commit("setVideoLikeInfo", data);
      });
    },
    registReview(context, review) {
      return new Promise((resolve, reject) => {
        axios({
          method: "POST",
          url: "http://localhost:9999/review/regist",
          data: review,
        })
          .then((response) => {
            alert("등록이 완료되었습니다.");
            context.dispatch("getDetailVideoReview", review.video_id);
            resolve(response);
          })
          .catch((error) => {
            if (error.name !== "NavigationDuplicated") {
              reject(error);
            }
          });
      });
    },
    deleteReview(context, review) {
      return new Promise((resolve, reject) => {
        axios({
          method: "delete",
          url: `http://localhost:9999/review/${review.review_id}`,
        })
          .then((response) => {
            console.log(response);
            return context.dispatch("getDetailVideoReview", review.video_id);
          })
          .then(() => {
            resolve(); // 리뷰 삭제 및 업데이트 완료
          })
          .catch((error) => {
            if (error.name !== "NavigationDuplicated") {
              reject(error);
            }
          });
      });
    },
    updateReview(context, editingReview) {
      axios({
        method: "PUT",
        url: `http://localhost:9999/review/update`,
        data: editingReview,
      }).then((response) => {
        console.log(response);
        context.dispatch("getDetailVideoReview", editingReview.video_id);
      });
    },
    getUserWeight(context, user_id) {
      axios({
        method: "GET",
        url: `http://localhost:9999/user/track/${user_id}`,
      }).then((response) => {
        context.commit("setWeightList", response.data);
      });
    },

    //운동 페이지
    registWorkPage(context, newWorkoutPage) {
      axios({
        method: "POST",
        url: `http://localhost:9999/workout/workoutPage`,
        data: newWorkoutPage,
      }).then((response) => {
        console.log(response);
        this.dispatch("getUserWorkPage", newWorkoutPage.user_id);
      });
    },
    getUserWorkPage(context, user_id) {
      console.log(user_id);
      axios({
        method: "GET",
        url: `http://localhost:9999/workout/workoutPageList/${user_id}`,
      }).then((response) => {
        context.commit("setWorkoutList", response.data);
      });
    },
    getSets(context, workpage_id) {
      axios({
        method: "GET",
        url: `http://localhost:9999/workout/sets/${workpage_id}`,
      }).then((response) => {
        if (response.data.length >= 0) {
          console.log("#######");
          console.log(response.data);
          context.commit("setSets", response.data);
        }
      });
    },
    addLike(context, payload) {
      axios({
        method: "POST",
        url: `http://localhost:9999/video/like/addlike`,
        data: payload,
      })
        .then(() => {
          context.dispatch("getVideoLikeInfo", payload.video_id);
        })
        .catch((error) => {
          console.error(error);
        });
    },
    deleteLike(context, payload) {
      axios({
        method: "DELETE",
        url: `http://localhost:9999/video/like/${payload.video_id}`,
        data: payload,
      })
        .then(() => {
          context.dispatch("getVideoLikeInfo", payload.video_id);
        })
        .catch((error) => {
          console.error(error);
        });
    },
    getExerciseList(context) {
      axios({
        method: "GET",
        url: `http://localhost:9999/workout/exercises`,
      }).then((response) => {
        context.commit("setExerciseList", response.data);
      });
    },
    getExercisePart(context, part_id) {
      axios({
        method: "GET",
        url: `http://localhost:9999/workout/exercises/${part_id}`,
      }).then((response) => {
        context.commit("setPartExerciseList", response.data);
      });
    },
    registSet(context, newSet) {
      console.log(newSet);
      axios({
        method: "POST",
        url: `http://localhost:9999/workout/set`,
        data: newSet,
      }).then((response) => {
        console.log(response);
        // console.log("sets를 위한 페이지 넘버" + newSet.workpage_id);
        this.dispatch("getSets", newSet.page_id);
      });
    },
    getWorkPageById(context, workpage_id) {
      axios({
        method: "GET",
        url: `http://localhost:9999/workout/workpage/${workpage_id}`,
      }).then((response) => {
        context.commit("setWorkPage", response.data);
      });
    },

    registPost(context, newPost) {
      axios({
        method: "POST",
        url: "http://localhost:9999/workout/post",
        data: newPost,
      })
        .then((response) => {
          console.log(response.data);
          context.dispatch("getPostDetail", response.data);
        })
        .catch((err) => {
          console.log(err);
          alert("이미 작성한 운동페이지 입니다.");
        });
    },
    getPostDetail(context, post_id) {
      axios({
        method: "GET",
        url: `http://localhost:9999/post/postlist/${post_id}`,
      })
        .then((response) => {
          console.log(response.data);
          context.commit("setDetailPost", response.data);
          // context.commit("setSets", resonse,)
        })
        .then(() => {
          console.log(context.state.DetailPost.workpage_id);
          this.dispatch("getSets", context.state.DetailPost.workpage_id);
        });
    },
    getAllPost(context) {
      axios({
        method: "GET",
        url: `http://localhost:9999/post/postlist`,
      }).then((response) => {
        context.commit("setAllPost", response.data);
      });
    },
    getLikeVideos(context, payload) {
      axios({
        method: "GET",
        url: `http://localhost:9999/video/like/${payload}`,
      })
        .then((response) => {
          const data = response.data;
          context.commit("setlikeVideos", data);
        })
        .catch((error) => {
          console.error(error);
        });
    },
  },
  modules: {},
  plugins: [createPersistedState({})],
});
