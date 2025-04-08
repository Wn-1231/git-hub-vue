<template>
  <div>
    <h1>测试 CI CD wn tes11t</h1>
    <img alt="Vue logo" src="../../assets/logo.png" />
    <div>列表</div>
    <li v-for="user in users" :key="user.id">{{ user.id }}:{{ user.name }}</li>
  </div>
</template>

<script>
import axios from "axios";

export default {
  name: "app",

  data() {
    return {
      users: [],
    };
  },
  mounted() {
    // setTimeout(() => {
    //   window.ysf("config", {
    //     uid: 11111, // 用户Id
    //     success() {
    //       // 成功回调
    //       // window.ysf("open");
    //     },
    //     error() {},
    //   });
    // }, 3000);
    axios.get("http://47.95.114.11:3000/api/users").then(response => {
      this.users = response.data;
    });
  },
};
</script>

<style></style>
