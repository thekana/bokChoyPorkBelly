<template>
  <vl-map data-projection="EPSG:4326" style="height: 400px">
    <vl-view :zoom="zoom" :center="center" :rotation="rotation"></vl-view>

    <vl-layer-tile>
      <vl-source-osm></vl-source-osm>
    </vl-layer-tile>

    <vl-feature>
      <vl-geom-multi-point :coordinates="coordinates" />
    </vl-feature>
    <vl-feature>
      <vl-geom-line-string :coordinates="coordinates"></vl-geom-line-string>
      <vl-style-box>
        <vl-style-stroke color="red" :width="3"></vl-style-stroke>
      </vl-style-box>
    </vl-feature>
  </vl-map>
</template>

<script>
export default {
  name: "HistoryMap",
  props: {
    coordinates: Array,
  },
  mounted() {
    this.center = this.coordinates[this.coordinates.length - 1];
  },
  data() {
    return {
      zoom: 7,
      center: [],
      rotation: 0,
    };
  },
};
</script>
