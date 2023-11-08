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
            label-always
            color="primary"
            :markers=true
            :min="1871"
            :max="2022"
            :step="1"
          />
        </q-card-section>

        <q-card-section>
            <q-btn 
              class="glossy"
              :loading="progress" 
              color="primary" 
              @click="getTeamsInRange"
              label="Get Teams in Range"
            />
          </q-card-section>

          <q-card-section>
            <q-select outlined v-model="team" :options="teams" label="Select a team"/>
          </q-card-section>

        <q-card-section>
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
          <q-btn 
            class="glossy q-ml-sm"
            :loading="progress" 
            color="primary" 
            @click="reset"
            label="Reset"
          />
        </q-card-section>
      </q-card>
      <q-btn @click="logProps">Log Props</q-btn>
      <q-card>

        <first-chart
          :labels_xaxis="xlabels"
          :lineTension="lineTension"
          :fill="fill1"
          :dataSetData1="{
            data: data1,
            label: label1,
            borderColor: borderColor1,
          }"
        ></first-chart>

        <q-img v-if="showPlaceholder" fit="fill" src="~/assets/q2-cardImage.png" class="query-img-card"/>
        
        <q-card-section v-if="showVisualization">
          <div>
          <!--this list is for the demo sql query-->
          <q-list bordered separator>
              <q-item v-for="item in dataFromOracle" :key="item.id">
                <q-item-section>{{ item[0] }}</q-item-section>
                <q-item-section>{{ item[1] }}</q-item-section>
                
              </q-item>
            </q-list>
          </div>
        </q-card-section>

      </q-card>
      <div class="q-gutter-md flex justify-center q-mr-lg">
        <q-btn
          size="lg"
          class="glossy"
          rounded
          color="primary" 
          icon="home"
          to="/" 
        />
        <q-btn
          class="glossy"
          rounded
          size="lg"
          color="primary"
          icon="navigate_before"
          to="/queryOne" 
        />
        <q-btn
          class="glossy" 
          rounded
          size="lg"
          color="primary"
          icon-right="navigate_next"
          to="queryThree" 
        />
      </div>
    </div>
    

  </q-page>
</template>

<script>
import firstChart from '../components/firstChart.vue'

export default {
  components: {
    firstChart
  },
  data () {
    return {
      xlabels: [1500, 1600, 1700, 1750, 1800, 1850, 1900, 1950, 1999, 2050],
      lineTension: 0.3,
      fill1: false,
      data1: [86, 114, 106, 106, 107, 111, 133, 221, 783, 2478],
      label1: 'Africa',
      borderColor1: '#3e95cd',


      dataFromOracle: [],
      progress: false,
      year_range: {
        min: 1871,
        max: 2022
      },
      showPlaceholder: true,
      showVisualization: false,
      teams: [],
      team: '',
      current: 2,
    }
  },
  mounted () {

  },
  methods: {
    logProps () {
      console.log(this.dataSetData1)
    },
    async runQuery2 () {
      console.log(this.team)
      this.progress = true;
      
      let response = await fetch(`http://localhost:4000/q2?startYear=${this.year_range.min}&endYear=${this.year_range.max}&team=${this.team}`);
      let data = await response.json();
      this.dataFromOracle = data;
      console.log(data);

      this.progress = false;
      this.showPlaceholder = false;
      this.showVisualization = true;
    },
    reset () {
      this.dataFromOracle = [];
      this.showPlaceholder = true;
      this.showVisualization = false;
      this.year_range.min = 1871;
      this.year_range.max = 2022;
      this.team = '';
    },
    async getTeamsInRange() {
      let response = await fetch(`http://localhost:4000/q2/teams_in_range?startYear=${this.year_range.min}&endYear=${this.year_range.max}`);
      let data = await response.json();
      this.dataFromOracle = data;

      console.log(data);
      console.log(this.year_range.min);
      console.log(this.year_range.max);

      this.teams = data;
    }
  }
}
</script>
