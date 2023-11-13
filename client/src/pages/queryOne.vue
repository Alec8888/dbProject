<template>
  <q-page padding>
    <div class="q-gutter-md">
      <q-card>
        <q-card-section>
          <div class="text-h6">
            Exploring the Impact of Salaries on Performance
          </div>
          <div class="text-body1">
            This section delves into how a player's salary can influence their
            offensive performance over time. It’s critical to examine the
            efficiency of players in terms of their ability to score and bring
            in runs, in relation to the number of outs. This analytical approach
            takes into account different salary ranges, categorizing them as
            high, medium, and low based on specific percentiles.
          </div>
        </q-card-section>
      </q-card>
      <q-card>
        <q-card-section>
          <div class="text-h6">Methodology</div>
          <div class="text-body1">
            To conduct this analysis, we categorize players into different
            salary brackets. Players earning at or above the 75th percentile are
            considered in the high salary range. Those in the middle 50% (25th
            to 75th percentile) fall into the medium category, while those below
            the 25th percentile are deemed to be in the low salary bracket.
          </div>
        </q-card-section>
      </q-card>
      <q-card>
        <q-card-section>
          <div class="text-h6">Analysis and Visualization</div>
          <div class="text-body1">
            The study calculates the average of certain performance metrics
            (such as home runs, batting average, and strikeouts) for all players
            within each salary bracket. These averages are then plotted over
            multiple MLB seasons (spanning from 2000 to 2020) to visualize
            trends and derive insights on the correlation between salary and
            performance.
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
            :markers="true"
          />
        </q-card-section>
        <q-card-section>
          <q-btn
            class="glossy"
            :loading="progress"
            color="accent"
            @click="runQuery1"
            label="Run Visualization"
          >
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
        <q-img
          v-if="showPlaceholder"
          fit="fill"
          src="~/assets/q1-cardImage.png"
          class="query-img-card"
        />

        <q-card-section v-if="showVisualization">
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
      </q-card>

      <div class="q-gutter-md flex justify-center q-mr-lg">
        <q-btn
          class="glossy"
          rounded
          size="lg"
          color="primary"
          icon="home"
          to="/"
        />
        <q-btn
          class="glossy"
          rounded
          size="lg"
          color="accent"
          icon-right="navigate_next"
          to="queryTwo"
        />
      </div>
    </div>
  </q-page>
</template>

<script>
export default {
  data() {
    return {
      current: 1,
      dataFromOracle: [],
      cityName: "Tampa",
      country: "USA",
      progress: false,
      year_range: {
        min: 1871,
        max: 2022,
      },
      showPlaceholder: true,
      showVisualization: false,
    };
  },
  methods: {
    async runQuery1() {
      this.progress = true;
      let response = await fetch(
        `http://localhost:4000/api?name_from_client=${this.cityName}&country_from_client=${this.country}`
      );
      let data = await response.json();
      this.dataFromOracle = data;
      console.log(data);
      this.progress = false;
      this.showPlaceholder = false;
      this.showVisualization = true;
    },
    reset() {
      this.dataFromOracle = [];
      this.showPlaceholder = true;
      this.showVisualization = false;
      this.year_range.min = 1871;
      this.year_range.max = 2022;
    },
  },
};
</script>
