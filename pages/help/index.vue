<template>
  <section style="background-image: url('https://cloudplatform.daoyuanyun.com/fileStorage/group1/M00/00/05/rBIAA2Zix3-AXdTeAAR_J1LXhvE987.png')">
    <div style="height: 158px"></div>
    <div class="container py-5">
      <h4 class="title mb-2" >你想得出，道源助你做得到</h4>
      <div style="height: 30px"></div>
      <p class="detail1 mb-5 text-justify">激发无限创意，将你的构想变为现实 </p>
      <div style="height: 70px"></div>
      <b-row>
        <b-col cols="10" offset="1">
         <b-card no-body class="mb-5"
            v-for="(item, index) of productList"
            :key="index"
          > <a :href="'https://help.daoyuanyun.com/'" style="color: #1a1a1a;text-decoration: none;">
           <!-- 卡片内容保持不变 -->
            <b-row class="content" no-gutters>
              <i class="top"></i>
              <i class="bottom"></i>
              <b-col md="5"
                :data-wow-delay="(0.2 * index) + 's'"
                :offset-md="index === 1 ? 1 : 0" :order="index == 1 ? 1 : 0"
              >
                <b-card-img :src="item.icon" height="300" fluid class="rounded-0 picture" :class="{special: index == 1}"></b-card-img>
              </b-col>
              <b-col
                :data-wow-delay="(0.2 * index) + 's'"
                :offset-md="index === 1 ? 0 : 1" md="6"
                :order="index == 1 ? 0 : 1"
              >
                <b-card-body class="h-100 d-flex justify-content-center align-items-center flex-column text-center">
                  <b-card-title>{{item.title}}</b-card-title>
                  <b-card-text class="w-100">{{item.desc}}</b-card-text>
<!--                  <b-button variant="outline-info"-->
<!--                    @click="$router.push('/business/'+item.id)"-->
<!--                  >查看详情</b-button>-->
                </b-card-body>
              </b-col>
            </b-row></a>
          </b-card>
        </b-col>
      </b-row>
    </div>
  </section>
</template>

<script>
if (process.browser) { // 在这里根据环境引入wow.js
  var {WOW} = require('wowjs')
}

export default {
  data() {
    return {
      productList: [
        {id: 1, icon: require('~/static/img/business/阅读资料.png'), title: '使用指南', desc: '欢迎来到使用指南。本文档旨在提供一个详细的指南，帮助你了解如何使用道源云和道源智造进行应用开发。'},
        {id: 2, icon: require('~/static/img/business/查看数据.png'), title: '组件服务', desc: '欢迎查阅组件服务帮助文档。本文档将为你提供详细的信息和步骤，以便你能充分理解和有效利用我们的互联网组件服务。'},
        {id: 3, icon: require('~/static/img/business/工作汇报.png'), title: '开放平台', desc: '欢迎来到半代码开放平台帮助文档！本文档将提供详细的信息和指南，帮助你理解和最大限度地利用我们的无代码开放平台。。'}
      ]
    }
  },
  mounted() {
    if (process.browser) {  // 在页面mounted生命周期里面 根据环境实例化WOW
      new WOW({}).init()
    }
  }
}
</script>

<style lang="scss" scoped>
@import '@/assets/styles/variables.scss';
.card {
  border: 5px solid #e8e8e8;
  box-shadow: 3px 3px 12px #e8e8e8;
}
.card:hover {
  .picture {
    transform: translate(0, 0)
  }
}
.picture {
  object-fit: cover;
  transition: all 0.6s;

  &.special {

  }
}
@media screen and (max-width: 992px) {
  .picture {
    transform: translate(0, 0) !important;
  }
  .card {
    border: none;
  }
  .top, .bottom {
    display: none;
  }
}
@media screen and (max-width: 768px) {
  .picture {
    height: 200px;
  }
}
.content {
  position: relative;
  .top {
    position: absolute;
    top: -5px;
    left: -5px;
    width: 0;
    height: 0;
    border-left: 5px solid  $theme-color;
    border-top: 5px solid  $theme-color;
    transition: all 0.6s;
  }
  .bottom {
    position: absolute;
    right: -5px;
    bottom: -5px;
    width: 0;
    height: 0;
    border-bottom: 5px solid $theme-color;
    border-right: 5px solid  $theme-color;
    transition: all 0.6s;
  }
}
.content:hover {
  box-shadow: 3px 3px 12px $theme-color;
  .top, .bottom {
    width: 100%;
    height: 100%;
  }
}
.detail1 {
  text-align: center!important;
  font-size: 20px;
  font-family: PingFang SC-Regular, PingFang SC,serif;
  font-weight: 400;
  color: #333333;
  line-height: 28px;
  margin-bottom: 48px;
}
.title {
  font-size: 45px;
  color: #333333;
  padding: 0 0 16px 0;
  text-align: center;
  font-weight: 700;
}
</style>
