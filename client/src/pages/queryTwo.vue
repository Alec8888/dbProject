<template>
  <q-page padding>

    <div class="text-h2 q-pa-md">
      Team Spending Per Win
    </div>

    <div class="text-h4 q-pa-md">
      Determine the influence over time that team salary has had on the number of wins.
    </div>

    <div class="q-pa-md text-body1">
      The user selects one or many teams and a range of seasons. The salaries of the selected teams are calculated from the players’ and managers' salaries. The spending per win is calculated for each team. The average spending per win for all teams is also calculated, which serves as a reference point. Each year's spending amounts are adjusted for inflation as of the end of 2022.
    </div>
<!-- This bages breaks the range selector -->
    <q-badge color="secondary" class="q-mb-lg">
        Years: {{ year_range.min }} to {{ year_range.max }}
    </q-badge>

    <q-form @submit="runVisual" class="q-gutter-md">
      <div class="q-pa-md">
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
      </div>

      <div class="q-pa-md" style="max-width: 300px">
        <div class="q-gutter-md">
          <q-select v-model="model" :options="options" label="Select a Team" /> 
        </div>
      </div>

      <div class="q-pa-md q-gutter-sm">
        <q-btn color="secondary" label="Run Visualization" type="submit" @click="runQuery2" />
      </div>

    </q-form>

    

    

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
      options: ref([
        'Rays', 'Yankees', 'RedSocks', 'Marlins', 'Mets', 'Phillies', 'Braves', 'Nationals', 'Orioles', 'BlueJays', 'Twins', 'Indians', 'WhiteSox', 'Tigers', 'Royals', 'Astros', 'Rangers', 'Angels', 'Athletics', 'Mariners', 'Giants', 'Dodgers', 'Padres', 'Rockies', 'Diamondbacks', 'Cubs', 'Cardinals', 'Brewers', 'Pirates', 'Reds'
      ]),
      year_range: ref({
        min: 1871,
        max: 2022
      })
    }
  }
}
</script>
