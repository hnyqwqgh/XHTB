/**
 * 视频帧图片选项
 */
export class ThumbContent {
  // 当加载帧没有完成，默认的占位图
  framePlaceholder?: PixelMap = undefined;
  // 裁剪视频预览长方形条状区域背景颜色
  frameBackground: string = '#000000';
  // 视频帧加载成功后的图片信息
  pixelMap?: PixelMap = undefined;
}

export class VideoThumbOption {
  // 已加载的图片列表
  videoThumbs: ThumbContent[] = new Array<ThumbContent>();
  // 单张图片宽度
  videoThumbWidth: number = 30;
}
