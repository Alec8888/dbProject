<template>
  <q-page padding>
    <div class="q-gutter-md">
      <div class="text-h2">
        Baseball Statistics Visualizations
      </div>
      
      <div class="text-h4">
        Purpose of this website:
      </div>
      
      <div class="text-body1">The baseball statistics application allows users to explore five different baseball trends over time. The trends focus on team and player statistics and explore questions such as:</div>
      
      <q-list bordered separator>
        <q-item>
          <q-item-section>
            <q-item-label>Runs-to-Outs by Salary Range</q-item-label>
            <q-item-label caption>The connection between runs-to-outs by salary range, which helps explore whether higher paid players tend to have better offensive performance and how this relationship evolves over different seasons</q-item-label>
          </q-item-section>
        </q-item>
        <q-item>
          <q-item-section>
            <q-item-label>Team Spending Per Win</q-item-label>
            <q-item-label caption>Team spending and winning percentage, which sheds light on whether higher team spending translates into more victories</q-item-label>
          </q-item-section>
        </q-item>
        <q-item>
          <q-item-section>
            <q-item-label>Foreign-born MLB Players</q-item-label>
            <q-item-label caption>The distribution of foreign-born MLB players and their relation to team wins/losses, which aims to understand the contributions of increasingly global players</q-item-label>
          </q-item-section>
        </q-item>
        <q-item>
          <q-item-section>
            <q-item-label>Player Hieght and Performance</q-item-label>
            <q-item-label caption>The influence of player height on performance, which addresses questions about whether taller or shorter players have advantages in specific aspects of the game</q-item-label>
          </q-item-section>
        </q-item>
        
        <q-item>
          <q-item-section>
            <q-item-label>Home Runs and Post season</q-item-label>
            <q-item-label caption>The effect homeruns have on the chances of a player appearing in the postseason, which explores whether prolific home run hitters are likely to impact their team’s chances of making it to the postseason.</q-item-label>
          </q-item-section>
        </q-item>
      </q-list>

      <q-btn class="glossy" color="primary" label="Start Here" to="queryOne"/>

    </div>
  </q-page>
</template>

<script>
import { defineComponent } from 'vue'

export default defineComponent({
  name: 'HomePage',
  data () {
    return {

    }
  }
  ,
  methods: {
    
  }
})
</script>
