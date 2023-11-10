<template>
  <q-card class="bg-white full-width">
    <!-- <q-card-section class="bg-blue-grey-8">
      <div class="row items-center no-wrap">
        <div class="col">
          <div class="text-h6 text-white text-center">{{ chartTitle }}</div>
        </div>
      </div>
    </q-card-section> -->
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
    yaxisTitle: String,
    labels_xaxis: Array,
    lineTension: Number,
    dataSets: Array,
    backgroundColor: String,
    fill: String,
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
          datasets: this.dataSets.map(dataSet => ({ 
            lineTension: this.lineTension,
            tension: 0.1,
            fill: dataSet.fill,
            label: dataSet.label,
            data: dataSet.data,
            borderColor: dataSet.borderColor,
            backgroundColor: dataSet.backgroundColor,
          })),
        },
        options: {
          responsive: true,
          animation: {
            duration: 4000, 
          },
          interaction: {
            intersect: false,
            mode: 'index',
          },
          scales: {
            x: {
              display: true,
              title: {
                display: true,
                text: 'Seasons'
              }
            },
            y: {
              title: {
                display: true,
                text: this.yaxisTitle
              },
              ticks: {
                
              }
            },
          },
          plugins: {
            title: {
              display: true,
              text: this.chartTitle,
            },
            legend: {
              display: true
            },
            
          },
        }
      })
      return myChart
    }
  }
}
</script>

<style>
</style>