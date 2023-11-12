<template>
  <q-card class="bg-white full-width">
    <q-card-section>
      <canvas id="line-chart"></canvas>
    </q-card-section>
  </q-card>
</template>

<script>
import Chart from "chart.js/auto";

export default {
  props: {
    chartTitle: String,
    yAxis1Title: String,
    yAxis2Title: String,
    xAxisLabels: Array,
    lineTension: Number,
    dataSetsY1: Array,
    dataSetsY2: Array,
    backgroundColor: String,
    fill: String,
  },
  data() {
    return {};
  },
  mounted() {
    this.createChart("line-chart");
  },
  methods: {
    createChart(chartId) {
      const ctx = document.getElementById(chartId);
      const myChart = new Chart(ctx, {
        type: "line",
        data: {
          labels: this.xAxisLabels,
          datasets: [
            {
              label: "Percentage of Team Foreign Born",
              data: this.dataSetsY1[0].data,
            },
            {
              label: "Winning Percentage",
              data: this.dataSetsY2[0].data,
            },
          ],
        },
        options: {
          responsive: true,
          animation: {
            duration: 4000,
          },
          interaction: {
            intersect: false,
            mode: "index",
          },
          scales: {
            x: {
              display: true,
              title: {
                display: true,
                text: "MLB Season",
              },
            },
            y: {
              title: {
                display: true,
                text: this.yAxis1Title,
              },
              type: "linear",
              display: true,
              position: "left",
            },
            y1: {
              title: {
                display: true,
                text: this.yAxis2Title,
              },
              type: "linear",
              display: true,
              position: "right",

              // grid line settings
              grid: {
                drawOnChartArea: false, // only want the grid lines for one axis to show up
              },
            },
          },
          plugins: {
            title: {
              display: true,
              text: this.chartTitle,
            },
            legend: {
              display: true,
            },
          },
        },
      });
      return myChart;
    },
  },
};
</script>

<style></style>
