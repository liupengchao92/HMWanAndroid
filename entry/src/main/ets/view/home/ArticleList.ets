import StyleConstants from '../../common/constant/StyleConstants'
import Logger from '../../common/utils/Logger'
import ArticleItemVo from '../../model/ArticleItemVo'
import TagVo from '../../model/TagVo'
import HomeViewModel from '../../viewmodel/HomeViewModel'
import { PullToRefresh } from '@ohos/pulltorefresh'

@Component
export default struct ArticleList {
  // 文章列表
  @State
  articleList: ArticleItemVo [] = []
  // 需绑定列表或宫格组件
  private scroller: Scroller = new Scroller()

  async aboutToAppear() {

    const article = await HomeViewModel.getHomeArticles(0)
    // 加入集合
    this.articleList.push(...article.datas)
  }

  build() {
    Column() {
      PullToRefresh({
        // 必传项，列表组件所绑定的数据
        data: $articleList,
        // 必传项，需绑定传入主体布局内的列表或宫格组件
        scroller: this.scroller,
        // 必传项，自定义主体布局，内部有列表或宫格组件
        customList: () => {
          // 一个用@Builder修饰过的UI方法
          this.ListView();
        },
        // 可选项，下拉刷新回调
        onRefresh: () => {
          return new Promise<string>((resolve, reject) => {
            // 模拟网络请求操作，请求网络2秒后得到数据，通知组件，变更列表数据
            setTimeout(() => {
              resolve('刷新成功');
            }, 2000);
          });
        },
        // 可选项，上拉加载更多回调
        onLoadMore: () => {
          return new Promise<string>((resolve, reject) => {
            // 模拟网络请求操作，请求网络2秒后得到数据，通知组件，变更列表数据
            setTimeout(() => {
              resolve('加载更多');
            }, 2000);
          });
        },
        customLoad: null,
        customRefresh: null,
      })
    }
    .width(StyleConstants.MATCH_PARENT)
    .padding({ top: 10 })
  }

  @Builder ListView() {
    List({ space: StyleConstants.SPACE_8 }) {
      if (this.articleList.length > 0) {
        ForEach(this.articleList, (item: ArticleItemVo) => {
          ListItem() {
            Column() {
              Column({ space: StyleConstants.SPACE_4 }) {
                // 第一行
                Row({ space: StyleConstants.SPACE_4 }) {
                  if (item.fresh) {
                    Text('新').tagStyle(Color.Red)
                  }
                  if (item.author) {
                    this.AuthorBuilder(`作者:${item.author}`)
                  }
                  if (item.shareUser) {
                    this.AuthorBuilder(`分享人:${item.shareUser}`)
                  }
                  Blank()
                  Text(item.author ? item.niceDate : item.niceShareDate)
                    .fontColor($r('app.color.gray'))
                    .fontSize(12)
                }.width(StyleConstants.MATCH_PARENT)
                .alignItems(VerticalAlign.Center)
                // 2.第二行
                Row() {
                  Text(item.title)
                    .fontColor(Color.Black)
                }
                .width(StyleConstants.MATCH_PARENT)
                .margin({ top: 5, bottom: 5 })
                // 第三行
                Row() {
                  // 标签
                  ForEach(item.tags, (tag: TagVo) => {
                    Text(tag.name).margin({ right: 5 }).tagStyle($r('app.color.primary_color'))
                  })
                  // 分类
                  Text(`分类:${item.chapterName}/${item.superChapterName}`)
                    .fontColor($r('app.color.gray'))
                    .fontSize(12)
                  Blank()
                  // 收藏
                  Image(item.collect ? $r('app.media.ic_favorite') : $r('app.media.ic_favorite_gray'))
                    .width(25)
                    .onClick(() => {
                      item.collect = !item.collect
                    })
                }
                .width(StyleConstants.MATCH_PARENT)
                .alignItems(VerticalAlign.Center)
              }
              .width(StyleConstants.MATCH_PARENT)
              .padding({ left: 15, top: 5, right: 15, bottom: 5 })
              // 分割线
              Divider().strokeWidth(4).color($r('app.color.divider_color'))
            }.width(StyleConstants.MATCH_PARENT)
          }
        })
      }
    }

  }

  // 坐着
  @Builder AuthorBuilder(author: string) {
    Text(author)
      .fontColor($r('app.color.gray'))
      .fontSize(12)
      .margin({ left: 10 })
  }
}
// 标签样式
@Extend(Text) function tagStyle(color: ResourceColor, fontSize: number = 10) {
  .fontColor(color)
  .borderStyle(BorderStyle.Solid)
  .borderColor(color)
  .borderWidth(1)
  .fontSize(fontSize)
  .padding({ left: 2, right: 2 })
  .borderRadius(2)
}