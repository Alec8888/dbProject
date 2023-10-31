<template>
  <q-page padding>
    <div class="q-gutter-md">

      <div class="text-h2">
        Title
      </div>
      <div class="text-h4">
          Sub title
      </div>
      <div class="text-body1">
          description body...
      </div>
      <div class="text-h5">
          Methodology:
      </div>
      <div class="text-body1">
        To conduct this analysis...
      </div>
      <div class="text-h5">
          Analysis and Visualization:
      </div>
      <div class="text-body1">
        Such and such is calculated...
      </div>

      <div class="text-h4">
        Input here
      </div>

      <q-btn 
          class="glossy"
          :loading="progress" 
          color="primary" 
          @click="runQuery4"
        >
          Run Visualization
          <template v-slot:loading>
            <q-spinner-gears class="on-left" />
            Calculating...
          </template>
        </q-btn>

        <div class="text-h4">
          Chart Js here
        </div>
  
      <q-btn class="glossy" color="primary" label="Next Visualization" to="queryFour"/>

    </div>
  </q-page>
</template>

<script>
export default {
  name: 'queryFour',
  data () {
    return {
      dataFromOracle: [],
      cityName: 'Tampa',
      country: 'USA',
      progress: false
    }
  },
  methods: {
    async runQuery4 () {
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
