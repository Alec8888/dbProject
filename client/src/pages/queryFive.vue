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
            :markers=false
            :min="1871"
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
      <chartCard v-if="showVisualization"
        :chartTitle="chartTitle"
        :labels_xaxis="xlabels"
        :lineTension="smoothCurve"
        :fill="fill1"
        :dataSet1="dataSet1"
        :yaxisTitle="yaxisTitle"
      ></chartCard>

      <q-img v-if="!showVisualization" fit="fill" src="~/assets/q5-cardImage.png" class="query-img-card"/>

    </q-card>
    
    <q-card>
      <q-card-section>
        <div class="text-h6">
          Note:
        </div>
        <div class="text-body1">
          Lorem ipsum dolor sit amet consectetur adipisicing elit. Incidunt, praesentium sequi? Perferendis nam fugit, obcaecati incidunt laborum harum sequi cumque doloremque ea, rem facere. Necessitatibus blanditiis adipisci dolor quibusdam sed! 
        </div>
      </q-card-section>
    </q-card>
<!-- 
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
    </q-card> -->

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
      color="primary"
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
import chartCard from '../components/chartCard.vue'

export default {
  components: {
    chartCard
  },
  data () {
    return {
      smoothCurve: 0.5,
      fill1: false,
      yaxisTitle: '% of top 5% regular season HR hitters in Postseason',
      xlabels: [],
      chartTitle: 'Percentage of top 5% HR hitters that reached Postseason',

      dataSet1: {
        data: [],
        label: 'HR',
        borderColor: '#1976D2',
      },

      dataFromOracle: [],
      progress: false,
      year_range: {
        min: 1871,
        max: 2022
      },
      showVisualization: false
    }
  },
  mounted () {
    this.year_range.min = 2000;
  },
  methods: {
    async runQuery () {
      console.log(this.year_range.min, this.year_range.max);

      this.progress = true;
      
      let response = await fetch(`http://localhost:4000/q5?startYear=${this.year_range.min}&endYear=${this.year_range.max}`);
      let data = await response.json();
      this.dataFromOracle = data;
      console.log(data);

      this.dataSet1.data = data.map(item => item[1]);
      this.xlabels = data.map(item => item[0]);

      this.progress = false;
      this.showVisualization = true;

    },
    reset () {
      this.dataFromOracle = [];
      this.showVisualization = false;
      this.year_range.min = 1871;
      this.year_range.max = 2022;
    }
  }
}
</script>
