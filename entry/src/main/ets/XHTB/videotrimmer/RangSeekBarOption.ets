/**
 * 视频剪辑长度选项
 */
export class RangSeekBarOption {
  // 左边进度位置
  mLeftProgressPos: number = 0;
  // 右边进度位置
  mRightProgressPos: number = 10;
  // 最小时间 比如一屏幕10张图 间隔10s, 现在最小时间是3s,那么leftThumb和rightThumb的最小间隔是3张图宽度
  mMinShootTime: number = 3;
  // 最大时间 约束了右侧thumb和左侧thumb的距离
  mMaxShootTime: number = 10;
  // 一屏幕展示最大图片数量, 一张图是1s,如果最大数量是20, 最大时间是10s，那么 rightThumb 距离 leftThumb 就是屏幕的10/20
  // 需要保证mMaxCountRange <= mMaxShootTime 否则右侧的thumb会出界
  mMaxCountRange: number = 10;
  mThumbWidth: number = 30
  // 距离上下padding
  mPaddingTopBottom: number = 10;

  constructor() {
  }
}
