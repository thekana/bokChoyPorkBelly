<template>
  <div>
    <v-card class="mx-5">
      <v-row>
        <v-col cols="6">
          <v-img :src="require(`../assets/${img}`)" />
        </v-col>
        <v-col cols="6">
          <div class="text-h2 title">
            Merchant Address: {{ merchantAddress }}
          </div>
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
  name: "MerchantDetail",
  props: {
    merchantAddress: String,
  },
  created() {
    this.img = "hand-sanitizer.jpg";
    this.img = "mask.jpg";
  },
  data() {
    return {
      img: "",
      search: "",
      headers: [
        { text: "Resource Address", value: "resourceAddress" },
        { text: "Type", value: "type" },
        { text: "Availability", value: "avail" },
        { text: "Action", value: "actions", sortable: false },
      ],
      items: [
        {
          resourceAddress: "0x21Dbc27A6715afeC623AAC4Bb095E05F74C59172",
          type: "Mask",
          avail: 50,
        },
        {
          resourceAddress: "0x286FE32E70CF765b82f641263a9F82942fbFA990",
          type: "Mask",
          avail: 50,
        },
        {
          resourceAddress: "0xb7AC8C2bc53Bf2179474b60ba2E2cf78b4184A55",
          type: "Hand Sanitizer",
          avail: 50,
        },
      ],
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
