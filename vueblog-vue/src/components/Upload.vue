<template>
<div>
  <div>
    <button @click="showUpload">上传</button>
  </div>

  <div class="upload" v-if="show">
    <input id="inputElement" name="image" type="file" accept="image/*" /> <!-- accept="image/*   接受图片文件-->
    <!-- accept="image/png, image/gif, image/jpeg"   -->
    <button @click="upload">上传</button>
    <!-- todo：修改上传后图片还能连续再次上传的bug -->

    <!-- <el-dropdown split-button type="primary"> -->
    <el-dropdown split-button>
      更多菜单
      <el-dropdown-menu slot="dropdown">
        <el-dropdown-item>黄金糕</el-dropdown-item>
        <el-dropdown-item>狮子头</el-dropdown-item>
        <el-dropdown-item>螺蛳粉</el-dropdown-item>
        <el-dropdown-item>双皮奶</el-dropdown-item>
        <el-dropdown-item>蚵仔煎</el-dropdown-item>
      </el-dropdown-menu>
    </el-dropdown>


    <el-popover placement="bottom" title="标题" width="200" trigger="click" content="这是一段内容。">
      <el-button slot="reference">click 激活</el-button>
    </el-popover>

    <!-- <el-popover placement="top-start" title="标题" width="200" trigger="hover" content="这是一段内容,这是一段内容,这是一段内容,这是一段内容。">
      <el-button slot="reference">hover 激活</el-button>
      <el-avatar :size="64" :src="url"></el-avatar>
    </el-popover> -->

    <el-dropdown>
      <el-avatar :size="64" :src="url"></el-avatar>
      <el-dropdown-menu slot="dropdown">
        <el-dropdown-item target="_blank" href="url">
          <el-link>查看头像</el-link>
        </el-dropdown-item>
        <el-dropdown-item @click="upload">
          <button @click="upload">更改头像</button>
        </el-dropdown-item>
      </el-dropdown-menu>
    </el-dropdown>
  </div>
  </div>
</template>

<script>
// import axios from "axios";

export default {
  data() {
    return {
      show: false,
      file: null,
      url: "http://static.yjzq.online/unknown.jpg"
    };
  },
  methods: {
    showUpload() {
      this.show = !this.show
    },
    upload() {

      let inputElement = document.getElementById("inputElement")
      let file = inputElement.files[0];

      let param = new FormData(); // 创建form对象
      param.append("image", file); // 通过append向form对象添加数据

      //   param.append("chunk", "别的数据"); // 添加form表单中其他数据
      console.log(param.get("image")); // FormData私有类对象，访问不到，可以通过get判断值是否传进去

      let config = {
        headers: { "Content-Type": "multipart/form-data" }
      };

      this.$axios.post("/upload/image", param, config);
    },

  }
};


</script>

<style scoped>
.upload {
  margin: 0 auto;
  text-align: center;
}
</style>