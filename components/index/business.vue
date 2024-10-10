<template>
  <my-slot :title="title" :desc="desc" :showBgColor="true">
    <b-row class="mx-0">
      <b-col lg="4" md="6" sm="12"
        v-for="(item, ind) of productList"
        :key="ind"
        class="wow fadeInUp"
        :data-wow-delay="(0.2 * ind) + 's'"
      >
        <b-card img-top class="my-2">
          <b-card-img class="w-75 mx-auto d-block rounded thumbnail " :src="item.icon"></b-card-img>
          <b-card-title class="w-75 mx-auto mt-2 text-truncate text-center">{{item.title}}</b-card-title>
          <b-card-text class="w-75 mx-auto card-body-text text-muted">{{item.desc}}</b-card-text>
          <b-button  variant="outline-info"
            class="mx-auto d-block my-btn"
            @click="jumpToIndex"
          >立即使用</b-button>
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
  methods:{
    jumpToIndex() {
      window.location.assign('/index');
      // 或者使用
      // window.location.href = '/index';
    }
  },
  data() {
    return {
      title: '行业&解决方案',
      desc: '道源云提供丰富的解决方案可供使用，用户也可以制作专属自己的方案',
      productList: [
        {id: 1, icon: require('~/static/img/business/31198686385bb1b7fa06.jpg'), title: '生产制造', desc: '道源云提供全面生产管理解决方案，包括安全检查、精益生产、设备管理、健康管理等，助力企业高效运营，确保安全与质量。'},
        {id: 2, icon: require('~/static/img/business/1132803645a071a376db.png'), title: '项目管理', desc: '道源云提供全面的工作流程方案，支持移动办公自动化。。提供多元化解决方案，覆盖项目全周期，全面优化业务流程。'},
        {id: 3, icon: require('~/static/img/business/69154786345419974eb6.jpg'), title: '人事管理', desc: '多样化的企业管理解决方案，助力企业高效运作，实现企业经营管理智能化、人性化。全方位满足企业不同管理需求。'}
      ]
    }
  }
}
</script>

<style lang="scss" scoped>
@import '@/assets/styles/variables.scss';

.card {
  border: none;
  border-radius: 12px;
}
.card:hover {
  // background: #F1F1F1;
  box-shadow: 0 0 10px #ccc;
}
.card-body-text {
  max-height: 102px;
  overflow: hidden;
  text-overflow: ellipsis;
  display: -webkit-box;
  -webkit-line-clamp: 5;
  -webkit-box-orient: vertical;
}
</style>
