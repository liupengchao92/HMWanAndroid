import CommonConstants from '../common/constant/CommonConstants'
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
    },1000)
  }

  build() {
    Column({ space: CommonConstants.SPACE_10 }) {
      Image($r('app.media.app_icon'))
        .width(128)
      Text(this.message)
        .fontSize(46)
        .fontWeight(FontWeight.Regular)
        .fontColor(Color.White)
    }
    .justifyContent(FlexAlign.Center)
    .backgroundColor($r('app.color.primary_color'))
    .width('100%')
    .height('100%')
  }
}