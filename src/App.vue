<template>
  <div id="app">
    <keep-alive>
      <router-view v-if="this.$route.meta.keepAlive" />
      <!--这里是会被缓存的组件-->
    </keep-alive>
    <router-view v-if="!this.$route.meta.keepAlive" />
  </div>
</template>

<script>
export default {
  name: "App",
  data() {
    return {};
  },
};
</script>

<style>
* {
  margin: 0;
  padding: 0;
}

#app {
  font-family: Avenir, Helvetica, Arial, sans-serif;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
  text-align: center;
  color: #2c3e50;
}
</style>
