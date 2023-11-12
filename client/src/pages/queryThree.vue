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
        <LineChart
          v-if="showVisualization"
          :chartTitle="chartTitle"
          :xAxisLabels="xAxisLabels"
          :lineTension="smoothCurve"
          :dataSetsY1="dataSetsY1"
          :dataSetsY2="dataSetsY2"
          :yAxis1Title="yAxis1Title"
          :yAxis2Title="yAxis2Title"
        ></LineChart>

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
import LineChart from "../components/LineChart.vue";

export default {
  components: {
    LineChart,
  },
  data() {
    return {
      smoothCurve: 0.5,
      fill1: false,
      yAxis1Title: "Foreign-born Player Percentage(%)",
      yAxis2Title: "Win Percentange(%)",
      xAxisLabels: [],
      chartTitle: "The Effect of Foreign-born Team Percentage on Winning",

      dataSetsY1: [
        {
          data: [],
          label: "",
          borderColor: "#1976D2",
          fill: true,
        },
      ],
      dataSetsY2: [
        {
          data: [],
          label: "",
          borderColor: "#1976D2",
          fill: true,
        },
      ],
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
    };
  },
  mounted() {
    this.setTeamsInRange();
  },
  methods: {
    debug() {
      console.log("debug clicked");
      console.log(this.year_range.min, this.year_range.max);
    },

    updateTeamLabels() {
      this.dataSetsY1[0].label = this.team.value;
    },

    async setTeamsInRange() {
      let response = await fetch(
        `http://localhost:4000/q3/teams_in_range?startYear=${this.year_range.min}&endYear=${this.year_range.max}`
      );
      let data = await response.json();

      console.log(data);
      console.log(this.year_range.min);
      console.log(this.year_range.max);

      this.teams = data.map((item) => ({ label: item[1], value: item[0] }));
    },

    async runQuery() {
      this.showLoading = true;
      this.showVisualization = false;
      console.log(this.year_range.min, this.year_range.max);

      this.updateTeamLabels();

      this.progress = true;

      let response = await fetch(
        `http://localhost:4000/q3?startYear=${this.year_range.min}&endYear=${this.year_range.max}&team=${this.team.value}`
      );
      let data = await response.json();
      this.xAxisLabels = data.map((item) => item[0]);

      this.dataSetsY1[0].data = data.map((item) => item[1]);
      this.dataSetsY2[0].data = data.map((item) => item[2]);

      this.progress = false;
      this.showPlaceHolder = false;
      this.showLoading = false;
      this.showVisualization = true;
    },

    reset() {
      this.showVisualization = false;
      this.year_range.min = 1871;
      this.year_range.max = 2022;
    },
  },
};
</script>
