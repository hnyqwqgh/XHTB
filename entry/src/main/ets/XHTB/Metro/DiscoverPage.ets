import { Constants } from '../Metro/MetroConstants';
import { initTabData } from '../Metro/TabViewModel';
import { TabItem } from '../Metro/TabItem';

@Component
export struct DiscoverPage {
  @State tabArray: Array<TabItem> = initTabData();
  @State focusIndex: number = 0;
  controller: TabsController = new TabsController();
  private listScroller: Scroller = new Scroller();
  private subController: TabsController = new TabsController();
  private panOptionRight: PanGestureOptions = new PanGestureOptions({ direction: PanDirection.Left });
  private barHeight: number = 0;

  @Builder
  subTabBuilder(tabName: string | Resource, tabIndex: number) {
    Row() {
      Text(tabName)
        .fontSize('16fp')
        .fontColor(tabIndex === this.focusIndex ? '#0A59F7' : '#E6000000' )
        .id(tabIndex.toString())
    }
    .justifyContent(FlexAlign.Center)
    .padding({ left: 6, right: 6 }) // 缩小标签左右的空白
    .height(Constants.SUB_TAB_HEIGHT)
    .width('auto') // 让标签宽度自适应内容
    .onClick(() => {
      this.subController.changeIndex(tabIndex);
      this.focusIndex = tabIndex;
    })
  }

  build() {
    Column() {
      Column() {
        Row() {
          List({ initialIndex: Constants.TAB_INDEX_ZERO, scroller: this.listScroller }) {
            ForEach(this.tabArray, (item: TabItem, index: number) => {
              this.subTabBuilder(item.name, index)
            }, (item: TabItem, index: number) => JSON.stringify(item) + index)
          }
          .listDirection(Axis.Horizontal)
          .height(Constants.SUB_TAB_HEIGHT)
          .scrollBar(BarState.Off)
          .layoutWeight(1) // 使用layoutWeight而不是固定宽度，更好地分配空间
          .friction($r('app.float.list_friction'))
          .edgeEffect(EdgeEffect.Spring) // 添加弹性效果

          Image($r('app.media.more'))
            .width(Constants.MORE_IMAGE_WIDTH)
            .height(Constants.MORE_IMAGE_HEIGHT)
            .margin({ left: 12 }) // 减小图片左边距
        }
        .height(Constants.SUB_TAB_BOT_HEIGHT)
        .width(Constants.FULL_WIDTH)
      }
      .alignItems(HorizontalAlign.Center)
      .width(Constants.FULL_WIDTH)
      .padding({ left: 2 }) // 减小左内边距

      Tabs({ barPosition: BarPosition.Start, controller: this.subController }) {
        ForEach(this.tabArray, (item: TabItem) => {
          if (item.id === this.tabArray.length - 1) {
            TabContent() {
              Row() {
                Text(item.name)
                  .height(Constants.CONTENT_HEIGHT)
                  .fontSize('30fp')
              }
              .width(Constants.FULL_WIDTH)
              .justifyContent(FlexAlign.Center)
              .gesture(
                PanGesture(this.panOptionRight)
                  .onActionEnd(() => {
                    this.controller.changeIndex(1);
                  })
              )
            }
            .backgroundColor(Color.White)
          } else {
            TabContent() {
              Row() {
                Text(item.name)
                  .height(Constants.CONTENT_HEIGHT)
                  .fontSize('30fp')
              }
              .width(Constants.FULL_WIDTH)
              .justifyContent(FlexAlign.Center)
            }
            .backgroundColor(Color.White)
          }
        }, (item: TabItem, index: number) => JSON.stringify(item) + index)
      }
      .barHeight(this.barHeight)
      .animationDuration(Constants.ANIMATION_DURATION)
      .onAnimationStart((_index: number, targetIndex: number) => {
        this.focusIndex = targetIndex;
        this.listScroller.scrollToIndex(targetIndex, true, ScrollAlign.CENTER);
      })
    }
  }
}