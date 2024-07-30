import { CirclePage } from './CirclePage';
import { MinePage } from './MinePage';
import { PracticePage } from './PracticePage';

@Entry
@Component
struct Index {
  @StorageLink('currentTabIndex') currentTabIndex:number = 0

  build() {

    Tabs({index:this.currentTabIndex}){

      //1、答题模块
      TabContent(){

        PracticePage()

      }
      .tabBar(this.tabBarBuilder(0,'答题',$r('app.media.ic_practice'),$r('app.media.ic_practice_selected')))

      //2、圈子
      TabContent(){

        CirclePage()

      }
      .tabBar(this.tabBarBuilder(1,'圈子',$r('app.media.ic_circle'),$r('app.media.ic_circle_selected')))


      //3、个人中心
      TabContent(){

        MinePage()

      }
      .tabBar(this.tabBarBuilder(2,'我的',$r('app.media.ic_mine'),$r('app.media.ic_mine_selected')))


    }
    .width('100%')
    .height('100%')
    .vertical(false)
    .barPosition(BarPosition.End)
    .onChange((index)=>{
      this.currentTabIndex=index
    })

  }

  @Builder
  tabBarBuilder(tab_index:number,tab_title:string,icon:Resource,icon_selected:Resource){

    Column({space:5}){

      Image(this.currentTabIndex === tab_index?icon_selected:icon)
        .width(25)
        .height(25)

      Text(tab_title)
        .fontSize(16)
        .fontColor(this.currentTabIndex === tab_index?'#ff8eec71':'#ffd4cece')
        .fontWeight(FontWeight.Medium)


    }
    .width('100%')
    .backgroundColor(Color.White)

  }

}