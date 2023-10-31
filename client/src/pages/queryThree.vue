<template>
  <q-page padding>
    <h1>Foreign-born MLB player</h1>
    <h2>insert here</h2>
    <p>insert here</p>

    <q-btn color="primary" label="Run Visualization" @click="itWasClicked"/>

    <q-btn class="glossy" color="primary" label="Next Visualization" to="queryFour"/>

  </q-page>
</template>

<script>
export default {
  // name: 'PageName',
  methods: {
    itWasClicked () {
      console.log("It was clicked");
    }
  }
}
</script>
