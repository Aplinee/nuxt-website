<template >
  <section class="py-5 wrapper">
    <div style="height: 68px"></div>
    <div class="container">
      <b-row>
        <b-col md="3" order="1" order-md="0" class="mb-4 wow slideInLeft">
          <b-list-group>
            <b-list-group-item
              class="bg-muted"
              v-for="(item, index) of tabList"
              :key="index"
              :active="active == index"
              @click="handleTabClick(index)"
            >{{item}}</b-list-group-item>
          </b-list-group>
        </b-col>
        <b-col md="9" order="0" order-md="1" class="">
          <b-card class="mb-3 wow fadeInUp"
            :data-wow-delay="(index * 0.2) + 's'"
            v-for="(item, index) of list"
            :key="index"
          >
            <!-- <b-card-img src="@/assets/img/product/product01.jpg"></b-card-img> -->
            <b-card-title>{{item.title}}</b-card-title>
            <b-card-text class="text-muted">{{item.desc}}</b-card-text>
            <b-button
              variant="outline-info"
              class="d-block ml-auto"
              @click="handleDetail(item.id)"
            >查看详情</b-button>
          </b-card>
        </b-col>
      </b-row>
    </div>
  </section>
</template>

<script>
import { mapState } from 'vuex'

if (process.browser) { // 在这里根据环境引入wow.js
  var {WOW} = require('wowjs')
}

export default {
  data() {
    return {
      active: null,
      list: [],
      tabList: ['全部', '半代码开发', '云函数','AI协同','大屏可视化'],
      productList: [
        {id: 1, icon: require('~/static/img/product/product01.jpg'), title: '半代码开发', desc: '半代码开发是一种新型的开发方式，它不需要编写任何代码，只需通过拖拽式操作即可完成开发工作。通过这种方式，您可以轻松地构建出自己的业务管理系统。无论您是想创建一个客户关系管理系统、人力资源管理系统还是项目管理系统，半代码开发可以帮助您快速完成，且无需编写代码。'},
        {id: 2, icon: require('~/static/img/product/product02.jpg'), title: '云函数', desc: '云函数是一种基于云计算的服务，它提供了一种无需搭建服务器的方式来执行和管理代码的方法。通过云函数，开发者可以编写自己的代码逻辑，并将其部署到云平台的服务器上运行。'},
        {id: 3, icon: require('~/static/img/product/product03.jpg'), title: 'AI协同', desc: 'AI协同是将计算基础设施、模型开发环境和半代码进行深度融合的解决方案。它提供了高度集成的能力和强大的交付能力，旨在显著提高团队在数据分析、模型开发和业务投产方面的效率。同时，AI协同作为桥梁，实现了物理世界和数字世界的连接，促进了企业生产力的可持续发展。'},
        {id: 4, icon: require('~/static/img/product/product04.jpg'), title: '大屏可视化', desc: '通过大屏可视化，用户可以轻松创建自己的大屏展示，并灵活地定制报表和数据。不论是使用开源大屏还是智能大屏，大屏可视化都能无缝接入，并提供丰富的数据可视化功能。'},
        {id: 5, icon: require('~/static/img/product/product05.jpg'), title: '系统工作台', desc: '系统工作台帮助企业更好的管理数据资产，集合IT技术人员、系统运维人员、业务用户共同优化企业数据资产。数据治理覆盖整个数据生命周期：产生、流转、加工、使用、销毁，数据治理平台提供全链路的数据管理功能。'}
      ]
    }
  },
  watch: {
    subNavIndex(newVal, oldVal) {
      this.active = newVal
      this.getList()
    }
  },
  computed: {
    ...mapState(['subNavIndex']),
  },
  mounted() {
    this.active = this.subNavIndex
    this.getList()
  },
  methods: {
    // 筛选列表
    getList() {
      switch(Number(this.active)) {
        case 0: this.list = this.productList;
        break;
        case 1: this.list = this.productList.slice(0,1);
        break;
        case 2: this.list = this.productList.slice(1,2);
        break;
        case 3: this.list = this.productList.slice(2,3);
        break;
        case 4: this.list = this.productList.slice(3,4)
      }
      this.$nextTick(() => {
        if (process.browser) {
          new WOW({}).init()
        }
      })
    },
    // 点击筛选
    handleTabClick(index) {
      this.$store.commit('setSubNavIndex', index)
    },
    // 点击查看详情
    handleDetail(id) {
      this.$router.push(`/product/${id}`)
    }
  }
}
</script>

<style lang="scss" scoped>
@import '@/assets/styles/variables.scss';

.wrapper {
  background: #f2f2f2;
}
.card {
  border: none;
}
::v-deep .list-group-item {
  border-color: transparent;
  border-radius: 0;
}
::v-deep .list-group-item.active {
  background: $theme-color;
}
::v-deep .list-group-item:hover {
  cursor: pointer;
}
</style>
