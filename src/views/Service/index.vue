<template>
  <div class="container">
    <div class="btn" style="background: #bfa" @click="openPage">
      打开访客端页面
    </div>

    <br />
    <div class="btn" @click="openPopup" style="background: red">
      打开访客端页面
    </div>
  </div>
</template>

<script>
export default {
  name:'myHome',
  data() {
    return {
      value: true,
    };
  },
  mounted() {
    setTimeout(() => {
      this.api = window.$53.createApi();
    }, 1000);
  },
  methods: {
    openPage() {
      this.api.push("cmd", "kfclient");
      this.api.push("type", "popup");
      // api.push("group_id", "11");
      //api.push('worker_id', '1006');
      this.api.query();
    },
    openPopup: function () {
      this.api.push("cmd", "kfclient");
      this.api.push("type", "new");
      // api.push("group_id", "11");
      //api.push('worker_id', '1006');
      this.api.query();
    },
  },
};
</script>

<style>
.container {
  padding: 50px;
}
.custom-button {
  width: 26px;
  color: #fff;
  font-size: 10px;
  line-height: 18px;
  text-align: center;
  background-color: #ee0a24;
  border-radius: 100px;
}
</style>
