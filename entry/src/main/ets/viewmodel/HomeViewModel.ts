import Logger from '../common/utils/Logger'
import { requestGet } from '../http/Axios'
import ArticleVo from '../model/ArticleVo'
import BannerItemVo from '../model/BannerItemVo'
// 首页数据
class HomeViewModel {

  // 获取文章轮播图
  async getBanner(): Promise<BannerItemVo[]> {
    return await requestGet<BannerItemVo[]>('banner/json')
  }

  // 获取首页文章
  async getHomeArticles(pageNum: number, pageSize?: number): Promise<ArticleVo> {
    return await requestGet<ArticleVo>(`article/list/${pageNum}/json`)
  }
}

const model = new HomeViewModel()

export default model as HomeViewModel