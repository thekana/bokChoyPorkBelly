import Vue from "vue";
import VueRouter from "vue-router";
import HelloWorld from "../components/HelloWorld";
import Market from "../views/Market";
import ResourceDetail from "../views/ResourceDetail";
import ResourceBuy from "../views/ResourceBuy";
import MerchantDetail from "../views/MerchantDetail";

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
  ],
});

export default router;
