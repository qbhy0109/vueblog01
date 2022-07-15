<template>
  <div>
    <Header></Header>

    <div class="mblog">
      <el-button type="primary" @click="edit(blog.id)">
        编辑
      </el-button>
      <el-button type="primary" @click="deleteBlog(blog.id)">
        删除
      </el-button>
      
      <!-- <el-link icon="el-icon-edit" v-if="ownBlog"> -->
      <!-- <router-link :to="{ name: 'BlogEdit', params: { blogId: blog.id } }">
        <el-button type="primary">
          编辑
        </el-button>
      </router-link> -->
      <!-- </el-link> -->

      <!-- <router-link :to="{ name: 'Blogs' }">
        <el-button type="primary" @click="deleteBlog(blog.id)">
          删除
        </el-button>
      </router-link> -->

      <h2> {{ blog.title }}</h2>
      <el-divider></el-divider>

      <!-- <el-button type="primary" @click="submitForm('ruleForm')">立即创建</el-button> -->
      <div class="markdown-body" v-html="blog.content"></div>

    </div>

  </div>
</template>

<script>
import 'github-markdown-css'
import Header from "../components/Header";

export default {
  name: "BlogDetail.vue",
  components: { Header },
  data() {
    return {
      blog: {
        id: "",
        title: "",
        content: ""
      },
      ownBlog: false,
      test: {
        blogId: "12",
      }
    }
  },
  methods: {
    edit(id) {
      this.$router.push("/blog/" + id + "/edit")
    },
    deleteBlog(id) {
      console.log("========" + id + "========")
      // let config = {
      //   headers: { "Content-Type": "text/plain" }
      // };

      this.$confirm('此操作将永久删除该文件, 是否继续?', '提示', {
        confirmButtonText: '确定',
        cancelButtonText: '取消',
        type: 'warning'
      }).then(() => {
        let param = new FormData;
        param.append("blogId", id)
        this.$axios.post("/blog/delete", param).then(res => {
          console.log(res)
          this.$router.push("/blogs")
          this.$message({
            type: 'success',
            message: '删除成功!'
          })
        })
          ;
      })
      // .catch(() => {
      //   this.$message({
      //     type: 'info',
      //     message: '已取消删除'
      //   });
      // });
    },

  },

  created() {
    const blogId = this.$route.params.blogId
    // console.log(blogId)
    const _this = this
    this.$axios.get('/blog/' + blogId).then(res => {
      const blog = res.data.data
      _this.blog.id = blog.id
      _this.blog.title = blog.title

      var MardownIt = require("markdown-it")
      var md = new MardownIt()

      var result = md.render(blog.content)
      _this.blog.content = result
      _this.ownBlog = (blog.userId === _this.$store.getters.getUser.id)

    })
  }
}
</script>

<style scoped>
.mblog {
  box-shadow: 0 2px 12px 0 rgba(0, 0, 0, 0.1);
  width: 100%;
  min-height: 700px;
  padding: 20px 15px;
}
</style>