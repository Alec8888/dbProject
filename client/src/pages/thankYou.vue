<template>
  <q-page padding>

    <div class="q-gutter-md column items-center">
      <q-img  src="~/assets/thanks.png" width="90%">


        <div class="absolute-full transparent">

          <q-list class="absolute-full transparent">
            <q-item to="/" class="absolute-full transparent"></q-item>
          </q-list>
        </div>

      </q-img>
      
      <q-card class="queryCards">
        
        <q-card-section>
          <div class="text-body1">
            {{ description }}
          </div>
          </q-card-section>

      </q-card>

      <q-btn
        size="lg"
        class="glossy"
        rounded
        color="primary" 
        icon="home"
        to="/" 
      />

    </div>
  </q-page>
</template>

<script>
export default {
  data () {
    return {
      title: "Thank you for your feed back!",
      description: "We appreciate your time and effort to help us improve our services."
    }
  }
}
</script>
