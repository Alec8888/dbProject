<template>
  <q-card class="bg-white full-width">
    <q-card-section class="bg-blue-grey-8">
      <div class="row items-center no-wrap">
        <div class="col">
          <div class="text-h6 text-white text-center">{{ chartTitle }}</div>
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
    chartTitle: String,
    labels_xaxis: Array,
    lineTension: Number,
    fill: Boolean,
    dataSet1: {
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
            lineTension: this.lineTension,
            data: this.dataSet1.data,
            label: this.dataSet1.label,
            borderColor: this.dataSet1.borderColor,
            fill: this.dataSet1.fill,
          }]
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