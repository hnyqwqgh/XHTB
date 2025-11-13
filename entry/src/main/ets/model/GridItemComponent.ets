import { CommonConstants } from '../constants/CommonConstants';
import { router } from '@kit.ArkUI';

@Component
export default struct GridItemComponent {
  itemName: ResourceStr = '';
  itemImage: Resource = $r('app.media.ic_grid_item_entrances_icon');
  @State isPressed: boolean = false;
  // 页面路径参数，支持 ResourceStr 或 string 类型
  pageUrl: ResourceStr | string = '';

  build() {

    GridItem() {
      Column() {
        Image(this.itemImage)
          .width($r('app.float.grid_item_image_size'))
          .height($r('app.float.grid_item_image_size'))
        Text(this.itemName)
          .fontSize($r('app.float.grid_item_name_font_size'))
          .textAlign(TextAlign.Center)
          .margin({ top: $r('app.float.grid_item_name_top_margin') })
          .height($r('app.float.grid_item_name_height'))
      }
      .height(CommonConstants.FULL_PERCENT)
      .justifyContent(FlexAlign.Center)
      .backgroundColor(this.isPressed ? $r('app.color.pressed_color') : Color.Transparent)
      .borderRadius($r('app.float.grid_item_border_radius'))
    }
    .height($r('app.float.grid_item_height'))
    .onClick(() => {
      console.info(`Clicked on ${this.itemName}`);
      // 如果设置了页面路径，则进行跳转
      if (this.pageUrl !== '') {
        // 确保 pageUrl 是 string 类型
        const url: string = typeof this.pageUrl === 'string' ? this.pageUrl : this.pageUrl.toString();
        router.pushUrl({ url: url });
      }
    })
    .onTouch((event: TouchEvent) => {
      if (event.type === TouchType.Down) {
        this.isPressed = true;
      } else if (event.type === TouchType.Up || event.type === TouchType.Cancel) {
        this.isPressed = false;
      }
    })
  }
}