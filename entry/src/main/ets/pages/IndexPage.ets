import HomeContent from '../view/home/HomeContent'
@Entry
@Component
struct IndexPage {

  // 当前下标
  @State currentIndex: number = 0

  build() {
    Column() {
      Tabs() {
        // 主页
        TabContent() {
          HomeContent()
        }.tabBar(this.TabBarBuilder($r('app.string.tab_home'), $r('app.media.ic_tab_home'), 0))
        // 体系
        TabContent() {
          Text('体系').fontSize(25)
        }.tabBar(this.TabBarBuilder($r('app.string.tab_hierarchy'), $r('app.media.ic_tab_hierarchy'), 1))
        // 公众号
        TabContent() {
          Text('公众号').fontSize(25)
        }.tabBar(this.TabBarBuilder($r('app.string.tab_wechat'), $r('app.media.ic_tab_wechat'), 2))
        // 项目
        TabContent() {
          Text('项目').fontSize(25)
        }.tabBar(this.TabBarBuilder($r('app.string.tab_project'), $r('app.media.ic_tab_project'), 3))
        // 导航
        TabContent() {
          Text('导航').fontSize(25)
        }.tabBar(this.TabBarBuilder($r('app.string.tab_navigate'), $r('app.media.ic_tab_navigate'), 4))
      }
      .barPosition(BarPosition.End)
      .onChange(index => this.currentIndex = index)
    }
    .height('100%')
    .width('100%')
  }

  @Builder
  TabBarBuilder(tabName: ResourceStr, icon: ResourceStr, index: number) {
    Column() {
      Image(icon)
        .width(25)
        .fillColor(this.selectColor(index))
      Text(tabName)
        .fontColor(this.selectColor(index))
        .fontSize(12)
    }
  }

  //获取选中的颜色
  selectColor(index: number):ResourceColor {
    return this.currentIndex === index ? $r('app.color.primary_color') : $r('app.color.light_gray')
  }
}