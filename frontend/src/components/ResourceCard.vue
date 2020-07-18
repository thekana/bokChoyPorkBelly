<template>
  <v-card class="mx-auto" max-width="400" @click="handle">
    <v-img
      class="white--text align-end"
      height="200px"
      :src="require(`../assets/${img}`)"
    >
    </v-img>
    <v-card-text class="text--primary">
      <div>{{ title }}</div>
    </v-card-text>
  </v-card>
</template>

<script>
export default {
  name: "ResourceCard",
  props: {
    title: String,
    img: String,
  },
  data() {
    return {};
  },
  computed: {},
  methods: {
    handle() {
      this.$router.push({ path: `/market/${this.title}` });
    },
  },
};
</script>

<style></style>
