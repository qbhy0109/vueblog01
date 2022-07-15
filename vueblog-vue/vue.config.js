module.exports = {
  // publicPath: '/api',

  // devServer:{
  //   port:8080,
  //   host:'localhost',
  //   open:true,
  //   https:false,
  //   proxy:{
  //     'api':{
  //       target:'http://localhost:8081',   //对应服务器接口地址
  //       ws:true,
  //       changeOrigin:true,
  //       pathRewriter:{
  //         '^/api':''
  //       }
  //     }
  //   }
  // }
  devServer:{
    proxy: 'http://localhost:8081'
  }
}