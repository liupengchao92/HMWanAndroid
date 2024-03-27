
import StyleConstants from '../../common/constant/StyleConstants'
@Component
export default struct ArticleList {
  build(){
    Column(){
      List({space:StyleConstants.SPACE_8}){
        ForEach([1,2,3,4,5],(item:number) =>{
          ListItem(){
            Row(){
              Column({space:StyleConstants.SPACE_4}){
                Row(){
                  Text(item.toString())
                    .fontColor(Color.Black)
                }.width(StyleConstants.MATCH_PARENT)
                Row(){
                  Text('标签')
                    .fontColor(Color.Black)
                  Text('作者：小样')
                    .fontColor($r('app.color.gray'))
                    .fontSize(12)
                }
                .alignItems(VerticalAlign.Center)
                .width(StyleConstants.MATCH_PARENT)
              }
              .width(StyleConstants.MATCH_PARENT)
              .layoutWeight(1)

              Image($r('app.media.ic_favorite_gray'))
                .width(25)
            }
            .justifyContent(FlexAlign.SpaceAround)
            .alignItems(VerticalAlign.Center)
            .width(StyleConstants.MATCH_PARENT)
            .padding(5)
          }
        })
      }
    }.width(StyleConstants.MATCH_PARENT)
  }
}