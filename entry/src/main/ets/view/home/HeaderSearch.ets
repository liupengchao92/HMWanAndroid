import StyleConstants from '../../common/constant/StyleConstants'

@Component
export default struct HeaderSearch {
  build() {
    Row() {
      Row({space:StyleConstants.SPACE_4}) {
        Image($r('app.media.ic_search')).width(25)
        Text('搜索内容')
          .fontColor(Color.White)
          .fontSize(14)
      }
      .width(StyleConstants.THOUSANDTH_940)
      .height(35)
      .backgroundColor($r('app.color.light_primary_color'))
      .alignItems(VerticalAlign.Center)
      .borderRadius(30)
      .margin({ top: 8, bottom: 8 })
      .padding({left:5,right:5})
    }
    .width(StyleConstants.MATCH_PARENT)
    .backgroundColor($r('app.color.primary_color'))
    .justifyContent(FlexAlign.Center)

  }
}