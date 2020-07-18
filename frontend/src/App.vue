<template>
  <v-app>
    <v-app-bar app color="#333399" dark>
      <v-btn text to="/">
        <v-toolbar-title>Boy Chok</v-toolbar-title>
      </v-btn>
      <v-spacer />
      <v-btn text to="/market">
        Buy
      </v-btn>
      <v-btn text to="/government">
        Government
      </v-btn>
    </v-app-bar>
    <v-main>
      <router-view></router-view>
    </v-main>
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
