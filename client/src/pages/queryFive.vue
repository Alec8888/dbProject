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
            name="year_range"
            v-model="year_range"
            label-always
            color="primary"
            :markers="false"
            :min="1903"
            :max="2022"
            :step="1"
            :drag-range="false"
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
          src="~/assets/q5-cardImage.png"
          class="query-img-card"
        />
      </q-card>

      <q-card>
        <q-card-section>
          <div class="text-h6">Note:</div>
          <div class="text-body1">
            Lorem ipsum dolor sit amet consectetur adipisicing elit. Incidunt,
            praesentium sequi? Perferendis nam fugit, obcaecati incidunt laborum
            harum sequi cumque doloremque ea, rem facere. Necessitatibus
            blanditiis adipisci dolor quibusdam sed!
          </div>
        </q-card-section>
      </q-card>

      <div class="q-gutter-md flex justify-center q-mr-lg">
        <q-btn
          class="glossy"
          rounded
          size="lg"
          color="accent"
          icon="home"
          to="/"
        />
        <q-btn
          class="glossy"
          rounded
          size="lg"
          color="accent"
          icon="navigate_before"
          to="/queryThree"
        />
        <q-btn
          class="glossy"
          rounded
          size="lg"
          color="accent"
          icon-right="feedback"
          to="feedback"
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
      year_range: {
        min: 1903, // first year of World Series
        max: 2022,
      },
      progress: false,
      showVisualization: false,
      showPlaceHolder: true,
      showLoading: false,

      smoothCurve: 0.5,
      yaxisTitle: "% of top 5% regular season HR hitters in Postseason",
      xlabels: [],
      chartTitle: "Percentage of top 5% HR hitters that reached Postseason",
      dataSets: [
        {
          data: [],
          label: "Top HR hitters",
          borderColor: "#FFA000",
          fill: "1",
          pointRadius: 0,
        },
        {
          data: [],
          label: "All hitters",
          borderColor: "#1976D2",
          fill: false,
          pointRadius: 0,
        },
      ],
      dataFromOracle: [],
    };
  },
  mounted() {},
  methods: {
    async runQuery() {
      this.showPlaceHolder = false;
      this.showVisualization = false;
      this.showLoading = true;
      console.log(this.year_range.min, this.year_range.max);

      this.progress = true;

      let response = await fetch(
        `http://localhost:4000/q5?startYear=${this.year_range.min}&endYear=${this.year_range.max}`
      );
      let data = await response.json();
      this.dataFromOracle = data;

      console.log(data);

      this.xlabels = data.map((item) => item[0]);
      this.dataSets[0].data = data.map((item) => item[1]);
      this.dataSets[1].data = data.map((item) => item[2]);

      this.progress = false;
      this.showLoading = false;
      this.showVisualization = true;
    },
    reset() {
      this.dataFromOracle = [];
      this.showVisualization = false;
      this.year_range.min = 1871;
      this.year_range.max = 2022;
      this.dataSets.forEach((dataset) => (dataset.data = []));
    },
  },
};
</script>
