<template>
  <q-page padding>
    <div class="q-gutter-md">
      <div class="text-h2">
        Team Spending Per Win
      </div>
  
      <div class="text-h4">
        Determine the influence over time that team salary has had on the number of wins.
      </div>
  
      <div class="text-body1">
        The user selects one or many teams and a range of seasons. The salaries of the selected teams are calculated from the players’ and managers' salaries. The spending per win is calculated for each team. The average spending per win for all teams is also calculated, which serves as a reference point. Each year's spending amounts are adjusted for inflation as of the end of 2022.
      </div>
  
      <q-badge color="secondary" class="q-mb-lg">
          Years: {{ year_range.min }} to {{ year_range.max }}
      </q-badge>
  
      <q-form>
          <q-range
            name="year_range"
            v-model="year_range"
            :min="1871"
            :max="2022"
            :step="1"
            label-always
            color="primary"
            markers=true
          />

        <q-btn 
          class="glossy"
          :loading="progress" 
          color="primary" 
          @click="runQuery2"
        >
          Run Visualization
          <template v-slot:loading>
            <q-spinner-gears class="on-left" />
            Calculating...
          </template>
        </q-btn>

      </q-form>

      <div class="text-h4">
        Chart Js here
      </div>
  
      <q-btn class="glossy" color="primary" label="Next Visualization" to="queryThree"/>

    </div>

  </q-page>
</template>

<script>
import { defineComponent } from 'vue'

export default defineComponent({
  name: 'queryTwo',
  data () {
    return {
      dataFromOracle: [],
      cityName: 'Tampa',
      country: 'USA',
      progress: false,
      year_range: {
        min: 1871,
        max: 2022
      }
    }
  },
  methods: {
    async runQuery2 () {
      this.progress = true;
      // simulate a delay
      await new Promise(resolve => setTimeout(resolve, 3000));

      let response = await fetch(`http://localhost:3000/api?name_from_client=${this.cityName}&country_from_client=${this.country}`);
      let data = await response.json();
      this.dataFromOracle = data;

      this.progress = false;

      console.log(data);
    }
  }
})
</script>
