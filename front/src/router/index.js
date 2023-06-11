import Vue from "vue";
import VueRouter from "vue-router";
import HomeView from "../views/HomeView.vue";
import UserView from "../views/UserView.vue";
import VideoDetail from "@/components/video/VideoDetail.vue";
import MyPage from "@/components/user/MyPage.vue";
import WorkOut from "@/components/exercise/WorkOut.vue";
import PostCreate from "@/components/post/PostCreate.vue";
import PostUpdate from "@/components/post/PostUpdate.vue";
import PostDetail from "@/components/post/PostDetail.vue";

Vue.use(VueRouter);

const routes = [
  {
    path: "/",
    name: "home",
    component: HomeView,
  },
  {
    path: "/user",
    name: "user",
    component: UserView,
    children: [
      {
        path: "insert",
        name: "user-insert",
        component: () => import("@/components/user/InsertUser.vue"),
      },
      {
        path: "login",
        name: "user-login",
        component: () => import("@/components/user/LoginUser.vue"),
      },
    ],
    redirect: () => {
      return "/";
    },
  },
  {
    path: "/video/:video_id",
    name: "video-detail",
    component: VideoDetail,
  },
  {
    path: "/review/write/:video_id",
    name: "review-write",
    component: () => import("@/components/video/include/ReviewWriteForm.vue"),
    meta: {
      requiresAuth: true, // 인증이 필요한 페이지임을 나타냅니다.
    },
  },
  {
    path: "/user/mypage/:user_id",
    name: "mypage",
    component: MyPage,
  },
  {
    path: "/workout",
    name: "work-page",
    component: WorkOut,
  },
  {
    path: "/create/:workpage_id",
    name: "post-create",
    component: PostCreate,
  },
  {
    path: "/update",
    name: "post-update",
    component: PostUpdate,
  },
  {
    path: "/detail",
    name: "post-detail",
    component: PostDetail,
  },
  {
    path: "/post/postlist",
    name: "post-list",
    component: () => import("@/components/post/PostList.vue"),
  },
];
const router = new VueRouter({
  mode: "history",
  base: process.env.BASE_URL,
  routes,
});
router.beforeEach((to, from, next) => {
  if (to.path === "/user/login" && from.path !== "/user/login") {
    localStorage.setItem("preLoginPath", from.path);
  }
  next();
});
export default router;
