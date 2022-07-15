<template>
  <div class="m-content">
    <h3>Welcome</h3>
    <div class="block">
      <!-- <el-avatar :size="64" :src="user.avatar"></el-avatar> -->
      <el-dropdown>
        <el-avatar :size="64" :src="user.avatar"></el-avatar>
        <div v-if="show">
        <el-dropdown-menu slot="dropdown">
          <el-dropdown-item>
            <el-link :href="user.avatar">查看头像</el-link>
          </el-dropdown-item>
          <el-dropdown-item>
            <el-link @click="showUpload">更改头像</el-link>
            <!-- todo：增加删除原来图片功能 -->
          </el-dropdown-item>
        </el-dropdown-menu>
        </div>
        
      </el-dropdown>

      <div>{{ user.username }}</div>

      <div class="upload" v-if="setAvatar">
        <input id="inputElement" name="image" type="file" accept="image/*" /> <!-- accept="image/*   接受图片文件-->
        <!-- accept="image/png, image/gif, image/jpeg"   -->
        <button @click="upload">上传</button>
        <!-- todo：修改上传后图片还能连续再次上传的bug -->
      </div>

    </div>

    <div class="maction">
      <span>
        <el-link href="/blogs">主页</el-link>
      </span>
      <el-divider direction="vertical"></el-divider>
      <span>
        <el-link type="success" href="/blog/add">发表博客</el-link>
      </span>

      <el-divider direction="vertical"></el-divider>
      <span v-show="!hasLogin">
        <el-link type="primary" href="/login">登录</el-link>
      </span>
      <span v-show="hasLogin">
        <el-link type="danger" @click="logout">退出</el-link>
      </span>
    </div>

  </div>
</template>

<script>
export default {
  name: "Header",
  data() {
    return {
      show: false,
      setAvatar:false,
      file: null,

      user: {
        username: '请先登录',
        avatar: 'http://static.yjzq.online/unknown.jpg'
      },
      hasLogin: false
    }
  },
  methods: {
    logout() {
      const _this = this
      console.log('prelogout------' + localStorage.getItem("token"))
      _this.$axios.get("/logout", {
        headers: {
          "token": localStorage.getItem("token")
        }
      }).then(res => {
        _this.$store.commit("REMOVE_INFO")
        _this.$router.push("/login")
        console.log('after------' + localStorage.getItem("token"))
      })
    },

    showUpload() {
      this.setAvatar = !this.setAvatar
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

      this.$axios.post("/user/setAvatar", param, config).then(
        // todo: 重新请求刷新页面
      );
    }
  },
  
  created() {
    if (this.$store.getters.getUser.username) {
      this.user.username = this.$store.getters.getUser.username
      this.user.avatar = this.$store.getters.getUser.avatar

      this.hasLogin = true
      this.show = true
    }

  }
}
</script>

<style scoped>
.m-content {
  max-width: 960px;
  margin: 0 auto;
  text-align: center;
}

.maction {
  margin: 10px 0;
}

.upload {
  margin: 0 auto;
  text-align: center;
}
</style>