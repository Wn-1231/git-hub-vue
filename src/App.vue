<template>
  <ul>
    <h1>
      哈哈改动代码了
    </h1>
    <div>
      列表
    </div>
    <li v-for="(user) in users" :key="user.id">
      {{user.id}}:{{user.name}}
    </li>
  </ul>
</template>

<script>
import axios from 'axios';
export default {
  name: 'app',
  data(){
    return {
      users:[]
    }
  },
  mounted(){
    axios.get('http://47.95.114.11:3000/api/users').then(response=>{
      this.users = response.data;
    });
  }
}
</script>

<style>
</style>