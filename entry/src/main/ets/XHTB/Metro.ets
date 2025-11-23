import { initSideData } from './Metro/TabViewModel';
import { ClassifyModel } from './Metro/TabItem';

import router from '@ohos.router';
@Component
struct ClassifyItem {
  @Prop isSelected: boolean = false;
  classifyName?: string | Resource;
  onClickAction = (): void => {
  }

  build() {
    Text(this.classifyName)
      .fontSize(14)
      .fontColor(this.isSelected ? '#182431' : '#99182431')
      .fontFamily(this.isSelected ? 'HarmonyHeiTi-Medium' : 'HarmonyHeiTi')
      .fontWeight(this.isSelected ? FontWeight.Medium : FontWeight.Normal)
      .textAlign(TextAlign.Center)
      .backgroundColor(this.isSelected ? '#FFFFFF' : '')
      .width('100%')
      .height(52)
      .onClick(this.onClickAction)
  }
}

@Entry
@Component
struct SideTab {
  @State currentClassify: number = 0;
  @State ClassifyArray: Array<ClassifyModel> = initSideData();
  private classifyScroller: Scroller = new Scroller();
  private scroller: Scroller = new Scroller();

  classifyChangeAction(index: number, isClassify: boolean): void {
    if (this.currentClassify !== index) {
      this.currentClassify = index;
      if (isClassify) {
        this.scroller.scrollToIndex(index);
      } else {
        this.classifyScroller.scrollToIndex(index);
      }
    }
  }

  build() {
    Stack() {
      Row() {
        List({ scroller: this.classifyScroller }) {
          ForEach(this.ClassifyArray, (item: ClassifyModel, index?: number) => {
            ListItem() {
              ClassifyItem({
                classifyName: item.classifyName,
                isSelected: this.currentClassify === index,
                onClickAction: () => {
                  if (index !== undefined) {
                    this.classifyChangeAction(index, true);
                  }
                }
              })
            }
          }, (item: ClassifyModel, index: number) => JSON.stringify(item) + index)
        }
        .height('110%')
        .width('27.8%')
        .backgroundColor('#F1F3F5')
        .scrollBar(BarState.Off)
        .margin({ top: 135 })

        Column() {
          ForEach(this.ClassifyArray, (item: ClassifyModel, index: number) => {
            Text(this.currentClassify === index ? item.classifyName : '')
              .fontSize(30)
          },(item: ClassifyModel, index: number) => JSON.stringify(item) + index)
        }
        .width('72.2%')
        // [End Side_tab_list]
      }
      .backgroundColor('#FFFFFF')
      
      Text('󰃚') // 自定义返回图标
        .fontSize(35)
        .margin({ left: 20 }) // 左侧留白
        .onClick(() => {
          router.back();
        })
        .position({ x: 0, y: 0 })
    }
  }
}