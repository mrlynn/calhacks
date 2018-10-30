<template>
    <div class="hello">
        <h1>Your IP is {{ ip }}</h1>
        <input type="text" v-model="input.firstname" placeholder="First Name" />
        <input type="text" v-model="input.lastname" placeholder="Last Name" />
        <input type="hidden" v-model="input.ip"/>

        <button v-on:click="sendData()">Send</button>
        <br />
        <br />
        <textarea v-model="response"></textarea>
    </div>
</template>

<script>
import axios from "axios";

export default {
  name: "HelloWorld",
  data() {
    return {
      ip: "",
      input: {
        firstname: "",
        lastname: ""
      },
      response: ""
    };
  },
  mounted() {
    axios({ method: "GET", url: "https://httpbin.org/ip" }).then(
      result => {
        this.ip = result.data.origin;
      },
      error => {
        console.error(error);
      }
    );
  },
  methods: {
    sendData() {
      axios({
        method: "POST",
        url:
          "https://webhooks.mongodb-stitch.com/api/client/v2.0/app/calhacks-ssiva/service/calhacks/incoming_webhook/webhook",
        data: this.input,
        headers: { "content-type": "application/json" }
      }).then(
        result => {
          this.response = result.data;
        },
        error => {
          console.error(error);
        }
      );
    }
  }
};
</script>

<style scoped>
h1,
h2 {
  font-weight: normal;
}

ul {
  list-style-type: none;
  padding: 0;
}

li {
  display: inline-block;
  margin: 0 10px;
}

a {
  color: #42b983;
}

textarea {
  width: 600px;
  height: 200px;
}
</style>