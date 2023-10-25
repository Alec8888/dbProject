<template>
  <q-page padding>
    <h1>Team Spending Per Win</h1>
    <h2>Determine the influence over time that team salary has had on the number of wins.</h2>
    <p>The user selects one or many teams and a range of seasons. The salaries of the selected teams are calculated from the players’ and managers' salaries. The spending per win is calculated for each team. The average spending per win for all teams is also calculated, which serves as a reference point. Each year's spending amounts are adjusted for inflation as of the end of 2022. </p>

    <div class="q-pa-md">
      <q-badge color="secondary" class="q-mb-lg">
        Years: {{ 1950 }} to {{ 2022 }} (in 10 year intervals)
      </q-badge>

      <q-range
        v-model="Years"
        :min="1950"
        :max="2022"
        :step="10"
        label-always
        color="primary"
      />
    </div>

    <div class="q-pa-md" style="max-width: 300px">
      <div class="q-gutter-md">
        <q-select v-model="model" :options="options" label="Standard" /> 
      </div>
    </div>

    <div class="q-pa-md q-gutter-sm">
      <q-btn color="secondary" label="Run Visualization" @click="runQuery2" />
    </div>

    <div class="q-pa-md">
      <q-img
          src="/placeHolderPics/Q2placeholderPic.png"
          style="height: 500; max-width: 500;"
        />
    </div>

    <div class="q-pa-md q-gutter-sm">
      <q-btn color="secondary" label="Next Visualization" @click="nextVisualization" />
    </div>
  
  </q-page>
</template>

<script>
import { ref } from 'vue';

export default {
  // name: 'PageName',
  setup () {
    return {
      model: ref(null),
      // can we make this list a variable that is populated from the database based on the Year range?
      options: [
        'team1', 'team2', 'team3', 'team4'
      ]
    }
  }
}
</script>
