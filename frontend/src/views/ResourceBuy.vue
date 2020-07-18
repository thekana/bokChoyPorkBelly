<template>
  <div>
    <v-card class="mx-5">
      <v-row>
        <v-col cols="6">
          <v-img :src="require(`../assets/${img}`)" />
        </v-col>
        <v-col cols="6">
          <div class="text-h2 title">Buy Item {{ resourceAddress }}</div>
          <div class="text-h2 title">From Merchant {{ owner }}</div>
          <div class="text-h4">Rules: Maximum 10 per person</div>
          <div class="text-h4">Price: $$$</div>
          <v-card-actions>
            <v-text-field
              v-model="buyAmount"
              type="number"
              label="Number"
              class="mr-3"
            ></v-text-field>
            <v-btn tile @click="buy">BUY</v-btn>
          </v-card-actions>
        </v-col>
      </v-row>
      <v-card-title>
        Purchase History
        <v-spacer></v-spacer>
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
      </v-data-table>
    </v-card>
  </div>
</template>

<script>
export default {
  name: "ResourceBuy",
  props: {
    resourceAddress: String,
  },
  created() {
    this.img = "hand-sanitizer.jpg";
    this.img = "mask.jpg";
  },
  data() {
    return {
      buyAmount: 0,
      transferNumber: 0,
      purchaseNumber: 0,
      owner: "",
      name: "",
      price: 0,
      transferStatus: 0,
      img: "",
      search: "",
      headers: [
        { text: "Purchased By", align: "start", value: "buyerAddress" },
        { text: "Date", value: "date" },
        { text: "Amount", value: "amount" },
      ],
      items: [
        {
          buyerAddress: "King Hash",
          date: "12323",
          amount: 1000,
        },
        {
          buyerAddress: "Gian Hash",
          date: "3123123",
          amount: 200,
        },
      ],
    };
  },
  methods: {
    buy() {
      console.log(this.buyAmount);
    },
  },
};
</script>

<style scoped>
.title {
  text-transform: capitalize;
}
</style>
