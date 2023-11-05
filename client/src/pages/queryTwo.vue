<template>
  
  <q-page padding>
    <div class="q-gutter-md">
      <q-card>
        <q-card-section>
          <div class="text-h6">
            Determine the influence over time that team salary has had on the number of wins.
          </div>
          <div class="text-body1">
            The user selects one or many teams and a range of seasons. The salaries of the selected teams are calculated from the players’ and managers' salaries. The spending per win is calculated for each team. The average spending per win for all teams is also calculated, which serves as a reference point. Each year's spending amounts are adjusted for inflation as of the end of 2022.
          </div>
        </q-card-section>
      </q-card>
      <q-card>
        <q-card-section>
          <div class="text-h6">
            Methodology
          </div>
          <div class="text-body1">
            text body...
          </div>
        </q-card-section>
      </q-card>
      <q-card>
        <q-card-section>
          <div class="text-h6">
            Analysis and Visualization
          </div>
          <div class="text-body1">
            Text body..  
          </div>
        </q-card-section>
      </q-card>
      <q-card>
        <q-card-section>
          <div class="text-h6">
            Select a range of seasons and click the run visualization button.
          </div>
        </q-card-section>
        <q-card-section>
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
        </q-card-section>
        <q-card-section>
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
        </q-card-section>
      </q-card>
      <q-card>
        <q-card-section>
          Chart Js here
        </q-card-section>
        <q-card-section>
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
        </q-card-section>
        <q-card-section>
          <q-btn
          class="glossy" 
          color="primary" 
          label="Next Visualization" 
          to="queryTwo" 
          />
        </q-card-section>
      </q-card>
    </div>
  </q-page>
</template>

<script>
import { defineComponent } from 'vue'

export default {
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
}
</script>
