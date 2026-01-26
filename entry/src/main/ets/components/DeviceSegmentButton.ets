import { CapsuleSegmentButtonV2, SegmentButtonV2Items } from '@kit.ArkUI';

class CustomSegmentButtonItems extends SegmentButtonV2Items {
  get hasHybrid(): boolean {
    return false;
  }

  constructor(items: Array<SegmentButtonItem>) {
    super(items);
  }
}

class SegmentButtonItem {
  text: string = '';
  enabled: boolean = true;
  isHybrid: boolean = false;

  constructor(text: string, enabled?: boolean) {
    this.text = text;
    if (enabled !== undefined) {
      this.enabled = enabled;
    }
  }
}

@ComponentV2
export struct DeviceSegmentButton {
  @Local selectedIndex: number = 0;
  @Param initialIndex: number = 0;
  @Param onIndexChange: (index: number) => void = () => {};

  aboutToAppear(): void {
    // 使用传入的初始索引
    this.selectedIndex = this.initialIndex;
  }

  build() {
    CapsuleSegmentButtonV2({
      items: new CustomSegmentButtonItems([
        new SegmentButtonItem('碰一碰传送预览', true),
        new SegmentButtonItem('隔空传送预览', true),
      ]),
      selectedIndex: this.selectedIndex,
      onItemClicked: (index: number) => {
        this.selectedIndex = index;
        this.onIndexChange(index);
      }
    })
      .width('100%')
      .height(40)
  }
}
