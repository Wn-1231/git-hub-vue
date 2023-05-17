<template>
  <div id="app">
    <div id="pdfContainerRef"></div>
    <videoList :videos="videos" :obj="obj"></videoList>

    <button @click="addVideo1">添加视频</button>
    <button @click="addVideo2">添加视频</button>
    <button @click="addVideo3">添加视频</button>
  </div>
</template>

<script>
import videoList from "@/components/video-list.vue";

import posthtml from "posthtml";
const a = `<h1>个人信息保护指引</h1>`;

const styleConfig = {
  h1: "title",
  h2: "subtitle",
  p: "paragraph",
  ol: "order-list",
  ul: "unordered-list",
  li: "list-item",
};
export default {
  name: "swiper-example-pagination-custom",
  title: "Custom pagination",
  components: {
    videoList,
  },
  data() {
    return {
      obj: {
        list: [{ a: 1 }],
      },
      videos: [
        "http://clips.vorwaerts-gmbh.de/big_buck_bunny.mp4",
        // "https://vod.pipi.cn/fe5b84bcvodcq1251246104/7e3ad6f55285890797987579689/f0.mp4",
        // "http://www.w3school.com.cn/example/html5/mov_bbb.mp4",
        // "http://vjs.zencdn.net/v/oceans.mp4",
      ],
    };
  },
  mounted() {
    posthtml()
      .process(a)
      .then((res) => {
        this.htmlStr = this.getRichTextNodes(res.tree);

        console.log(" this.htmlStr", this.htmlStr);
      });
  },
  methods: {
    getRichTextNodes(tree) {
      return tree.reduce((pre, item) => {
        if (typeof item === "string") {
          return pre + item;
        }
        const { tag, content } = item;
        if (!tag || !content) return pre;
        return `${pre}<${tag}  class="${
          styleConfig[tag] ? styleConfig[tag] : ""
        }">${
          Array.isArray(content) && this.getRichTextNodes(content)
        }</${tag}>`;
      }, "");
    },
    addVideo1() {
      this.videos.push("http://clips.vorwaerts-gmbh.de/big_buck_bunny.mp4");
    },
    addVideo2() {
      this.videos.push(
        "https://vod.pipi.cn/fe5b84bcvodcq1251246104/7e3ad6f55285890797987579689/f0.mp4"
      );
    },
    addVideo3() {
      this.videos.push("http://www.w3school.com.cn/example/html5/mov_bbb.mp4");
    },
  },
};
</script>

<style></style>
