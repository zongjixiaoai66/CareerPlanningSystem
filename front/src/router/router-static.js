import Vue from 'vue';
//配置路由
import VueRouter from 'vue-router'
Vue.use(VueRouter);
    // 解决多次点击左侧菜单报错问题
    const VueRouterPush = VueRouter.prototype.push
    VueRouter.prototype.push = function push (to) {
    return VueRouterPush.call(this, to).catch(err => err)
    }
//1.创建组件
import Index from '@/views/index'
import Home from '@/views/home'
import Login from '@/views/login'
import NotFound from '@/views/404'
import UpdatePassword from '@/views/update-password'
import pay from '@/views/pay'
import register from '@/views/register'
import center from '@/views/center'
import beifen from '@/views/modules/databaseBackup/beifen'
import huanyuan from '@/views/modules/databaseBackup/huanyuan'

     import users from '@/views/modules/users/list'
    import dictionary from '@/views/modules/dictionary/list'
    import exampaper from '@/views/modules/exampaper/list'
    import exampapertopic from '@/views/modules/exampapertopic/list'
    import examquestion from '@/views/modules/examquestion/list'
    import examrecord from '@/views/modules/examrecord/list'
    import examredetails from '@/views/modules/examredetails/list'
    import forum from '@/views/modules/forum/list'
    import news from '@/views/modules/news/list'
    import xuexishipin from '@/views/modules/xuexishipin/list'
    import xuexishipinCollection from '@/views/modules/xuexishipinCollection/list'
    import yonghu from '@/views/modules/yonghu/list'
    import zhiyejieshao from '@/views/modules/zhiyejieshao/list'
    import zhiyejieshaoCollection from '@/views/modules/zhiyejieshaoCollection/list'
    import config from '@/views/modules/config/list'
    import dictionaryExampaper from '@/views/modules/dictionaryExampaper/list'
    import dictionaryExamquestion from '@/views/modules/dictionaryExamquestion/list'
    import dictionaryForumState from '@/views/modules/dictionaryForumState/list'
    import dictionaryKemu from '@/views/modules/dictionaryKemu/list'
    import dictionaryNews from '@/views/modules/dictionaryNews/list'
    import dictionarySex from '@/views/modules/dictionarySex/list'
    import dictionaryXuexishipin from '@/views/modules/dictionaryXuexishipin/list'
    import dictionaryXuexishipinCollection from '@/views/modules/dictionaryXuexishipinCollection/list'
    import dictionaryZhiyejieshao from '@/views/modules/dictionaryZhiyejieshao/list'
    import dictionaryZhiyejieshaoCollection from '@/views/modules/dictionaryZhiyejieshaoCollection/list'
    import dictionaryZujuan from '@/views/modules/dictionaryZujuan/list'





//2.配置路由   注意：名字
const routes = [{
    path: '/index',
    name: '首页',
    component: Index,
    children: [{
      // 这里不设置值，是把main作为默认页面
      path: '/',
      name: '首页',
      component: Home,
      meta: {icon:'', title:'center'}
    }, {
      path: '/updatePassword',
      name: '修改密码',
      component: UpdatePassword,
      meta: {icon:'', title:'updatePassword'}
    }, {
      path: '/pay',
      name: '支付',
      component: pay,
      meta: {icon:'', title:'pay'}
    }, {
      path: '/center',
      name: '个人信息',
      component: center,
      meta: {icon:'', title:'center'}
    }, {
        path: '/huanyuan',
        name: '数据还原',
        component: huanyuan
    }, {
        path: '/beifen',
        name: '数据备份',
        component: beifen
    }, {
        path: '/users',
        name: '管理信息',
        component: users
    }
    ,{
        path: '/dictionaryExampaper',
        name: '试卷状态',
        component: dictionaryExampaper
    }
    ,{
        path: '/dictionaryExamquestion',
        name: '试题类型',
        component: dictionaryExamquestion
    }
    ,{
        path: '/dictionaryForumState',
        name: '帖子状态',
        component: dictionaryForumState
    }
    ,{
        path: '/dictionaryKemu',
        name: '科目',
        component: dictionaryKemu
    }
    ,{
        path: '/dictionaryNews',
        name: '公告类型',
        component: dictionaryNews
    }
    ,{
        path: '/dictionarySex',
        name: '性别',
        component: dictionarySex
    }
    ,{
        path: '/dictionaryXuexishipin',
        name: '课程类型',
        component: dictionaryXuexishipin
    }
    ,{
        path: '/dictionaryXuexishipinCollection',
        name: '收藏表类型',
        component: dictionaryXuexishipinCollection
    }
    ,{
        path: '/dictionaryZhiyejieshao',
        name: '职业',
        component: dictionaryZhiyejieshao
    }
    ,{
        path: '/dictionaryZhiyejieshaoCollection',
        name: '收藏表类型',
        component: dictionaryZhiyejieshaoCollection
    }
    ,{
        path: '/dictionaryZujuan',
        name: '组卷方式',
        component: dictionaryZujuan
    }
    ,{
        path: '/config',
        name: '轮播图',
        component: config
    }


    ,{
        path: '/dictionary',
        name: '字典',
        component: dictionary
      }
    ,{
        path: '/exampaper',
        name: '试卷表',
        component: exampaper
      }
    ,{
        path: '/exampapertopic',
        name: '试卷选题',
        component: exampapertopic
      }
    ,{
        path: '/examquestion',
        name: '试题表',
        component: examquestion
      }
    ,{
        path: '/examrecord',
        name: '考试记录表',
        component: examrecord
      }
    ,{
        path: '/examredetails',
        name: '答题详情表',
        component: examredetails
      }
    ,{
        path: '/forum',
        name: '论坛',
        component: forum
      }
    ,{
        path: '/news',
        name: '公告信息',
        component: news
      }
    ,{
        path: '/xuexishipin',
        name: '课程学习',
        component: xuexishipin
      }
    ,{
        path: '/xuexishipinCollection',
        name: '课程收藏',
        component: xuexishipinCollection
      }
    ,{
        path: '/yonghu',
        name: '用户',
        component: yonghu
      }
    ,{
        path: '/zhiyejieshao',
        name: '职业介绍',
        component: zhiyejieshao
      }
    ,{
        path: '/zhiyejieshaoCollection',
        name: '职业介绍收藏',
        component: zhiyejieshaoCollection
      }


    ]
  },
  {
    path: '/login',
    name: 'login',
    component: Login,
    meta: {icon:'', title:'login'}
  },
  {
    path: '/register',
    name: 'register',
    component: register,
    meta: {icon:'', title:'register'}
  },
  {
    path: '/',
    name: '首页',
    redirect: '/index'
  }, /*默认跳转路由*/
  {
    path: '*',
    component: NotFound
  }
]
//3.实例化VueRouter  注意：名字
const router = new VueRouter({
  mode: 'hash',
  /*hash模式改为history*/
  routes // （缩写）相当于 routes: routes
})

export default router;
