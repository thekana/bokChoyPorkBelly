<template>
  <v-app>
    <v-app-bar app color="primary" dark>
      <v-btn text to="/">
        <v-toolbar-title>Boy Chok</v-toolbar-title>
      </v-btn>
      <v-spacer />
      <v-btn text to="/market">
        Buy
      </v-btn>
      <v-btn text>
        Sell
      </v-btn>
    </v-app-bar>
    <v-content>
      <router-view></router-view>
    </v-content>
  </v-app>
</template>

<script>
export default {
  name: "App",

  components: {},

  data: () => ({
    //
  }),
};
</script>
