import { ThumbContent, VideoThumbOption } from './VideoThumbOption';

/**
 * 视频帧图片列表预览组件
 */
@Component
export struct VideoThumbListView {
  @Link mVideoThumbOption: VideoThumbOption;
  scroller: Scroller = new Scroller();

  build() {
    Column() {
      List({ space: 0, initialIndex: 0, scroller: this.scroller }) {
        // TODO: 性能知识点：使用ForEach组件循环渲染数据
        ForEach(this.mVideoThumbOption.videoThumbs, (item: ThumbContent, index?: number) => {
          ListItem() {
            Image(item.pixelMap ? item.pixelMap : item.framePlaceholder)
              .width(this.mVideoThumbOption.videoThumbWidth)
              .height(45)
          }
          .width(this.mVideoThumbOption.videoThumbWidth)
          .height('100%')
          .backgroundColor(item.frameBackground ? item.frameBackground : Color.Transparent)
        }, (item: ThumbContent, index: number) => index.toString())
      }
      .listDirection(Axis.Horizontal)
      .height('100%')
      .width("100%")
      .scrollBar(BarState.Off)
    }
    .width('100%')
    .height('100%')
  }
}