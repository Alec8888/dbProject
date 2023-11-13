<template>
  <q-page padding>
    <div class="q-gutter-md">
      <q-card>
        <q-card-section>
          <div class="text-h6">
            Select a range of seasons and click the run visualization button.
          </div>
        </q-card-section>
        <q-card-section>
          <q-range
            @change="setTeamsInRange"
            name="year_range"
            v-model="year_range"
            label-always
            color="primary"
            :markers="false"
            :min="1985"
            :max="2016"
            :step="1"
            :drag-range="false"
          />
        </q-card-section>

        <q-card-section>
          <q-select
            outlined
            v-model="team"
            :options="teams"
            label="Select a team"
          />
        </q-card-section>
        <!-- <q-card-section>
          <q-select outlined v-model="team2" :options="teams" label="Optionally select a seond team"/>
        </q-card-section> -->

        <q-card-section>
          <q-btn
            class="glossy"
            :loading="progress"
            color="accent"
            @click="runQuery"
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

      <q-card>
        <q-linear-progress
          v-if="showLoading"
          indeterminate
          rounded
          size="20px"
          color="secondary"
        />
        <chartCard
          v-if="showVisualization"
          :chartTitle="chartTitle"
          :labels_xaxis="xlabels"
          :lineTension="smoothCurve"
          :dataSets="dataSets"
          :yaxisTitle="yaxisTitle"
        ></chartCard>

        <q-img
          v-if="showPlaceHolder"
          fit="fill"
          src="~/assets/q2-cardImage.png"
          class="query-img-card"
        />
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
          color="accent"
          icon-right="navigate_next"
          to="queryThree"
        />
      </div>
    </div>
  </q-page>
</template>

<script>
import chartCard from "../components/chartCard.vue";

export default {
  components: {
    chartCard,
  },
  data() {
    return {
      smoothCurve: 0.5,
      fill1: false,
      yaxisTitle: "Salary per Win",
      xlabels: [],
      chartTitle: "Team Salary per Win",

      dataSets: [
        {
          data: [],
          label: "",
          borderColor: "#1976D2",
          fill: true,
        },
      ],

      dataFromOracle: [],
      progress: false,
      year_range: {
        min: 1985,
        max: 2016,
      },
      showVisualization: false,
      showPlaceHolder: true,
      showLoading: false,
      teams: [
        {
          label: "",
          value: "",
        },
      ],
      team: {
        label: "",
        value: "",
      },
      current: 2,
      team2: "",
    };
  },
  mounted() {
    this.setTeamsInRange();
  },
  methods: {
    debug() {
      console.log("debug clicked");
      console.log(this.year_range.min, this.year_range.max);
      console.log(this.team);
      console.log(this.team2);
    },
    updateTeamLabels() {
      for (let i = 1; i <= this.dataSets.length; i++) {
        this.dataSets[i - 1].label = this.team.value;
      }
    },
    async setTeamsInRange() {
      let response = await fetch(
        `http://localhost:4000/q2/teams_in_range?startYear=${this.year_range.min}&endYear=${this.year_range.max}`
      );
      let data = await response.json();
      this.dataFromOracle = data;

      console.log(data);
      console.log(this.year_range.min);
      console.log(this.year_range.max);

      this.teams = data.map((item) => ({ label: item[1], value: item[0] }));
    },
    async runQuery() {
      this.showLoading = true;
      this.showVisualization = false;
      console.log(this.team);
      console.log(this.team2);
      console.log(this.year_range.min, this.year_range.max);

      this.updateTeamLabels();

      this.progress = true;

      let response = await fetch(
        `http://localhost:4000/q2?startYear=${this.year_range.min}&endYear=${this.year_range.max}&team=${this.team.value}`
      );
      let data = await response.json();
      this.dataFromOracle = data;
      console.log(data);

      this.xlabels = data.map((item) => item[0]);
      for (let i = 1; i <= this.dataSets.length; i++) {
        this.dataSets[i - 1].data = data.map((item) => item[i]);
      }

      this.progress = false;
      this.showPlaceHolder = false;
      this.showLoading = false;
      this.showVisualization = true;
    },
    reset() {
      this.dataFromOracle = [];
      this.showVisualization = false;
      this.year_range.min = 1871;
      this.year_range.max = 2022;
      this.team = "";
      this.team2 = "";
    },
  },
};
</script>
