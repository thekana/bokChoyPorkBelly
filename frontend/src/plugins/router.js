import Vue from "vue";
import VueRouter from "vue-router";
import HelloWorld from "../components/HelloWorld";
import Market from "../views/Market";
import ResourceDetail from "../views/ResourceDetail";

Vue.use(VueRouter);

const router = new VueRouter({
  mode: "history",
  routes: [
    {
      path: "/test",
      component: HelloWorld,
    },
    {
      path: "/market",
      component: Market,
    },
    {
      path: "/market/:name",
      component: ResourceDetail,
      props: true,
    },
  ],
});

export default router;
