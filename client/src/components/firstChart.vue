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
      <canvas id="line-chart"></canvas>
    </q-card-section>
  </q-card>
</template>

<script>
import Chart from 'chart.js/auto'

export default {
  props: {
    labels_xaxis: Array,
    lineTension: Number,
    fill: Boolean,
    dataSetData1: {
      data: Array,
      label: String,
      borderColor: String,
    }

  },
  data () {
    return {

    }
  },
  mounted () {
    this.createChart('line-chart')
  },
  methods: {
    createChart (chartId) {
      const ctx = document.getElementById(chartId)
      const myChart = new Chart(ctx, {
        type: 'line',
        data: {
          labels: this.labels_xaxis,
          datasets: [{
            data: this.dataSetData1.data,
            label: this.dataSetData1.label,
            borderColor: this.dataSetData1.borderColor,
            fill: this.dataSetData1.fill,
            lineTension: this.dataSetData1.lineTension
          }, {
            data: [282, 350, 411, 502, 635, 809, 947, 1402, 3700, 5267],
            label: 'Asia',
            borderColor: '#8e5ea2',
            fill: this.fill,
            lineTension: this.lineTension
          }, {
            data: [168, 170, 178, 190, 203, 276, 408, 547, 675, 734],
            label: 'Europe',
            borderColor: '#3cba9f',
            fill: this.fill,
            lineTension: 0
          }, {
            data: [40, 20, 10, 16, 24, 38, 74, 167, 508, 784],
            label: 'Latin America',
            borderColor: '#e8c3b9',
            fill: this.fill,
            lineTension: 0
          }, {
            data: [6, 3, 2, 2, 7, 26, 82, 172, 312, 433],
            label: 'North America',
            borderColor: '#c45850',
            fill: this.fill,
            lineTension: 0
          }
          ]
        },
        options: {
          legend: {
            display: true
          },
          title: {
            display: true,
            text: 'World population per region (in millions)'
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