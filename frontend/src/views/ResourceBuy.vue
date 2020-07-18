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
        { text: "Name", value: "name" },
        { text: "Date", value: "date" },
        { text: "Amount", value: "amount" },
      ],
      items: [
        {
          buyerAddress: "0x294424CeDd4319BC0FAd4EaCA7401A50A0783608",
          name: "Dhammasorn",
          date: "19/07/2020 11:50:23",
          amount: 10,
        },
        {
          buyerAddress: "0x08DFc6F4b8040b61A7383219516a1657D94bd1a1",
          name: "Suebtrakul",
          date: "19/07/2020 11:32:36",
          amount: 5,
        },
      ],
    };
  },
  methods: {
    buy() {
      if (this.buyAmount >= 10) {
        alert("Limit Exceeded");
      } else {
        alert("Ok");
      }
    },
  },
};
</script>

<style scoped>
.title {
  text-transform: capitalize;
}
</style>
