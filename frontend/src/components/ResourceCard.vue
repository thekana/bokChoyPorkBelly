<template>
  <v-card class="mx-auto" max-width="400">
    <v-img
      class="white--text align-end"
      height="200px"
      :src="require(`../assets/${img}`)"
    >
    </v-img>
    <v-card-text class="text--primary">
      <div>{{ title }}</div>
    </v-card-text>

    <v-card-actions>
      <v-btn color="orange" text>
        DUMMY
      </v-btn>

      <v-btn color="orange" text>
        DUMMY
      </v-btn>
    </v-card-actions>
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
  methods: {},
};
</script>

<style></style>
