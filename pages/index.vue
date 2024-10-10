<template>
  <div>
    <carousel class="d-none d-md-block d-lg-block d-xl-block"
              style="height: 750px; padding-bottom: 31.2%"
              size="big"
    />
    <carousel class="d-block d-md-none d-lg-none d-xl-none"
              style="height: 0; padding-bottom: 120%"
              size="small"
    />
    <Product />
    <Business />
    <script type='text/javascript'>
      (function(a, b, c, d, e, j, s) {
        a[d] = a[d] || function() {
          (a[d].a = a[d].a || []).push(arguments)
        };
        j = b.createElement(c),
          s = b.getElementsByTagName(c)[0];
        j.async = true;
        j.charset = 'UTF-8';
        j.src = 'https://static.meiqia.com/widget/loader.js';
        s.parentNode.insertBefore(j, s);
      })(window, document, 'script', '_MEIQIA');
      _MEIQIA('entId', '0726562862252dfb9dc079821c13496d');
      console.clear();
      console.log("欢迎使用道源云")
    </script>
  </div>
</template>

<script>
import Product from '@/components/index/product'
import Business from '@/components/index/business'
import About from '@/components/index/about'
import Partner from '@/components/index/partner'
import Client from '@/components/index/client'
import Price from '@/components/index/price'
import Carousel from "@/components/index/carousel.vue";
if (process.browser) { // 在这里根据环境引入wow.js
  var {WOW} = require('wowjs')
}

export default {
  components: {
    Carousel,
    Product,
    Business,
    About,
    Client,
    Partner,
    Price
  },
  mounted() {
    if (process.browser) {  // 在页面mounted生命周期里面 根据环境实例化WOW
      new WOW({}).init()
    }
  }
}
</script>

<style lang="scss" scoped>

</style>
