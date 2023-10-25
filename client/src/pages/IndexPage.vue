<template>
  <q-page padding>
    <h1>Baseball Statistics Visualizations</h1>
    <h2>Purpose of this website:</h2>
    <p>The baseball statistics application allows users to explore five different baseball trends over time. The trends focus on team and player statistics and explore questions such as:</p>
    
    <ul>
      <li>The connection between runs-to-outs by salary range, which helps explore whether higher paid players tend to have better offensive performance and how this relationship evolves over different seasons</li>
      <li>Team spending and winning percentage, which sheds light on whether higher team spending translates into more victories</li>
      <li>The distribution of foreign-born MLB players and their relation to team wins/losses, which aims to understand the contributions of increasingly global players</li>
      <li>The influence of player height on performance, which addresses questions about whether taller or shorter players have advantages in specific aspects of the game</li>
      <li>The effect homeruns have on the chances of a player appearing in the postseason, which explores whether prolific home run hitters are likely to impact their team’s chances of making it to the postseason.</li>
    </ul>

      
    <q-list bordered separator>
      <q-item v-for="item in dataFromOracle" :key="item.id">
        <q-item-section>{{ item[0] }}</q-item-section>
        <q-item-section>{{ item[1] }}</q-item-section>
        <q-item-section>{{ item[2] }}</q-item-section>
      </q-item>
    </q-list>

    <div class="q-pa-md q-gutter-sm">
      <q-btn color="green" text-color="white" @click="clickMe">
        Start Here
      </q-btn>
    </div>

  </q-page>
</template>

<script>
import { defineComponent } from 'vue'

export default defineComponent({
  name: 'IndexPage',
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
