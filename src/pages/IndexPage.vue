<template>
  <q-page class="flex flex-center">
    {{ message }}

  <div class="q-pa-md q-gutter-sm">
    <q-btn color="white" text-color="black" @click="clickMe">
      ClickMe
      <q-icon name="save"></q-icon>
    </q-btn>
    <q-btn color="primary" label="Primary" />
    <q-btn color="secondary" label="Secondary" />
    <q-btn color="amber" glossy label="Amber" />
    <q-btn color="brown-5" label="Brown 5" />
    <q-btn color="deep-orange" glossy label="Deep Orange" />
    <q-btn color="purple" label="Purple" />
    <q-btn color="black" label="Black" />
  </div>

  </q-page>
</template>

<script>
import { defineComponent } from 'vue'

export default defineComponent({
  name: 'IndexPage',
  data () {
    return {
      message: 'Hello World!'

    }
  }
  ,
  methods: {
    clickMe () {
      this.message = 'Hello Quasar!'
    }
  }
})
</script>
