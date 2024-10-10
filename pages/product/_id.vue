<template>
  <section style="background-image: url('https://cloudplatform.daoyuanyun.com/fileStorage/group1/M00/00/05/rBIAA2Zn8l2AN1l5AAQFvyQfg1U515.png')" class="pb-5">
    <div style="height: 128px;"></div>
    <div class="mb-5">
    </div>
    <div class="container">
      <h4 class="title mb-2" v-if="info.subtitle">{{info.subtitle}}</h4>
      <div style="height: 30px"></div>
      <p class="detail1 mb-5 text-justify">{{info.desc}}</p>
      <b-row align-h="center" class="mb-5">
        <b-col md="8"><b-img :src="info.picture" fluid alt="" /></b-col>
      </b-row>
      <p class="detail mb-5 text-justify" v-html="info.character" style="text-align: center!important;"></p>
      <p class="detail mb-5 text-justify" v-html="info.apply" style="text-align: center!important;"></p>
      <template v-if="info.picture2">
        <h4 class="title mb-4" v-if="info.subtitle2">{{info.subtitle2}}</h4>
        <b-row align-h="center" class="mb-5">
          <b-col md="8"><b-img :src="info.picture2" fluid alt="" /></b-col>
        </b-row>
        <p class="detail mb-5 text-justify" style="text-align: center!important;">{{info.desc2}}</p>
        <p class="detail mb-5 text-justify" v-html="info.character2" style="text-align: center!important;"></p>
        <p class="detail mb-5 text-justify" v-html="info.apply2" style="text-align: center!important;"></p>
      </template>
      <template v-if="info.picture3">
        <h4 class="title mb-3" v-if="info.subtitle3">{{info.subtitle3}}</h4>
        <b-row align-h="center" class="mb-5">
          <b-col md="8"><b-img :src="info.picture3" fluid alt="" /></b-col>
        </b-row>
        <p class="detail mb-5 text-justify" style="text-align: center!important;">{{info.desc3}}</p>
        <p class="detail mb-5 text-justify" v-html="info.character3" style="text-align: center!important;"></p>
        <p class="detail mb-5 text-justify" v-html="info.apply3" style="text-align: center!important;"></p>
      </template>
      <template v-if="info.picture4">
        <h4 class="title mb-3" v-if="info.subtitle4">{{info.subtitle4}}</h4>
        <b-row align-h="center" class="mb-5">
          <b-col md="8"><b-img :src="info.picture4" fluid alt="" /></b-col>
        </b-row>
        <p class="detail mb-5 text-justify" style="text-align: center!important;">{{info.desc4}}</p>
        <p class="detail mb-5 text-justify" v-html="info.character4" style="text-align: center!important;"></p>
        <p class="detail mb-5 text-justify" v-html="info.apply4" style="text-align: center!important;"></p>
      </template>
      <template v-if="info.picture5">
        <h4 class="title mb-3" v-if="info.subtitle5">{{info.subtitle5}}</h4>
        <b-row align-h="center" class="mb-5">
          <b-col md="8"><b-img :src="info.picture5" fluid alt="" /></b-col>
        </b-row>
        <p class="detail mb-5 text-justify" style="text-align: center!important;">{{info.desc5}}</p>
        <p class="detail mb-5 text-justify" v-html="info.character5" style="text-align: center!important;"></p>
        <p class="detail mb-5 text-justify" v-html="info.apply5" style="text-align: center!important;"></p>
      </template>
    </div>
  </section>
</template>

<script>
import { product } from '@/utils/mock.js'

if (process.browser) { // 在这里根据环境引入wow.js
  var {WOW} = require('wowjs')
}

export default {
  computed: {
    info() {
      const index = this.$route.params.id
      return product[index - 1]
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
.breadcrumb a {
  color: $theme-color;
}
</style>
