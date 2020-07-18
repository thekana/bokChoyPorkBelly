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
          resourceAddress: "8fije0923kqwe90134",
          resourceType: "mask",
        },
        {
          resourceAddress: "09e-0932ejwe8384433",
          resourceType: "hand sanitizer",
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
          value: "Amount",
        },
        {
          text: "Status",
          value: "status",
        },
      ],
      innerItems: [],
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
          [-167.6266, -17],
          [-145.323, -18],
        ];
      }
    },
  },
};
</script>

<style></style>
