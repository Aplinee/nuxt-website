<template >
  <section class="technology">
    <div style="height: 68px"></div>
    <b-tabs content-class="mt-3" align="center" active-nav-item-class="text-primary">
      <b-tab
        v-for="(item, index) of list"
        :key="index"
        :title="item.title"
        :active="active === index"
      >
        <div class="container">
          <article class="text-dark desc" v-if="item.desc" v-html="item.desc"></article>
          <!-- 表单部分 -->
          <template v-if="index === 2">
            <b-row align-h="center">
              <b-col md="8" class="text-muted">欢迎您对我们提出宝贵的意见,相信有您的支持,我们一定会做的更好,让客户更加满意!</b-col>
            </b-row>
            <b-row align-h="center">
              <b-col md="8">
                <b-form @submit="onSubmit" class="mt-4 mb-5">
                  <b-form-group
                    id="input-group-1"
                    label-for="input-1"
                    class="mb-4"
                  >
                    <b-form-input
                      id="input-1"
                      v-model="form.name"
                      required
                      placeholder="请输入您的姓名"
                    ></b-form-input>
                  </b-form-group>

                  <b-form-group id="input-group-2" label-for="input-2" class="mb-4">
                    <b-form-input
                      id="input-2"
                      v-model="form.phone"
                      required
                      placeholder="请输入您的手机/邮箱"
                    ></b-form-input>
                  </b-form-group>

                  <b-form-group id="input-group-3" label-for="input-3" class="mb-4">
                    <b-form-select
                      id="input-3"
                      v-model="form.suggest"
                      placeholder="反馈类型"
                      :options="suggest"
                      required
                    ></b-form-select>
                  </b-form-group>

                  <b-form-group id="input-group-4" label-for="input-3" class="mb-5">
                    <b-form-textarea
                      id="input-4"
                      v-model="form.message"
                      required
                      rows="5"
                      placeholder="请输入您想说的话"
                    ></b-form-textarea>
                  </b-form-group>

                  <b-button type="submit" block variant="info">提 交</b-button>
                </b-form>
              </b-col>
            </b-row>
          </template>
        </div>
      </b-tab>
    </b-tabs>
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
      active: 0,
      list: [
        {
          title: '道源智造',
          desc: `<p style="text-indent: 2em">我公司提供优秀的人工智能服务定制，技术支持和售后服务,确保本公司所提供的产品在运行期间能够稳定、安全、高效的运行，从而保证用户业务的正常运行。</p>
             <h5>服务流程</h5><br/>
            1、免费咨询：针对客户的疑问，我们将向客户介绍我司的概况和工具信息，并提供相关的资料和建议。<br/>
            2、拜访客户：通过登门拜访、当面沟通，来了解政府、企业具体需求，为制定合适的解决方案做基础。<br/>
            3、制定方案及报价：在客户认同解决方案的基础上，细化解决方案并提供产品报价。<br/>
            4、签订合同：签订合同后，我司则履行合同中要求的责任和义务。<br/>
            5、行业需求培训：收集客户所在行业的典型技术需求，制作模板并对客户进行培训。<br/>
            6、项目实施阶段：该阶段，我司将对用户提供细致周到的技术支持服务，如远程在线/电话指导，答疑，如果有远程不能解决的问题，我们将提供现场支持。<br/>
            7、跟踪指导服务：我们有着完善的售后服务体系，通过愉快的合作，将与客户建立终生的合作伙伴关系。<br/>
             <h5>售后服务</h5><br/>
            <p style="text-indent: 2em">道源云致力于为用户提供最专业及最完善的售后服务。客户如果在使用产品过程中遇到了困难，可以通过在线服务平台进行咨询道源云，一线的服务团队会与客户进行对接，最大程度让客户满意。</p>
            <h5>服务承诺</h5><br/>
            实时技术支持<br/>
            1、接到要求时向客户提供电话远程咨询与技术支持。<br/>
            2、向客户提供7x24x365的全年实时电话远程技术支持。<br/>
            3、向客户提供5x12的工作日维护技术支持。<br/>

            <h5>响应服务模式</h5><br/>
            <p style="text-indent: 2em">道源云可以根据具体项目的实际情况，为用户提供优质的7×24热线响应服务模式。7×24热线响应服务模式，用户可以通过不同方式向我司技术人员提出技术响应需求。如：通过电话、传真、信函、E-mail、来访。</p>
            <p style="text-indent: 2em">
            针对本公司的售后服务响应模式，我们目前提供5×12热线响应服务模式。</p>
            <h5>服务定制模式</h5><br/>
            <p style="text-indent: 2em">技术支持：客户自行搭建服务，道源云派专项人员协助搭建服务。</p>
            <p style="text-indent: 2em">定制搭建：道源云派专项人员根据客户需求完成服务搭建。</p>
            `


        }
      ],
      form: {
        name: '',
        phone: '',
        suggest: null,
        message: '',
      },
      suggest: [
        {value: null, text: '反馈类型'},
        {value: '需求上报', text: '需求上报'},
        {value: '商务洽谈', text: '商务洽谈'},
        {value: '意见建议', text: '意见建议'},
        {value: '其它', text: '其它'}
      ],
    }
  },
  watch: {
    subNavIndex(newVal, oldVal) {
      this.active = newVal - 1
    }
  },
  computed: {
    ...mapState(['subNavIndex']),
  },
  mounted() {
    this.active = this.subNavIndex == 0 ? 0 : this.subNavIndex - 1
    if (process.browser) {  // 在页面mounted生命周期里面 根据环境实例化WOW
      new WOW({}).init()
    }
  },
  methods: {
    async onSubmit(evt) {
      evt.preventDefault()
      const phoneReg = /^1[3456789]\d{9}$/
      const emailReg = /^[A-Za-z0-9]+([_\.][A-Za-z0-9]+)*@([A-Za-z0-9\-]+\.)+[A-Za-z]{2,6}$/
      if(!phoneReg.test(this.form.phone) && !emailReg.test(this.form.phone)) {
        this.$bvToast.toast(`提交失败，请输入正确的手机号或邮箱号`, {
          title: '提交结果',
          variant: 'danger',
          autoHideDelay: 5000
        })
        return
      }
      const res = await this.$axios.post(`/sendmail`, {
        type: '反馈',
        html: `
          <p><strong>发信人姓名：</strong></p>
          <p>${this.form.name}</p>
          <p><strong>发信人联系方式：</strong></p>
          <p>${this.form.phone}</p>
          <p><strong>发信人反馈类型：</strong></p>
          <p>${this.form.suggest}</p>
          <p><strong>发信人留言：</strong></p>
          <p>${this.form.message}</p>
        `
      })
      if(res.data.error_code === 200) {
        this.form = {
          name: '',
          phone: '',
          message: ''
        }
        this.$bvToast.toast(`提交成功，我们将尽快与您取得联系！`, {
          title: '提交结果',
          variant: 'success',
          autoHideDelay: 5000
        })
      }else {
        this.$bvToast.toast(`提交失败，请稍后重试！`, {
          title: '提交结果',
          variant: 'danger',
          autoHideDelay: 5000
        })
      }
    }
  }
}
</script>

<style lang="scss" scoped>
@import '@/assets/styles/variables.scss';

::v-deep .nav-tabs {
  padding: 15px 0;
  .nav-link {
    border-color: transparent;
    font-size: 16px;
    color: #333333;
  }
  .nav-link:hover {
    color: #0056b3;
  }
}
.desc {
  line-height: 3.5;
}
::v-deep .form-control, ::v-deep .custom-select {
  border-radius: 0 !important;
  border-color: #e4eaec !important;
  color: #aaaaaa !important;
}
::v-deep .form-control::placeholder, ::v-deep .custom-select::placeholder {
  color: #aaaaaa !important;
}
</style>
