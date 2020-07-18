import Vue from "vue";
import VueRouter from "vue-router";
import Home from "../views/Home";
import Market from "../views/Market";
import ResourceDetail from "../views/ResourceDetail";
import ResourceBuy from "../views/ResourceBuy";
import MerchantDetail from "../views/MerchantDetail";
import Government from "../views/Government";

Vue.use(VueRouter);

const router = new VueRouter({
  mode: "history",
  routes: [
    {
      path: "/",
      component: Home,
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
    {
      path: "/buy/:resourceAddress",
      component: ResourceBuy,
      props: true,
    },
    {
      path: "/merchant/:merchantAddress",
      component: MerchantDetail,
      props: true,
    },
    {
      path: "/government",
      component: Government,
    },
  ],
});

export default router;
