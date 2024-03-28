import HomeViewModel from '../../viewmodel/HomeViewModel'
@Component
export default struct Banner {
  private swiperController: SwiperController = new SwiperController()


  aboutToAppear(){

    // 获取轮播图
    HomeViewModel.getBanner()
  }

  build() {
    Swiper(this.swiperController) {
      ForEach(['1', '2', '3'], item => {
        Text(item)
          .width('100%')
          .height(160)
          .backgroundColor($r('app.color.light_primary_color'))
          .textAlign(TextAlign.Center)
          .fontSize(30)
      })
    }
    .cachedCount(2)
    .index(0)
    .autoPlay(true)
    .interval(4000)
    .indicator(true)
    .loop(true)
    .duration(1000)
    .itemSpace(0)
    .curve(Curve.Linear)
    .onChange((index: number) => {
      console.info(index.toString())
    })
  }
}