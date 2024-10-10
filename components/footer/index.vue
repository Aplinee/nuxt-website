<template>
  <footer class="text-center py-2" style="border-top: 1px solid #bec1c4; ">
    <div class="image-container">
      <img style="height: 25px!important;width:25px!important;" src="@/assets/img/logo.png" alt="旋转图片">
      <a href="https://beian.miit.gov.cn" target="_blank">沪ICP备2024069621号｜上海道源云智信息科技有限公司</a></div>
  </footer>
</template>

<script>
export default {

}
</script>

<style lang="scss" scoped>
a {
  color: #2a333c;
  text-decoration: none;
}

.image-container img {
  width: 100%;
  height: 100%;
  animation: rotate 5s linear infinite; /* 设置动画 */
}

@keyframes rotate {
  from {
    transform: rotate(0deg); /* 起始旋转角度 */
  }
  to {
    transform: rotate(360deg); /* 终止旋转角度 */
  }
}
</style>
