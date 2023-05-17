<template>
  <div class="container">
    <div >53 自定义功能扩展 test</div>

    <br>

    <div @click="sentMsg" style="background: red">发送信息</div>
  </div>
</template>

<script>
export default {
  name: "myHome",
  data() {
    return {
      value: true,
    };
  },
  create() {
    //用来接收53给自定义界面的事件
    function cmd_to_user(jsonstr) {
      console.log("接收53给自定义信息", jsonstr);
    }
    window.cmd_to_user = cmd_to_user;
  },
  methods: {
    sentMsg() {
      //用来将事件发送给53，比如调53方法发送在线客服消息
      var data =
        '{"cmd":"to_53","content":{"action":"send_msg","type":"online","msg_type":"text","msg":"xxxxxx","gid":"xxxxxx"}}';
      window.mbQuery(0x123456, data);
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
