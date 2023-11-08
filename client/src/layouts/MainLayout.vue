<template>
  <q-layout view="lHh Lpr lFf">
    <q-header elevated>
      <q-toolbar>
        <q-btn
          flat
          dense
          round
          icon="menu"
          aria-label="Menu"
          @click="toggleLeftDrawer"
        />

        <q-toolbar-title>
          {{ $route.meta.title }}
        </q-toolbar-title>

        <div>Fall 2023 - CIS4301 - Group 15</div>
      </q-toolbar>
    </q-header>

    <q-drawer
      v-model="leftDrawerOpen"
      bordered
    >
      <q-list>
        <q-item-label
          header
        >
          Navigation
        </q-item-label>

        <EssentialLink
          v-for="link in essentialLinks"
          :key="link.title"
          v-bind="link"
        />
      </q-list>
    </q-drawer>

    <q-page-container class="bg-image">
      <router-view />
    </q-page-container>
  </q-layout>
</template>

<script>
import { defineComponent, ref } from 'vue'
import EssentialLink from 'components/EssentialLink.vue'

const linksList = [
  {
    title: 'Home',
    caption: 'Baseball Statistics Visualizations',
    icon: 'home',
    link: '#/'
  },
  {
    title: 'Query 1',
    caption: 'Runs-to-Outs by Salary range',
    icon: 'sports_baseball',
    link: '#/queryOne'
  },
  {
    title: 'Query 2',
    caption: 'Team Spending Per Win',
    icon: 'sports_baseball',
    link: '#/queryTwo'
  },
  {
    title: 'Query 3',
    caption: 'Foreign-born MLB player distributions',
    icon: 'sports_baseball',
    link: '#/queryThree'
  },
  {
    title: 'Query 4',
    caption: 'Player Height & Performance',
    icon: 'sports_baseball',
    link: '#/queryFour'
  },
  {
    title: 'Query 5',
    caption: 'Home Runs & Post Season',
    icon: 'sports_baseball',
    link: '#/queryFive'
  }
]

export default defineComponent({
  name: 'MainLayout',

  components: {
    EssentialLink
  },

  setup () {
    const leftDrawerOpen = ref(false)

    return {
      essentialLinks: linksList,
      leftDrawerOpen,
      toggleLeftDrawer () {
        leftDrawerOpen.value = !leftDrawerOpen.value
      }
    }
  }
})
</script>

<style >
  .bg-image {
    background-image: url('C:/dev/dbProject/client/src/assets/bg1.png');
    background-size: fit;
  }

</style>