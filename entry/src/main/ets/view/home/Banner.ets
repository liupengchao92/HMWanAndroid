import StyleConstants from '../../common/constant/StyleConstants'
import BannerItem from '../../model/BannerItemVo'
import HomeViewModel from '../../viewmodel/HomeViewModel'

@Component
export default struct Banner {
  private swiperController: SwiperController = new SwiperController()
  @State
  banners: BannerItem [] = []

  async aboutToAppear() {
    this.banners = await HomeViewModel.getBanner()
  }

  build() {
    if (this.banners && this.banners.length > 0) {
      Swiper(this.swiperController) {
        ForEach(this.banners, (item: BannerItem) => {
          Image(item.imagePath)
            .width(StyleConstants.MATCH_PARENT)
            .height(180)
        })
      }
      .cachedCount(2)
      .index(0)
      .autoPlay(true)
      .interval(3000)
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
}
