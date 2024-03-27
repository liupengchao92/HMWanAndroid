
import StyleConstants from '../../common/constant/StyleConstants'
import ArticleList from './ArticleList'
import Banner from './Banner'
import HeaderSearch from './HeaderSearch'
// 主页
@Preview
@Component
export default struct HomeContent {

  build(){
    Column(){
      // 1.同步搜索布局
      HeaderSearch()
      // 2.轮播图
      Banner()
      // 3，文章列表
      ArticleList()
    }
    .width(StyleConstants.MATCH_PARENT)
    .height(StyleConstants.MATCH_PARENT)
  }
}