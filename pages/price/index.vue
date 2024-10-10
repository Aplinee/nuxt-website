<template>
  <section style="background-image: url('https://cloudplatform.daoyuanyun.com/fileStorage/group1/M00/00/04/rBIAA2Zh9WeAYmOzAAVIeHcBsXs702.png')">
    <div style="height: 158px"></div>
    <div class="container py-5">
      <h4 class="title mb-2" >免费可用，价有所值</h4>
      <p class="detail1 mb-5 text-justify">差异化能力组合，按需购买，加速数字化场景落地 </p>
      <div style="height: 20px"></div>
      <b-row>
        <b-col cols="10" offset="1">
          <b-card no-body class="mb-5"
            v-for="(item, index) of productList"
            :key="index"
          >
            <b-row class="content" no-gutters>
              <i class="top" :style="{borderLeftColor: getBorderColor(index, 'left'), borderTopColor: getBorderColor(index, 'top')}"></i>
              <i class="bottom" :style="{borderBottomColor: getBorderColor(index, 'bottom'), borderRightColor: getBorderColor(index, 'right')}"></i>
              <b-col md="5"
                :data-wow-delay="(0.2 * index) + 's'"
                     :offset-md="index === 1 || index === 3 ? 1 : 0" :order="index === 1 || index === 3 ? 1 : 0"
              >
                <b-card-img :src="item.icon" height="300" fluid class="rounded-0 picture" :class="{special: index == 1}"></b-card-img>
              </b-col>
              <b-col
                :data-wow-delay="(0.2 * index) + 's'"
                :offset-md="index === 1 || index === 3 ? 0 : 1" md="6"
                :order="index == 1 || index === 3 ? 0 : 1"
              >
                <b-card-body class="h-100 d-flex justify-content-center align-items-center flex-column text-center">
                  <b-card-title>{{item.title}}</b-card-title>
                  <b-card-text v-if="item.desc" class="item-desc">{{item.desc}}</b-card-text>
                  <b-card-text v-if="item.desc1" class="item-desc">{{item.desc1}}</b-card-text>
                  <b-card-text v-if="item.desc2" class="item-desc">{{item.desc2}}</b-card-text>
                  <b-card-text v-if="item.desc3" class="item-desc">{{item.desc3}}</b-card-text>
                  <b-card-text v-if="item.desc4" class="item-desc">{{item.desc4}}</b-card-text>
                  <b-card-text v-if="item.desc5" class="item-desc">{{item.desc5}}</b-card-text>
                  <b-card-text v-if="item.desc6" class="item-desc">{{item.desc6}}</b-card-text>
                  <b-card-text v-if="item.desc7" class="item-desc">{{item.desc7}}</b-card-text>
                  <b-button v-if="index!==0 & index!==3 " variant="outline-info"
                            @click="jumpToBuy()"
                  >立即购买</b-button>
                  <b-button v-if="index===0 & index!==3 " variant="outline-info"
                            @click="jumpToRegist()"
                  >免费注册</b-button>
                  <b-button v-if="index===3" variant="outline-info"
                            @click="jumpToConSult()"
                  >咨询顾问</b-button>
                </b-card-body>
              </b-col>
            </b-row>
          </b-card>
        </b-col>
      </b-row>
      <b-card-text class="item-desc" style="font-weight: 600">新用户立享30天免费企业版
        <a href="https://cloudplatform.daoyuanyun.com/passport/register" style="color: #3c84bd; text-decoration: none; text-align: center!important;">立即注册</a>
      </b-card-text>
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
        {id: 1, icon: require('~/static/img/price/free.jpg'), title: '免费版', desc: '赠送20人使用包', desc2: '支持基础功能',desc3: '工单支持'},
        {id: 2, icon: require('~/static/img/price/pro.jpg'), title: '专业版', desc: '赠送30人使用包',desc1: '包含专业版功能/资源',desc4: '售后服务群'},
        {id: 3, icon: require('~/static/img/price/com.jpg'), title: '企业版', desc1: '赠送30人使用包',desc: '包含专业版所有内容',desc4: '专属售后服务群',desc2: '海量企业版资源/功能',},
        {id: 4, icon: require('~/static/img/price/alone.jpg'), title: '独享版', desc1: '支持云端/本地/道源智造部署',desc2: '无限制高级资源量/容量',desc6: '专属IT咨询专家',desc4: '支持深度自定义&二次开发',},
      ]
    }
  },
  methods: {

    jumpToBuy() {
      window.location.assign('https://cloudplatform.daoyuanyun.com/f/6950c790');
    },
    jumpToRegist() {
      window.location.assign('https://cloudplatform.daoyuanyun.com/passport/register');
    },
    jumpToConSult() {
      window.location.assign('https://cloudplatform.daoyuanyun.com/f/9fb3ad1d');
    },
    getBorderColor(index, side) {
      const colors = { 0: '#02a17f', 1: '#2ea1ff', 2: '#7e47eb', 3: '#ffa93a' }; // 绿色(#0f0), 蓝色(#00f), 红色(#f00), 紫色(#800080)
      return colors[index] || '#000'; // 如果index超出范围，默认为黑色
    },
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
  transform: translate(0, 0)}
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
    border-left: 5px solid  #1296db;
    border-top: 5px solid  #1296db;
    transition: all 0.6s;
  }
  .bottom {
    position: absolute;
    right: -5px;
    bottom: -5px;
    width: 0;
    height: 0;
    border-bottom: 5px solid #1296db;
    border-right: 5px solid  #1296db;
    transition: all 0.6s;
  }
}
.title {
  font-size: 45px;
  color: #333333;
  padding: 0 0 16px 0;
  text-align: center;
  font-weight: 700;
}
.detail {
  font-size: 16px;
  line-height: 2;
  color: #2a333c;
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
.content:hover {
  box-shadow: 3px 3px 12px #fafafa;
  .top, .bottom {
    width: 100%;
    height: 100%;
  }
}
.item-desc {
  text-align: center !important;
 }
</style>
