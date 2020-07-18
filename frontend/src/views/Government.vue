<template>
  <div>
    <v-data-table
      :headers="headers"
      :items="items"
      single-expand
      item-key="resourceAddress"
      show-expand
      class="elevation-1"
      @item-expanded="fetchData"
    >
      <template v-slot:top>
        <v-toolbar flat>
          <v-toolbar-title>Government Table</v-toolbar-title>
          <v-spacer></v-spacer>
        </v-toolbar>
      </template>
      <template v-slot:expanded-item="{ headers }">
        <td :colspan="headers.length" class="px-0 py-2 elevation-1">
          <v-data-table
            item-key="time"
            :headers="innerHeaders"
            :loading="innerLoading"
            :items="innerItems"
            loading-text="Loading... Please wait"
            dense
            hide-default-footer
          ></v-data-table>
          <HistoryMap :coordinates="coords" />
        </td>
      </template>
    </v-data-table>
  </div>
</template>

<script>
import HistoryMap from "../components/HistoryMap";
export default {
  name: "Government",
  components: { HistoryMap },
  data() {
    return {
      coords: [],
      innerLoading: true,
      headers: [
        {
          text: "Resource Address",
          align: "start",
          value: "resourceAddress",
        },
        { text: "Type", value: "resourceType" },
        { text: "", value: "data-table-expand" },
      ],
      items: [
        {
          resourceAddress: "0x9b9251A5CCE10e91A0FA239e98a67873331Bf3B9",
          resourceType: "MASK",
        },
        {
          resourceAddress: "0xE89F9F7992c3D431301050d98605f5e883140bbd",
          resourceType: "HAND SANITIZER",
        },
        {
          resourceAddress: "0xE690cA8458064200bFE51407A422bFb631454C85",
          resourceType: "MASK",
        },
      ],
      innerHeaders: [
        {
          text: "Time",
          align: "start",
          value: "time",
        },
        {
          text: "From",
          value: "from",
        },
        {
          text: "To",
          value: "to",
        },
        {
          text: "Amount",
          value: "amount",
        },
        {
          text: "Status",
          value: "status",
        },
      ],
      innerItems: [
        {
          time: "1 July 2020",
          from: "Shanghai Dasheng Health Products Manufacturing, China",
          to: "Suvarnabhumi Airport Samut Prakan, Thailand",
          amount: 1000,
          status: "Dispatched",
        },
        {
          time: "10 July 2020",
          from: "Suvarnabhumi Airport Samut Prakan, Thailand",
          to: "City Municipality of Nan, Thailand",
          amount: 1000,
          status: "Distributed",
        },
      ],
    };
  },
  methods: {
    fetchData(data) {
      this.innerLoading = true;
      const { item, value } = data;
      console.log(item, value);
      if (value) {
        this.innerLoading = false;
        this.coords = [
          [121.2572993, 31],
          [100.6122394, 13.685683],
          [100.2861328, 18.8240931],
        ];
      }
    },
  },
};
</script>

<style></style>
