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
          DB Project
        </q-toolbar-title>

        <div>Quasar v{{ $q.version }}</div>
      </q-toolbar>
    </q-header>

    <q-drawer
      v-model="leftDrawerOpen"
      show-if-above
      bordered
    >
      <q-list>
        <q-item-label
          header
        >
          Essential Links
        </q-item-label>

        <EssentialLink
          v-for="link in essentialLinks"
          :key="link.title"
          v-bind="link"
        />
      </q-list>
    </q-drawer>

    <q-page-container>
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
    caption: 'Sign in or register',
    icon: 'code',
    link: '#/'
  },
  {
    title: 'Query 1',
    caption: 'caption 1',
    icon: 'school',
    link: '#/queryOne'
  },
  {
    title: 'Query 2',
    caption: 'caption 2',
    icon: 'code',
    link: '#/queryTwo'
  },
  {
    title: 'Query 3',
    caption: 'caption 3',
    icon: 'chat',
    link: '#/'
  },
  {
    title: 'Query 4',
    caption: 'caption 4',
    icon: 'record_voice_over',
    link: '#/'
  },
  {
    title: 'Query 5',
    caption: 'caption 5',
    icon: 'rss_feed',
    link: '#/'
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
