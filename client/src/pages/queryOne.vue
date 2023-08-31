<template>
  <q-page>
    <h1>Query 1 page</h1>
     <q-list bordered separator>
      <q-item v-for="item in dataFromOracle" :key="item.id">
        <q-item-section>{{ item[0] }}</q-item-section>
        <q-item-section>{{ item[1] }}</q-item-section>
        <q-item-section>{{ item[2] }}</q-item-section>
      </q-item>
    </q-list>

  <div class="q-pa-md q-gutter-sm">
    <q-btn color="white" text-color="black" @click="clickMe">
      ClickMe
      <q-icon name="code"></q-icon>
    </q-btn>
  </div>

  </q-page>
</template>

<script>
import { defineComponent } from 'vue'

export default defineComponent({
  name: 'queryOne',
  data () {
    return {
      dataFromOracle: []

    }
  }
  ,
  methods: {
    async clickMe () {
      let response = await fetch('http://localhost:3000/api');
      let data = await response.json();
      this.dataFromOracle = data;
      console.log(data);
    }
  }
})
</script>
