import StyleConstants from '../../common/constant/StyleConstants'
import BannerItemVo from '../../model/BannerItemVo'
import HomeViewModel from '../../viewmodel/HomeViewModel'

@Component
export default struct Banner {
  private swiperController: SwiperController = new SwiperController()
  @State
  banners: BannerItemVo [] = []

  async aboutToAppear() {
    this.banners = await HomeViewModel.getBanner()
  }

  build() {
    Stack() {
      if (this.banners && this.banners.length > 0) {
        Swiper(this.swiperController) {
          ForEach(this.banners, (item: BannerItemVo) => {
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
    .width(StyleConstants.MATCH_PARENT)
    .height(180)
  }
}
