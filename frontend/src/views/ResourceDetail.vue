<template>
  <div>
    <v-card class="mx-5">
      <v-row>
        <v-col cols="6">
          <v-img :src="require(`../assets/${img}`)" />
        </v-col>
        <v-col cols="6">
          <div class="text-h2 title">{{ name }}</div>
          <div class="text-h4">Rules: Maximum 10 per person</div>
        </v-col>
      </v-row>
      <v-card-title>
        <v-text-field
          v-model="search"
          append-icon="mdi-magnify"
          label="Search"
          single-line
          hide-details
        ></v-text-field>
      </v-card-title>
      <v-data-table
        class="mx-5"
        :headers="headers"
        :items="items"
        :search="search"
      >
        <template v-slot:item.merchantName="{ item }">
          <router-link :to="{ path: `/merchant/${item.merchantAddress}` }">{{
            item.merchantName
          }}</router-link>
        </template>
        <template v-slot:item.actions="{ item }">
          <v-btn
            small
            tile
            outlined
            color="success"
            :to="{ path: `/buy/${item.resourceAddress}` }"
          >
            <v-icon left>mdi-cart</v-icon> Buy
          </v-btn>
        </template>
      </v-data-table>
    </v-card>
  </div>
</template>

<script>
export default {
  name: "ResourceDetail",
  props: {
    name: String,
  },
  created() {
    if (this.name.includes("hand")) {
      this.img = "hand-sanitizer.jpg";
      this.items = [
        {
          merchantName: "Jirayu",
          resourceAddress: "0x81d7A7e0dea30FD1961Ff58d4C7200CB3d502072",
          type: "Individual",
          avail: 45,
          merchantAddress: "0xD2e409198B6F2738352CC07ADEdb84bBF8023203",
        },
      ];
    } else {
      this.img = "mask.jpg";
      this.items = [
        {
          merchantName: "Government",
          resourceAddress: "0xE690cA8458064200bFE51407A422bFb631454C85",
          type: "Government",
          avail: 200,
          merchantAddress: "0xE3e69db964318DCcbD50d030d1d851565F41b639",
        },
        {
          merchantName: "Jirayu",
          resourceAddress: "0x0A01d28F11ebf995A15710850e99EC2D6327Df67",
          type: "Individual",
          avail: 90,
          merchantAddress: "0xD2e409198B6F2738352CC07ADEdb84bBF8023203",
        },
        {
          merchantName: "Sirivorawong",
          resourceAddress: "0xD275b686afEB04c5A8c0457eec6e4311974770e1",
          type: "Individual",
          avail: 50,
          merchantAddress: "0x7BC33cb2C57F1fE3d3dA6C120643e48c5618B6c1",
        },
      ];
    }
  },
  data() {
    return {
      img: "",
      search: "",
      headers: [
        { text: "Merchant Name", align: "start", value: "merchantName" },
        { text: "Resource Address", value: "resourceAddress", sortable: false },
        { text: "Type", value: "type" },
        { text: "Availability", value: "avail" },
        { text: "Action", value: "actions", sortable: false },
      ],
      items: [],
    };
  },
  methods: {},
};
</script>

<style scoped>
.title {
  text-transform: capitalize;
}
</style>
