<template>
  <q-card class="bg-white full-width">
    <q-card-section class="bg-blue-grey-8">
      <div class="row items-center no-wrap">
        <div class="col">
          <div class="text-h6 text-white text-center">Line Chart</div>
        </div>
      </div>
    </q-card-section>
    <q-card-section>
      <canvas id="bar-chart"></canvas>
    </q-card-section>
  </q-card>
</template>

<script>
import Chart from 'chart.js/auto'

export default {
  props: {
    tupleCount: String,

  },
  data () {
    return {

    }
  },
  mounted () {
    this.createChart('bar-chart')
  },
  methods: {
    createChart (chartId) {
      const ctx = document.getElementById(chartId)
      const myChart = new Chart(ctx, {
        type: 'bar',
        data: this.tupleCount,
        options: {
          legend: {
            display: true
          },
          title: {
            display: true,
            text: 'total tuples in database'
          }
        }
      })
      return myChart
    }
  }
}
</script>

<style>
</style>