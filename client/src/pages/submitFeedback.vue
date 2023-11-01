<!-- <template>
  <q-page padding>
    <h1>FeedBack</h1>
    <h2></h2>
    <p>Please complete the form below.</p>
  </q-page>
</template>

<script>
export default {
  // name: 'PageName',
}
</script> -->


<template>
  <div class="q-pa-md" style="max-width: 800px">

    <q-form
      action="http://localhost:8000/#/api"
      method="post"
      @submit="onSubmit"
      @reset="onReset"
      class="q-gutter-md"
    >
      <q-input
        filled
        v-model="name"
        label="Your name *"
        color="secondary"
        lazy-rules
        :rules="[ val => val && val.length > 0 || 'Please type something']"
      />

      <q-input
        filled
        type="email"
        v-model="email"
        label="Email address*"
        lazy-rules
        color="secondary"
        :rules="[
          val => val && val.length > 0 || 'Please type something',
          val => /^.+@.+\..+$/.test(val) || 'Please type a valid email'
        ]"
      />

      <div class="text-h6">
        Select all visualizations for which you are leaving feedback:
      </div>

      <q-option-group
        :options="queries"
        type="checkbox"
        v-model="group"
      />

      <q-input
        v-model="feedbackBody"
        label="Write feedback here..."
        filled
        autogrow
      />


      <div>
        <q-btn label="Submit" type="submit" color="primary"/>
        <q-btn label="Reset" type="reset" color="primary" flat class="q-ml-sm" />
      </div>
    </q-form>


  </div>

</template>

<script>
import { useQuasar } from 'quasar'
import { ref } from 'vue'
import { useRouter } from 'vue-router'

export default {
    components: { 
      
     },
    setup() {
        const $q = useQuasar();
        const router = useRouter();
        const name = ref(null);
        const email = ref(null);
        const feedbackBody = ref(null);
        const group = ref([]);


        // define methods here, if any

        return {

            name,
            email,
            group: ref([]),
            queries: [
              { label: "Runs-to-Outs by Salary Range", value: 'q1'},
              { label: "Team Spending Per Win", value: 'q2'},
              { label: "Foreign-born players", value: 'q3'},
              { label: "Player hieght and performance", value: 'q4'},
              { label: "Home Runs & Post Season", value: 'q5'},
            ],

            async onSubmit() {
              console.log(name.value);
              console.log(email.value);
              console.log(feedbackBody.value);
              // log group to console
              console.log(group.value[0]);

              let response = await fetch('http://localhost:8000/#/api', {
                  method: 'POST',
                  body: JSON.stringify({
                      name: name.value,
                      email: email.value,
                      which_queries: group.value // is this right?
                  })
              });

              let formResponse = await response.json();
              if (formResponse.isSuccess) {
                $q.notify({
                      color: 'green-4',
                      textColor: 'white',
                      icon: 'cloud_done',
                      message: 'Form submitted successfully'
                  });

                  // simulate a delay
                  await new Promise(resolve => setTimeout(resolve, 3000));

                  router.push('/thankyou');
              }

      },
            onReset() {
                name.value = null;

            }
        };
    }
}
</script>
