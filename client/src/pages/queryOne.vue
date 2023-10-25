<template>
  <q-page padding>
    <h1>Runs-to-Outs by Salary Range</h1>
    <h2>Calculate the influence over time of player salary on offensive performance.</h2>
    <p>Offensive player performance can be measured by the ratio of runs and runs batted in to outs. Outs will be derived. Categorize players into salary brackets (e.g., low, medium, high) based on annual salary percentile. A high salary could be considered anything greater than or equal to the 75th percentile, medium salaries could be in the middle 50% (25th percentile to 75th percentile) and low salaries could be categorized as below the 25th percentile. Calculate the average of certain performance metrics (e.g., home runs hit, batting average, strikeouts) for all players within each salary bracket for each season and then graph the calculated averages across a range of MLB seasons (2000-2020).</p>

    <!-- <div class="q-pa-md">
      <q-badge color="secondary" class="q-mb-lg">
        Model: {{ label.min }} to {{ label.max }} (-20 to 20, step 4)
      </q-badge>

      <q-range
        v-model="label"
        :min="-20"
        :max="20"
        :step="4"
        label-always
        color="brown"
      />
    </div> -->

    

    <!--this list is for the demo sql query-->
     <q-list bordered separator>
      <q-item v-for="item in dataFromOracle" :key="item.id">
        <q-item-section>{{ item[0] }}</q-item-section>
        <q-item-section>{{ item[1] }}</q-item-section>
        <q-item-section>{{ item[2] }}</q-item-section>
      </q-item>
    </q-list>

    <div class="q-pa-md q-gutter-sm">
      <q-btn color="white" text-color="black" @click="runQuery1">
        Run Visualization
        <q-icon name="code"></q-icon>
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
      dataFromOracle: []

    }
  }
  ,
  methods: {
    async runQuery1 () {
      let response = await fetch('http://localhost:3000/api');
      let data = await response.json();
      this.dataFromOracle = data;
      console.log(data);
    }
  }
})
</script>
