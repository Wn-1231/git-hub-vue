import Vue from "vue";
import VueRouter from "vue-router";

Vue.use(VueRouter);

const routes = [
  {
    path: "/",
    redirect: "/cicd",
  },
  {
    path: "/cicd",
    component: () =>
      import(/* webpackChunkName: 'cicd' */ "@/views/CiCd/index.vue"),
    meta: {
      title: "自定义页面标题",
      keepAlive: false,
    },
  },
  {
    path: "/zh-53",
    component: () =>
      import(/* webpackChunkName: 'service' */ "@/views/Service/index.vue"),
    meta: {
      title: "自定义页面标题",
      keepAlive: false,
    },
  },
  {
    path: "*",
    name: "NotFound",
    component: () =>
      import(/* webpackChunkName: 'not-found' */ "@/views/NotFound/index.vue"),
    meta: {
      title: "未找到该页面",
      keepAlive: false,
    },
  },
];

const router = new VueRouter({
  mode: "history",
  base: process.env.BASE_URL,
  routes,
});

router.beforeEach((to, from, next) => {
  document.title = to.meta.title || "";
  next();
});

export default router;
