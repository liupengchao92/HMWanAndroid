import StyleConstants from '../common/constant/StyleConstants'
import router from '@ohos.router'

@Entry
@Component
struct WelcomePage {
  @State message: string = 'Wan Android'
  onPageShow() {
    // 延迟1s，进入主页
    setTimeout(()=>{
      router.replaceUrl({
        url:'pages/IndexPage'
      })
    },2000)
  }

  build() {
    Column({ space: StyleConstants.SPACE_10 }) {
      Image($r("app.media.app_icon"))
        .width(128)
      Text(this.message)
        .fontSize(46)
        .fontWeight(FontWeight.Regular)
        .fontColor(Color.Black)
    }
    .justifyContent(FlexAlign.Center)
    .width('100%')
    .height('100%')
  }
}