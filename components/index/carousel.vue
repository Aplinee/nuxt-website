<template>
  <div style="position: relative; background: #FFFFFF">
    <b-img style="height: 100%; width: 100%; object-fit: cover; position: absolute;"
           :src="size=='big' ? require('~/static/img/banner/img_1_副本.png') : require('~/static/img/banner/img_1.png')"
           alt="banner"
    ></b-img>
    <div class="mask mask2">
      <div class="content content2">
        <h3 class="title mb-3 wow fadeInLeft" data-wow-delay="0.2s">使用道源云快速实现你的需求</h3>
        <h3 class="title2 mb-3 wow fadeInLeft" style="line-height: 78px!important;" data-wow-delay="0.2s">一站式数字化云平台</h3>
        <p style="height: 10px"></p>
        <div class="headerAction">
          <a class="headerBtnReg" :href="immediateUseLink">{{ immediateUseText }}</a>
        </div>
      </div>
    </div>




  </div>
</template>

<script>
import Cookies from 'js-cookie';
if (process.browser) { // 在这里根据环境引入wow.js
  var {WOW} = require('wowjs')
}

export default {
  data() {
    return {
    immediateUseText: '立即使用',
    immediateUseLink: 'https://cloudplatform.daoyuanyun.com/passport/login',
    }
  },
  props: {
    size: {
      type: String,
      default: ''
    }
  },
  methods: {
    isMobileDevice() {
      return (typeof window.orientation !== "undefined") || (navigator.userAgent.indexOf('IEMobile') !== -1);
    }
  },
  mounted() {
    if (process.browser) {  // 在页面mounted生命周期里面 根据环境实例化WOW
      new WOW({}).init()
    };
    var prodQflowToken = Cookies.get('prodQflowToken');
    if (prodQflowToken !== undefined) {
      this.immediateUseText = '工作台';
      this.immediateUseLink = this.isMobileDevice() ? '/arch/home' : '/index';
    }
    if (prodQflowToken === undefined) {
      this.immediateUseText = '立即使用';
      this.immediateUseLink = this.isMobileDevice() ? 'https://cloudplatform.daoyuanyun.com/passport/login?redirectUrl=/arch/home' : 'https://cloudplatform.daoyuanyun.com/passport/login';
    }
  },

}
</script>

<style lang="scss" scoped>
.mask {
  position: absolute;
  top: 0;
  right: 0;
  bottom: 0;
  left: 0;
  display: flex;
  justify-content: flex-end;
  align-items: center;
}
.headerAction {
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
  height: 58px!important;
  width: 180px;
  color: white!important; /* 文字颜色为白色 */
  font-size: 20px!important;
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
.content {
  margin-top: 150px;
  position: absolute;
  left: 10%;
  transform: translateY(-45%);
}

.title {
  font-size: 56px;
  font-weight: bold;
}
.title2  {
  font-size: 30px;
  line-height: 42px;
}

@media (max-width: 768px) { // 对小于或等于768px宽度的设备应用以下样式
  .content {
    transform: translateY(-5%);
  }
}
@media (max-width: 768px) { // 对小于或等于768px宽度的设备应用以下样式
  .content {
    transform: translateY(-5%);
  }
  .mobile-hide {
    display: none;
  }
}
</style>
