<template>
  <q-page padding>

    <div class="text-h2 q-pa-md">
      Runs-to-Outs by Salary Range
    </div>

    <div class="text-h4 q-pa-md">
      Exploring the Impact of Salaries on Performance
    </div>

    <div class="q-pa-md text-body1">
      This section delves into how a player's salary can influence their offensive performance over time. It’s critical to examine the efficiency of players in terms of their ability to score and bring in runs, in relation to the number of outs. This analytical approach takes into account different salary ranges, categorizing them as high, medium, and low based on specific percentiles.
    </div>

    <div class="text-h4 q-pa-md">
      Methodology:
    </div>

    <div class="q-pa-md text-body1">
      To conduct this analysis, we categorize players into different salary brackets. Players earning at or above the 75th percentile are considered in the high salary range. Those in the middle 50% (25th to 75th percentile) fall into the medium category, while those below the 25th percentile are deemed to be in the low salary bracket.
    </div>

    <div class="text-h4 q-pa-md">
      Analysis and Visualization:
    </div>

    <div class="q-pa-md text-body1">
      The study calculates the average of certain performance metrics (such as home runs, batting average, and strikeouts) for all players within each salary bracket. These averages are then plotted over multiple MLB seasons (spanning from 2000 to 2020) to visualize trends and derive insights on the correlation between salary and performance.
    </div>

    <div class="q-pa-md">
      <!--this list is for the demo sql query-->
      <q-list bordered separator>
          <q-item v-for="item in dataFromOracle" :key="item.id">
            <q-item-section>{{ item[0] }}</q-item-section>
            <q-item-section>{{ item[1] }}</q-item-section>
            <q-item-section>{{ item[2] }}</q-item-section>
          </q-item>
        </q-list>
    </div>

    <div class="q-pa-md">
      <q-btn color="positive" text-color="white" @click="runQuery1">
        Run Visualization
      </q-btn>
    </div>


  </q-page>
</template>

<script>
import { defineComponent } from 'vue'

export default defineComponent({
  name: 'queryOne',
  data () {
    return {
      dataFromOracle: [],
      cityName: 'Tampa',
      country: 'USA'
    }
  }
  ,
  methods: {
    async runQuery1 () {
      let response = await fetch(`http://localhost:3000/api?name_from_client=${this.cityName}&country_from_client=${this.country}`);
      let data = await response.json();
      this.dataFromOracle = data;
      console.log(data);
    }
  }
})
</script>
