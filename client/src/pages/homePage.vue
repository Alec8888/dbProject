<template>
  <!-- class="bg-image" -->
  <q-page padding class="bg-image">
    <q-btn class="glossy q-my-sm" color="primary" label="Start Here" to="queryOne"/>

    <div class="row q-gutter-md">

      <q-card class="queryCards">
        <q-img fit="cover" src="~/assets/q1-cardImage.png" class="query-img-card">
          <div class="absolute-bottom text-h6">
            {{ q1_title }}
          </div>
        </q-img>

        <q-card-section>
          {{ q1_description }}
        </q-card-section>
      </q-card>

      <q-card fit="contain" class="queryCards" >
        <q-img src="~/assets/q2-cardImage.png" class="query-img-card">
          <div class="absolute-bottom text-h6">
            {{ q2_title }}
          </div>
        </q-img>

        <q-card-section>
          {{ q2_description }}
        </q-card-section>
      </q-card>

      <q-card class="queryCards">
        <q-img src="~/assets/q3-cardImage1.png" class="query-img-card">
          <div class="absolute-bottom text-h6">
            {{ q3_title }}
          </div>
        </q-img>

        <q-card-section>
          {{ q3_description }}
        </q-card-section>
      </q-card>

      <q-card class="queryCards">
        <q-img src="~/assets/q4-cardImage.png" class="query-img-card">
          <div class="absolute-bottom text-h6">
            {{ q4_title }}
          </div>
        </q-img>

        <q-card-section>
          {{ q4_description }}
        </q-card-section>
      </q-card>

      <q-card class="queryCards">
        <q-img src="~/assets/q5-cardImage.png" class="query-img-card">
          <div class="absolute-bottom text-h6">
            {{ q5_title }}
          </div>
        </q-img>

        <q-card-section>
          {{ q5_description }}
        </q-card-section>
      </q-card>
    </div>


  </q-page>
</template>

<script>
import { defineComponent } from 'vue'

export default defineComponent({
  name: 'HomePage',
  data () {
    return {
        q1_title: 'Runs-to-Outs by Salary Range',
        q1_description: 'The connection between runs-to-outs by salary range, which helps explore whether higher paid players tend to have better offensive performance and how this relationship evolves over different seasons',
        q2_title: 'Team Spending Per Win',
        q2_description: 'Team spending and winning percentage, which sheds light on whether higher team spending translates into more victories',
        q3_title: 'Foreign-born Wins/Losses',
        q3_description: 'The distribution of foreign-born MLB players and their relation to team wins/losses, which aims to understand the contributions of increasingly global players',
        q4_title: 'Player Hieght and Performance',
        q4_description: 'The influence of player height on performance, which addresses questions about whether taller or shorter players have advantages in specific aspects of the game',
        q5_title: 'Home Runs and Post season',
        q5_description: 'The effect homeruns have on the chances of a player appearing in the postseason, which explores whether prolific home run hitters are likely to impact their team’s chances of making it to the postseason.',
      }
  }
  ,
  methods: {
    
  }
})
</script>

<style >
  .bg-image {
    background-image: url('C:/dev/dbProject/client/src/assets/bg4.png');
    background-size: fit;
  }
  .text.color {
    color: black;
  }
  .queryCards
  {
    width: 100%;
    max-width: 350px;
    
  }
  /* .query-img-card {
    height: 200px;
  } */
</style>
