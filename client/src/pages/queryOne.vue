<template>
  <q-page padding>
    <div class="q-gutter-md">

      <div class="text-h2">
        Runs-to-Outs by Salary Range
      </div>
  
      <div class="text-h4">
        Exploring the Impact of Salaries on Performance
      </div>
  
      <div class="text-body1">
        This section delves into how a player's salary can influence their offensive performance over time. It’s critical to examine the efficiency of players in terms of their ability to score and bring in runs, in relation to the number of outs. This analytical approach takes into account different salary ranges, categorizing them as high, medium, and low based on specific percentiles.
      </div>
  
      <div class="text-h5">
        Methodology:
      </div>
  
      <div class="text-body1">
        To conduct this analysis, we categorize players into different salary brackets. Players earning at or above the 75th percentile are considered in the high salary range. Those in the middle 50% (25th to 75th percentile) fall into the medium category, while those below the 25th percentile are deemed to be in the low salary bracket.
      </div>
  
      <div class="text-h5">
        Analysis and Visualization:
      </div>
  
      <div class="text-body1">
        The study calculates the average of certain performance metrics (such as home runs, batting average, and strikeouts) for all players within each salary bracket. These averages are then plotted over multiple MLB seasons (spanning from 2000 to 2020) to visualize trends and derive insights on the correlation between salary and performance.
      </div>
  
      <!-- test removing this div -->
      <div>
        <!--this list is for the demo sql query-->
        <q-list bordered separator>
            <q-item v-for="item in dataFromOracle" :key="item.id">
              <q-item-section>{{ item[0] }}</q-item-section>
              <q-item-section>{{ item[1] }}</q-item-section>
              <q-item-section>{{ item[2] }}</q-item-section>
            </q-item>
          </q-list>
      </div>

      <div class="text-h4">
        Input here
      </div>

      <q-btn 
        class="glossy"
        :loading="progress" 
        color="primary" 
        @click="runQuery1"
      >
        Run Visualization
        <template v-slot:loading>
          <q-spinner-gears class="on-left" />
          Calculating...
        </template>
      </q-btn>

      <div class="text-h4">
        Chart Js here
      </div>

      <q-btn 
      class="glossy" 
      color="primary" 
      label="Next Visualization" 
      to="queryTwo" 
      />

    </div>

  </q-page>
</template>

<script>
import { defineComponent } from 'vue'

export default {
  name: 'queryOne',
  data () {
    return {
      dataFromOracle: [],
      cityName: 'Tampa',
      country: 'USA',
      progress: false
    }
  },
  methods: {
    async runQuery1 () {
      this.progress = true;
      // simulate a delay
      // await new Promise(resolve => setTimeout(resolve, 3000));

      let response = await fetch(`http://localhost:4000/api?name_from_client=${this.cityName}&country_from_client=${this.country}`);
      let data = await response.json();
      this.dataFromOracle = data;

      this.progress = false;

      console.log(data);
    }
  }
}
</script>
