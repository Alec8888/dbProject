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
      <q-btn  color="red" @click="debug">debug</q-btn>
      <q-card>

        <chartQ2 v-if="showVisualization"
          :labels_xaxis="xlabels"
          :lineTension="smoothCurve"
          :fill="fill1"
          :dataSet1="dataSet1"
        ></chartQ2>

        <q-img v-if="!showVisualization" fit="fill" src="~/assets/q2-cardImage.png" class="query-img-card"/>
        
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
import chartQ2 from '../components/chartQ2.vue'

export default {
  components: {
    chartQ2
  },
  data () {
    return {
      smoothCurve: 0.5,
      fill1: false,
      xlabels: [],

      dataSet1: {
        data: [],
        label: '',
        borderColor: '#3e95cd',
      },
        
      dataFromOracle: [],
      progress: false,
      year_range: {
        min: 1871,
        max: 2022
      },
      showVisualization: false,
      teams: [],
      team: '',
      current: 2,
    }
  }
  ,
  // computed: {
  //   xlabels() {
  //   return this.generateYears(this.year_range.min, this.year_range.max);
  // }
  // },
  mounted () {

  },
  methods: {
    // not using this yet
    generateYears(start, end) {
      let years = [];
      for (let year = start; year <= end; year += 1) {
        years.push(year);
      }
      return years;
    },
    debug () {
      console.log("debug clicked")
      console.log(this.year_range.min, this.year_range.max);
      console.log(this.team);
    },
    async runQuery2 () {
      console.log(this.team)
      console.log(this.year_range.min, this.year_range.max);

      this.dataSet1.label = this.team; // to do

      this.xlabels = this.generateYears(this.year_range.min, this.year_range.max);



      this.progress = true;
      
      let response = await fetch(`http://localhost:4000/q2?startYear=${this.year_range.min}&endYear=${this.year_range.max}&team=${this.team}`);
      let data = await response.json();
      this.dataFromOracle = data;
      console.log(data);

      this.dataSet1.data = data.map(item => item[1]);

      this.progress = false;
      this.showPlaceholder = false;
      this.showVisualization = true;
    },
    reset () {
      this.dataFromOracle = [];
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
