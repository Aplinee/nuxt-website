<template>
  <header id="header" ref="header">
    <b-navbar toggleable="lg" type="dark" variant="dark" class="active2" :class="{active: showNavbarBg}">
      <div class="container">
        <!-- logo -->
        <b-navbar-brand to="/">
         <h4 style="color: #2a333c!important"><img src="@/assets/img/favicon.png" class="mr-2"  style="height: 35px;width: 35px;margin-bottom: 4px" alt="logo">道源云</h4>
        </b-navbar-brand>
        <!-- 切换按钮 -->
        <b-navbar-toggle target="nav-collapse"
          :class="{active: showCollaps}"
        ></b-navbar-toggle>

        <b-collapse id="nav-collapse" is-nav v-model="showCollaps">
          <b-navbar-nav class="ml-auto">
            <template v-for="(item, index) of navBarList" :Key="index">
              <b-nav-item v-if="item.children.length <= 0"
                :to="item.link" :active="$route.path === item.link">
                {{item.nav}}
              </b-nav-item>
              <template v-else>
                <b-nav-item-dropdown  @show="handleShowDrop">
                  <template v-slot:button-content>
                    <span  @click="handleNavbarClick(item, '', $event)"
                      :class="{active: $route.path.includes(item.link)}"
                    >{{item.nav}}</span>
                  </template>
                  <!-- 子菜单 -->
                  <b-dropdown-item
                    v-for="(ite, ind) of item.children"
                    :key="ind"
                    @click="handleNavbarClick(ite, ind, $event)"
                    >{{ite.nav}}
                  </b-dropdown-item>
                </b-nav-item-dropdown>
                <div>
                </div>
              </template>
            </template>
          </b-navbar-nav>
          <div style="width: 20px"></div>
          <div class="headerAction">
            <a class="headerBtnReg" :href="immediateUseLink">{{ immediateUseText }}</a>
          </div>
        </b-collapse>
      </div>
    </b-navbar>
  </header>
</template>

<script>
import Cookies from 'js-cookie';

export default {
  data() {
    return {
      showCollaps: false,
      showNavbarBg: false,
      showDrop: false,
      immediateUseText: '立即使用',
      immediateUseLink: 'https://cloudplatform.daoyuanyun.com/passport/login',
      navBarList: [
        {nav: '首页', link: '/' , children: []},
        {nav: '产品', link: '/product/1' , children: [
            {nav: '道源云', link: '/product/1', children: []},
            {nav: '道源智造', link: '/product/2', children: []},
            {nav: '服务', link: '/product/3', children: []},
          ]},
        {nav: '价格', link: '/price' , children: []},
        {nav: '帮助', link: '/help' , children: []},
        {nav: '关于我们', link: '/about' , children: []},
      ]
    }
  },
  mounted() {
    this.$nextTick(() => {
      this.getHeaderHeight();
    });
    window.addEventListener('scroll', this.handleWindowScroll);

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
  beforeDestroy() {
    window.removeEventListener('scroll', this.handleWindowScroll);
  },
  methods: {
    isMobileDevice() {
      return (typeof window.orientation !== "undefined") || (navigator.userAgent.indexOf('IEMobile') !== -1);
    },
    handleNavbarClick(item, index, bvEvt) {
      if(index !== '') {
        this.$store.commit('setSubNavIndex', index + 1);
      }else {
        this.$store.commit('setSubNavIndex', 0);
        this.showDrop = false;
      }
      this.$router.push(item.link);
      this.showCollaps = false;
    },
    handleShowDrop(bvEvt) {
      if(!this.showDrop) {
        bvEvt.preventDefault();
      }
      this.showDrop = true;
    },
    handleWindowScroll(e) {
      const myTop = document.documentElement.scrollTop||document.body.scrollTop;
      const flag = myTop > 5;
      if(this.showNavbarBg != flag) {
        this.showNavbarBg = flag;
      }
    },
    getHeaderHeight() {
      const headerHeight = this.$refs.header.clientHeight;
      this.$store.commit('setHeaderHeight', headerHeight);
    }
  }
}
</script>

<!-- ... 其他样式代码 ... -->


<style lang="scss" scoped>
@import '@/assets/styles/variables.scss';

#header {
  position: fixed;
  top: 0;
  right: 0;
  left: 0;
  z-index: 99;
}

::v-deep.dropdown:hover .btn, ::v-deep.dropdown-item:hover {
  border-color: transparent;
  background: none;
}
::v-deep.nav-link:hover,
::v-deep.dropdown-item:hover,
::v-deep .navbar-nav .nav-link.active {
  color: $theme-color !important;
}

