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
        <template v-slot:item.name="{ item }">
          <router-link :to="'/'">{{ item.merchantName }}</router-link>
        </template>
        <template v-slot:item.actions="{ item }">
          <v-btn small tile outlined color="success" @click="buy(item)">
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
    } else {
      this.img = "mask.jpg";
    }
  },
  data() {
    return {
      img: "",
      search: "",
      headers: [
        { text: "Merchant Name", align: "start", value: "name" },
        { text: "Address", value: "hash", sortable: false },
        { text: "Type", value: "type" },
        { text: "Availability", value: "avail" },
        { text: "Action", value: "actions", sortable: false },
      ],
      items: [
        {
          merchantName: "Mr Kay",
          hash: "3482jda1231djalkd123",
          type: "Government",
          avail: 1000,
        },
        {
          merchantName: "Mr NPM",
          hash: "6654jda1231djalkd123",
          type: "Government",
          avail: 90,
        },
        {
          merchantName: "Mr DOG",
          hash: "2482jda1231djalkd123",
          type: "Government",
          avail: 200,
        },
      ],
    };
  },
  methods: {
    buy(item) {
      console.log(item);
    },
  },
};
</script>

<style scoped>
.title {
  text-transform: capitalize;
}
</style>
