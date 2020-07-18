import Vue from "vue";
import VueRouter from "vue-router";
import HelloWorld from "../components/HelloWorld";
import Market from "../views/Market";

Vue.use(VueRouter);

const router = new VueRouter({
  mode: "history",
  routes: [
    {
      path: "/test",
      name: "HelloWorld",
      component: HelloWorld,
    },
    {
      path: "/market",
      name: "Market",
      component: Market,
    },
  ],
});

export default router;
