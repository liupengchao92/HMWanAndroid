// 文章
import ArticleItemVo from './ArticleItemVo'
export default class ArticleVo {
  curPage: number
  datas: ArticleItemVo[]
  offset: number
  over: boolean
  pageCount: number
  size: 20
  total: number
}