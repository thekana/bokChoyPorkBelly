<template>
  <div>
    <v-row>
      <v-col cols="12" v-for="(resource, i) in resources" :key="i">
        <ResourceCard v-bind="resource" :key="i" />
      </v-col>
    </v-row>
  </div>
</template>

<script>
import ResourceCard from "../components/ResourceCard";
export default {
  name: "Market",
  components: { ResourceCard },
  data: function() {
    return {
      num: 5,
      resources: [
        { title: "mask", img: "mask.jpg" },
        { title: "hand sanitizer", img: "hand-sanitizer.jpg" },
      ],
    };
  },
};
</script>

<style></style>
