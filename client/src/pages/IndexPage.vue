<template>
  <q-page padding>
    <div class="text-h2 q-pa-md">
      Baseball Statistics Visualizations
    </div>
    <div class="text-h3 q-pa-md">
      Purpose of this website:
    </div>
    <div class="q-pa-md text-body1">The baseball statistics application allows users to explore five different baseball trends over time. The trends focus on team and player statistics and explore questions such as:</div>

    <div class="q-pa-md" >
      <q-list bordered separator>

        <q-item clickable v-ripple>
          <q-item-section>
            <q-item-label>Runs-to-Outs by Salary Range</q-item-label>
            <q-item-label caption>The connection between runs-to-outs by salary range, which helps explore whether higher paid players tend to have better offensive performance and how this relationship evolves over different seasons</q-item-label>
          </q-item-section>
        </q-item>

        <q-item clickable v-ripple>
          <q-item-section>
            <q-item-label>Team Spending Per Win</q-item-label>
            <q-item-label caption>Team spending and winning percentage, which sheds light on whether higher team spending translates into more victories</q-item-label>
          </q-item-section>
        </q-item>

        <q-item clickable v-ripple>
          <q-item-section>
            <q-item-label>Foreign-born MLB Players</q-item-label>
            <q-item-label caption>The distribution of foreign-born MLB players and their relation to team wins/losses, which aims to understand the contributions of increasingly global players</q-item-label>
          </q-item-section>
        </q-item>

        <q-item clickable v-ripple>
          <q-item-section>
            <q-item-label>Player Hieght and Performance</q-item-label>
            <q-item-label caption>The influence of player height on performance, which addresses questions about whether taller or shorter players have advantages in specific aspects of the game</q-item-label>
          </q-item-section>
        </q-item>
        
        <q-item clickable v-ripple>
          <q-item-section>
            <q-item-label>Home Runs and Post season</q-item-label>
            <q-item-label caption>The effect homeruns have on the chances of a player appearing in the postseason, which explores whether prolific home run hitters are likely to impact their team’s chances of making it to the postseason.</q-item-label>
          </q-item-section>
        </q-item>
      

      </q-list>
    </div>

      
    <q-list bordered separator>
      <q-item v-for="item in dataFromOracle" :key="item.id">
        <q-item-section>{{ item[0] }}</q-item-section>
        <q-item-section>{{ item[1] }}</q-item-section>
        <q-item-section>{{ item[2] }}</q-item-section>
      </q-item>
    </q-list>

    <div class="q-pa-md q-gutter-sm">
      <q-btn color="positive" text-color="white" @click="clickMe">
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
