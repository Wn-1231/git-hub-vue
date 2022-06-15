<template>
  <div id="app">
    <hello msg="xxxxxx"/>
    <h1>
      测试 CI CD  xxx
    </h1>
    <img alt="Vue logo" src="./assets/logo.png">
    <HelloWorld msg="Welcome to Your Vue.js App" />
    <div>
      列表
    </div>
    <li v-for="(user) in users" :key="user.id">
      {{ user.id }}:{{ user.name }}
    </li>
  </div>
</template>

<script>
import axios from 'axios';
import hello from './components/HelloWorld.vue'
export default {
  name: 'app',
  components:{
    hello
  },
  data() {
    return {
      users: []
    }
  },
  mounted() {
    axios.get('http://47.95.114.11:3000/api/users').then(response => {
      this.users = response.data;
    });
  }
}
</script>

<style>
#app {
  font-family: Avenir, Helvetica, Arial, sans-serif;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
  text-align: center;
  color: #2c3e50;
  margin-top: 60px;
}
</style>