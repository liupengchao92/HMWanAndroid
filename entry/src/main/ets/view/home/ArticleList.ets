import StyleConstants from '../../common/constant/StyleConstants'
import Logger from '../../common/utils/Logger'
import ArticleItemVo from '../../model/ArticleItemVo'
import TagVo from '../../model/TagVo'
import HomeViewModel from '../../viewmodel/HomeViewModel'

@Component
export default struct ArticleList {
  // 文章列表
  @State
  articleList: ArticleItemVo [] = []

  async aboutToAppear() {

    const article = await HomeViewModel.getHomeArticles(0)
    // 加入集合
    this.articleList.push(...article.datas)
  }

  build() {
    Column() {
      List({ space: StyleConstants.SPACE_8 }) {
        if (this.articleList.length > 0) {
          ForEach(this.articleList, (item: ArticleItemVo) => {
            ListItem() {
              Column() {
                Column({ space: StyleConstants.SPACE_4 }) {
                  // 第一行
                  Row({ space: StyleConstants.SPACE_4 }) {
                    Text('新').tagStyle(Color.Red)
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
                      Text(tag.name).margin({ right: 5 }).tagStyle(Color.Green)
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
    .width(StyleConstants.MATCH_PARENT)
    .padding({ top: 10 })
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