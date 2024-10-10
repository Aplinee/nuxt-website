<template>
  <my-slot :title="title" :desc="desc" id="product">
    <b-row class="mx-0">
      <b-col lg="4" md="6" sm="12"
        v-for="(item, ind) of productList"
        :key="ind"
        class="wow fadeInDown"
        :data-wow-delay="(ind * 0.2) + 's'"
      >
        <!-- 卡片 -->
        <b-card class="overflow-hidden my-2">
          <b-row no-gutters>
            <b-col cols="4" class="px-2">
              <b-card-img :src="item.icon" class="rounded-circle"></b-card-img>
            </b-col>
            <b-col cols="8">
              <b-card-body  class="p-2">
                <b-card-title class="text-truncate">{{item.title}}</b-card-title>
                <b-card-text class="card-body-text text-muted text-justify">{{item.desc}}</b-card-text>
              </b-card-body>
            </b-col>
          </b-row>
          <!-- 蒙版 -->
        </b-card>
      </b-col>
    </b-row>
  </my-slot>
</template>

<script>
import MySlot from '@/components/slot/index'

export default {
  components: {
    MySlot
  },
  data() {
    return {
      title: '一站式数字化云平台',
      desc: '通过道源云搭建你的应用和服务',
      productList: [
        {id: 1, icon: require('~/static/img/product/lessCode.png'), title: '零代码', desc: '无需代码，灵活构建系统。'},
        {id: 2, icon: require('~/static/img/product/zeroCode.png'), title: '智能引擎', desc: '可视化快速实现流程设计。'},
        {id: 3, icon: require('~/static/img/product/workFlow.png'), title: '道源智造', desc: 'Serverless服务构建，托管你的服务'},
        {id: 4, icon: require('~/static/img/product/app.png'), title: '自定义页面', desc: '用户可自行搭建页面，满足多样化需求'},
        {id: 5, icon: require('~/static/img/product/bigVisual.png'), title: '大屏可视化', desc: '支持开源大屏，智能大屏接入。'},
        {id: 6, icon: require('~/static/img/product/xin.png'), title: '信创和安全', desc: '支持国产化，全方面安全加固'}
      ]
    }
  }
}
</script>

<style lang="scss" scoped>
@import '@/assets/styles/variables.scss';
.card {
  position: relative;
  border-radius: 12px!important;
  .mask {
    position: absolute;
    top: 0;
    left: 0;
    right: 0;
    bottom: 0;
    display: none;
    align-items: center;
    // justify-content: center;
    text-align: center;
    background: rgba(0, 0, 0, 0.3);
  }
}
.card:hover {
  box-shadow: 0 0 10px #ccc;
  .mask {
    display: flex !important;
  }
}
.card-body-text {
  max-height: 60px;
  overflow: hidden;
  text-overflow: ellipsis;
  display: -webkit-box;
  -webkit-line-clamp: 3;
  -webkit-box-orient: vertical;
}
</style>
