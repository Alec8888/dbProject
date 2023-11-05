<template>
  
  <q-page padding>
    <div class="q-gutter-md">
      <q-card>
        <q-card-section>
          <div class="text-h6">
            Sub title
          </div>
          <div class="text-body1">
            text body...  
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
        
          <q-img v-if="showPlaceholder" fit="fill" src="~/assets/q4-cardImage.png" class="query-img-card"/>
        
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
        <q-card-section class="q-gutter-sm">
          <q-btn
          class="glossy" 
          color="primary" 
          icon="home"
          to="/" 
          />
          <q-btn
          class="glossy" 
          color="primary"
          label="Prev"
          icon="navigate_before"
          to="/queryThree" 
          />
          <q-btn
          class="glossy" 
          color="primary"
          label="Next"
          icon-right="navigate_next"
          to="queryFive" 
          />
        </q-card-section>
      </q-card>
    </div>
  </q-page>
</template>

<script>
export default {
  data () {
    return {
      dataFromOracle: [],
      cityName: 'Tampa',
      country: 'USA',
      progress: false,
      year_range: {
        min: 1871,
        max: 2022
      },
      showPlaceholder: true,
      showVisualization: false
    }
  },
  methods: {
    async runQuery () {
      this.progress = true;
      
      let response = await fetch(`http://localhost:4000/api?name_from_client=${this.cityName}&country_from_client=${this.country}`);
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
    }
  }
}
</script>
