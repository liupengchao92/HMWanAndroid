import Logger from '../common/utils/Logger'
import instance from '../http/axios'
// 首页数据
class HomeViewModel {

  // 获取文章轮播图
  getBanner() {

    instance.get('banner/json').then(respond => {

      Logger.debug(JSON.stringify(respond))

    }).catch(error => {
      Logger.error(JSON.stringify(error))
    })
  }
}

const model = new HomeViewModel()

export default model as HomeViewModel