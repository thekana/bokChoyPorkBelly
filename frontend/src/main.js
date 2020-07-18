import Vue from "vue";
import App from "./App.vue";
import vuetify from "./plugins/vuetify";
import router from "./plugins/router";
import VueLayers from "vuelayers";
import "vuelayers/lib/style.css"; // needs css-loader

Vue.config.productionTip = false;
Vue.use(VueLayers);

new Vue({
  vuetify,
  router,
  render: (h) => h(App),
}).$mount("#app");
