import Logger from '../common/utils/Logger'
import { requestGet } from '../http/Axios'
import BannerItem from '../model/BannerItemVo'
// 首页数据
class HomeViewModel {

  // 获取文章轮播图
  async getBanner(): Promise<BannerItem[]> {
    return await requestGet<BannerItem[]>('banner/json')
  }
}

const model = new HomeViewModel()

export default model as HomeViewModel