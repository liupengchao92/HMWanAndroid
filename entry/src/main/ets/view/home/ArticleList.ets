import StyleConstants from '../../common/constant/StyleConstants'

@Component
export default struct ArticleList {
  build() {
    Column() {
      List({ space: StyleConstants.SPACE_8 }) {
        ForEach([1, 2, 3, 4, 5], (item: number) => {
          ListItem() {
            Column(){
              Column({space: StyleConstants.SPACE_4 }) {
                // 第一行
                Row({ space: StyleConstants.SPACE_4 }) {
                  Text('新')
                    .fontColor(Color.Red)
                    .borderStyle(BorderStyle.Solid)
                    .borderColor(Color.Red)
                    .borderWidth(1)
                    .fontSize(10)
                    .padding({left:2,right:2})
                    .borderRadius(2)
                  Text('网易')
                    .fontColor($r('app.color.gray'))
                    .fontSize(12)
                  Blank()
                  Text('1天前')
                    .fontColor($r('app.color.gray'))
                    .fontSize(12)
                }.width(StyleConstants.MATCH_PARENT)
                .alignItems(VerticalAlign.Center)
                // 2.第二行
                Row() {
                  Text('Android职业进阶技能')
                    .fontColor(Color.Black)
                }
                .width(StyleConstants.MATCH_PARENT)
                .margin({ top: 5, bottom: 5 })
                // 第三行
                Row() {
                  Text('干活资源/课程推荐')
                    .fontColor($r('app.color.gray'))
                    .fontSize(12)
                  Blank()
                  Image($r('app.media.ic_favorite_gray'))
                    .width(25)
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
    .width(StyleConstants.MATCH_PARENT)
    .padding({ top: 10 })
  }
}