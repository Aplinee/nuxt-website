<template>
  <section style="background-color: #f9fafe">
    <div style="height: 250px;"></div>
    <h4 class="title mb-2" >关于道源云</h4>
    <div style="height: 30px"></div>
    <p class="detail1 mb-5 text-justify">极致的效率</p>
    <p class="detail1 mb-5 text-justify">快速落地，低成本开发，高效部署 </p>
    <p class="detail1 mb-5 text-justify">助力企业快速发展 </p>
    <div style="height: 200px"></div>
    <div class="bar" ref="nav">
      <div class="bar-item py-2 px-3"
        v-for="(item, index) of list"
        :key="index"
        :class="{active: active === index}"
        @click="handleNavClick(index)"
      ></div>
    </div>
    <div class="container py-5">
      <article v-for="(item, index) of list" :Key="index">
        <h5 ref="title" class="title mb-2">{{item.title}}</h5>
        <p class="desc text-dark mb-5" v-html="item.desc"></p>
        <p class="desc text-dark mb-5" v-html="item.desc1"></p>
        <div style="height: 30px"></div>
        <div v-if="index===1" class="headerAction">
          <a class="headerBtnReg" :href="immediateUseLink">加入我们</a>
        </div>
        <b-row align-h="center" class="mb-5">
          <b-col md="8"><b-img :src="item.icon" fluid alt="" /></b-col>
        </b-row>
        <template v-if="!item.desc">
          <b-row>
          </b-row>
        </template>
      </article>
    </div>

  </section>
</template>

<script>

import {mapState, mapMutations} from 'vuex'
import smoothscroll from 'smoothscroll-polyfill'

if (process.browser) { // 在这里根据环境引入wow.js
  var {WOW} = require('wowjs')
  smoothscroll.polyfill()
}

export default {
  data() {
    return {
      topList: [],
      navHeight: 0,
      immediateUseLink: 'https://cloudplatform.daoyuanyun.com/f/9a2b8128',
      navTop: 0,
      showNavFixed: false,
      active: 0,
      list: [
        {
          title: '我们的产品',icon: require('~/static/img/about/daoyuan.png'),
          desc: `道源云+道源智造，配合智能网关，轻松满足轻度和复杂需求`
        }, {
          title: '加入我们',
          desc: `感谢你对道源云的关注，也欢迎你加入道源云与我们携手并进。`
        },
        // {
        //   title: '公司新闻',
        //   desc: `公司最新的动态，重大事件`
        // },
        {

        }
      ]
    }
  },
  watch: {
    subNavIndex(newVal, oldVal) {
      this.active = newVal - 1
      setTimeout(() => {
        this.handleNavClick(this.active)
      }, 0)
    },
    // active(newVal, oldVal) {
    //   setTimeout(() => {
    //     this.handleNavClick(newVal)
    //   }, 0)
    // }
  },
  computed: {
    ...mapState(['headerHeight', 'subNavIndex'])
  },
  mounted() {
    if (process.browser) {  // 在页面mounted生命周期里面 根据环境实例化WOW
      new WOW({}).init()
    }

    this.getTitleHeight()

    this.active = this.subNavIndex == 0 ? 0 : this.subNavIndex - 1
    if(this.active != 0) {
      setTimeout(() => {
        this.handleNavClick(this.active)
      }, 0)
    }

    window.addEventListener('scroll', this.handleWindowScroll)
    window.addEventListener('resize', this.handleWindowResize)
  },
  beforeDestroy() {
    window.removeEventListener('scroll', this.handleWindowScroll)
    window.removeEventListener('resize', this.handleWindowResize)
  },
  methods: {
    // 点击切换tab
    handleNavClick(index) {
      // this.active = index
      window.scrollTo({
        top: this.topList[index] - this.headerHeight - this.navHeight,
        left: 0,
        behavior: "smooth"
      })
      console.log(this.topList[index] - this.headerHeight - this.navHeight)
    },
    // 监听窗口滚动
    handleWindowScroll(e) {
      const myTop = document.documentElement.scrollTop||document.body.scrollTop
      // 固定tab
      const flag = myTop > this.navTop - this.headerHeight
      if(this.showNavFixed != flag) {
        this.showNavFixed = flag
      }
      // 高亮tab-item
      const list = [...this.topList, 9999]
      const doubleBarHeight = this.navHeight + this.headerHeight
      for(let i=0, len = list.length; i < len; i++) {
        if(myTop >= list[i] - doubleBarHeight && myTop < list[i+1] - doubleBarHeight) {
          this.active = i
        }
      }
    },
    // 获取每个title、nav的高度
    getTitleHeight() {
      const titleList = this.$refs.title
      this.topList = titleList.map(val => {
        return val.offsetTop
      })
      const navHeight = this.$refs.nav.clientHeight
      this.navHeight = navHeight
      const navTop = this.$refs.nav.offsetTop
      this.navTop = navTop
    },
    // 改变窗口大小重新获取title、nav高度
    handleWindowResize() {
      this.$nextTick(() => {
        this.getTitleHeight()
      })
      this.handleNavClick(this.active)
    }
  }
}
</script>

<style lang="scss" scoped>
.navFixed {
  left: 0;
  right: 0;
  z-index: 9;
  background: #fff;
}
.bar {
  display: flex;
  align-items: center;
  justify-content: flex-start; /* 修改此行以在左侧对齐 */
  padding: 15px 0;
  border-bottom: 1px solid #dee2e6;
  font-size: 25px;
  font-weight: 700;
  color: #333;
  .bar-item {
    cursor: pointer;
    &.active {
      color: #1e2a44;
    }
  }
}
::v-deep.nav-tabs .nav-item .nav-link {
  border-color: transparent !important;
  font-size: 16px;
  color: #333;
  &.active {
    color: #007bff;
  }
  &:hover {
    color: #007bff;
  }
}
.desc {
  line-height: 3;
  text-align: center!important;
}
.desc1 {
  line-height: 3;
  text-align: center!important;
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
  font-size: 50px;
  color: #333333;
  padding: 0 0 16px 0;
  text-align: center;
  font-weight: 700;
}
.headerAction {
  text-align: center;
  /* float: left; */
  position: relative;
}
a.headerBtnReg {

  color: #fff;
  background-color: #2196F3;
  border: none;
  transition: background-color 0.5s;
}
a.headerBtnReg:hover {
  background-color: #3c84bd; /* 鼠标悬停时的背景色，这里保持不变以阻止变亮 */
}
.headerAction a {
  padding: 15px 50px;
  height: 38px!important;
  width: 120px;
  color: white!important; /* 文字颜色为白色 */
  font-size: 15px!important;
  border-radius: 6px; /* 简化border-radius书写 */
  background-clip: padding-box;
  font-weight: bold; /* 粗体文字 */
  overflow: hidden;

}
a {
  color: #0091ea;
  text-decoration: none !important;
}
.headerAction a {
  //display: inline-block;
  color: #1a1a1a;
  font-size: 20px;
  background-clip: padding-box;
  text-decoration: none;
}
a {
  color: #0091ea;
  text-decoration: none !important;
}

</style>
