<template>
  <section class="concat text-dark">
    <div class="container">
      <b-row>
        <b-col lg="6" sm="10" md="10" xs="10" class="wow slideInLeft">
          <dl>
            <h5 style="color: #2a333c!important"><img src="@/assets/img/logo.png" class="mr-2" alt="logo">道源云</h5>
            <div>
              <img style="height: 100px" src="@/static/img/qrcode.jpg" alt="aa">&nbsp;&nbsp;&nbsp;
              <a href="https://myssl.com/daoyuanyun.com?domain=daoyuanyun.com&status=q&hide=1"><img style="height: 100px" src="@/static/img/seal.png" alt="安全认证"></a>
             <img style="height: 40px;margin-top: 20px;margin-left: 10px" src="@/static/img/xinchuang.png" alt="国产认证">
              <h6>&nbsp;&nbsp;&nbsp;微信公众号</h6>
            </div>
<!--            <dd class="text-justify">道源云（简称道源）成立于2020年，是国家级高新技术软件企业，专业从事智能运维、智能系统和智慧城市等领域的产品研发及技术服务；道源云秉持“以人为本、客户至上、生态协作、诚信敬业”的经营理念，从客户实际需求出发，为客户提供行业化的DT、IT设计咨询、方案规划、建设交付、运营维护、综合运营、行业应用软件开发等全方位的解决方案及技术服务。</dd>-->
<!--            <dd>地址： 上海市松江区陶干路701号5幢</dd>-->
<!--            <dd>电话： 025-5180 2988</dd>-->
<!--            <dd>邮箱：1@4b48.com</dd>-->
          </dl>
        </b-col>
        <b-col lg="6" sm="10" xs="10" md="10" class="wow slideInRight">

          <dd class="text-justify">以人为本、客户至上、生态协作、诚信敬业的经营理念，从客户实际需求出发，为客户提供高效的方案规划、建设交付、运营维护、综合运营、行业应用软件开发等全方位的解决方案及技术服务。</dd>
                      <dd>地址：上海市松江区陶干路701号5幢</dd>
                      <dd>邮箱：1@4b48.com</dd>
                      <dd>微信公众号：daoyuanyunzhi</dd>
                      <dd>友情链接：<a class="custom-link" href="https://tongyi.aliyun.com/">通义</a>&emsp;<a class="custom-link" href="https://www.heywhale.com/">和鲸社区</a>&emsp;<a class="custom-link" href="https://aistudio.baidu.com/">百度飞浆</a>&emsp;<a class="custom-link" href="https://blog.csdn.net/">CSDN</a>&emsp;<a class="custom-link" href="https://www.qingcloud.com/">青云科技</a>&emsp;
                      </dd>
        </b-col>
      </b-row>
    </div>
  </section>
</template>

<script>

export default {
  data() {
    return {
      form: {
        name: '',
        phone: '',
        message: ''
      }
    }
  },
  methods: {
  }
}
</script>

<style lang="scss" scoped>
.concat {
  padding: 50px 0;
  .title {
    font-size: 16px;
  }
}
.custom-link {
  color: #0a4b6c; /* 鼠标悬停时文字变为蓝色 */
  text-decoration: none; /* 始终去除下划线 */
  transition: color 0.3s; /* 文字颜色变化平滑过渡 */
}

.custom-link:hover {
  color: #1296db; /* 鼠标悬停时文字变为蓝色 */
}
</style>