::v-deep.navbar-toggler {
  padding: 0;
  border: none;
  outline: none;
  .navbar-toggler-icon {
    position: relative;
    width: 1em;
    // height: 0.1em;
    height: 2px;
    border-radius: 1px;
    background: #fff;
    &:after, &:before {
      position: absolute;
      left: 0;
      content: '';
      width: 1em;
      height: 2px;
      // height: 0.1rem;
      background: #fff;
      transition: all .2s ease-in-out;
    }
    &:before {
      top: -0.3em;
    }
    &:after {
      top: 0.3em;
    }
  }
  &.active .navbar-toggler-icon {
    background: transparent;
    &:before {
      transform: rotate(45deg);
      transform-origin: 8%;
    }
    &:after {
      transform: rotate(-45deg);
      transform-origin: 8%;
    }
  }
}
.dropdown-toggle .active {
  color: $theme-color;
}
::v-deep .nav-link {
  color: #333 !important;
  font-weight: 500;
  line-height: 40px;
  font-size: 16px;
}
::v-deep .navbar {
  background: transparent !important;
  &.active {
    background: #fff !important;
    box-shadow: 0 .125rem .25rem rgba(0,0,0,.075);
    .navbar-brand, .nav-link {
      color: #333 !important;
      &.active {
        color: #3269A5 !important;
      }
    }
    .navbar-toggler {
      .navbar-toggler-icon {
        background: #333;
        &:after, &:before {
          background: #333;
        }
      }
      &.active .navbar-toggler-icon {
        background: transparent;
      }
    }
  }
}
@media screen and (max-width: 992px) {
  ::v-deep .navbar {
    background: #fff !important;
    box-shadow: 0 .125rem .25rem rgba(0,0,0,.075);
    &.active2 {
      .navbar-brand, .nav-link {
        color: #333 !important;
        &.active {
          color: #3269A5 !important;
        }
      }
      .navbar-toggler {
        .navbar-toggler-icon {
          background: #333;
          &:after, &:before {
            background: #333;
          }
        }
        &.active .navbar-toggler-icon {
          background: transparent;
        }
      }
    }
  }
}

@media screen and (min-width: 992px) {
  ::v-deep.dropdown:hover .dropdown-menu {
    display: block;
  }
  ::v-deep .dropdown-menu {
    display: none;
    width: 248px;
    border-color: transparent;
    box-shadow: 0px 1px 6px rgba(0, 0, 0, 0.16);
    background: rgba(255, 255, 255, 1) 0% 0% no-repeat padding-box;
    border-radius: 4px;
    top: 44px;
    z-index: 10;
    text-align: left;
    font-size: 14px;
    line-height: 36px;
    font-weight: bold;
    padding: 10px 0;
    box-sizing: border-box;

  }
}

.headerAction {
  /* float: left; */
  display: inline-block;
  position: relative;
  margin-right: 24px;
  margin-left: -4px;
}
div {
  box-sizing: border-box;
}
a.headerBtnReg {

  color: #fff;
  background-color: #2196F3;
  border: none;
  transition: background-color 0.5s;
}
a.headerBtnReg:hover {
  background-color: #63b0ee; /* 鼠标悬停时的背景色，这里保持不变以阻止变亮 */
}
.headerAction a {
  margin-left: 4px;
  display: inline-block;
  padding: 0 23px;
  height: 38px;
  line-height: 38px;
  color: white!important; /* 变为白色 */
  font-size: 14px;
  text-align: center;
  vertical-align: middle;
  border-radius: 4px;
  background-clip: padding-box;
  text-decoration: none;
  font-weight: bold; /* 添加粗体样式 */
}
a {
  color: #0091ea;
  text-decoration: none !important;
}
.headerAction a {
  margin-left: 4px;
  display: inline-block;
  padding: 0 23px;
  height: 38px;
  line-height: 38px;
  color: #1a1a1a;
  font-size: 14px;
  text-align: center;
  vertical-align: middle;
  border-radius: 4px;
  background-clip: padding-box;
  text-decoration: none;
}
a {
  color: #0091ea;
  text-decoration: none !important;
}
.m2-header {
}
:hover {
  color: #3c84bd;
}
.nav-dropdown {
  position: absolute;
  width: 246px;
  background: rgba(255, 255, 255, 1) 0% 0% no-repeat padding-box;
  box-shadow: 0px 1px 6px rgba(0, 0, 0, 0.16);
  border-radius: 4px;
  top: 44px;
  left: 0;
  z-index: 10;
  font-size: 14px;
  line-height: 36px;
  height: 36px;
  padding: 0 20px;
  box-sizing: border-box;
  text-align: left;
  margin: 0;
}
</style>
