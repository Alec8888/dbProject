<template>
  <q-card class="bg-white full-width">
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

    yAxisTitle2: String,
    yAxisDisplay: Boolean,

    labels_xaxis: Array,
    lineTension: Number,
    dataSets: Array,
    backgroundColor: String,
    fill: String,
    pointsRadius: Number,
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
            fill: dataSet.fill,
            label: dataSet.label,
            data: dataSet.data,
            borderColor: dataSet.borderColor,
            backgroundColor: dataSet.backgroundColor,
            pointRadius: dataSet.pointRadius,
            yAxisID: dataSet.label === 'Team wins' || dataSet.label === 'All Teams Wins' ? 'y1' : undefined,
          })),
        },
        options: {
          responsive: true,
          animation: {
            duration: 1000,
            easing: 'linear',
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
            ...(this.yAxisTitle2 ? {
              y1: {
                id: 'y1',
                display: true,
                position: 'right',
                title: {
                  display: true,
                  text: this.yAxisTitle2
                },
                min: 0,
                
                grid: {
                  drawOnChartArea: false, // only want the grid lines for one axis to show up
                },
              }
            } : {})
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