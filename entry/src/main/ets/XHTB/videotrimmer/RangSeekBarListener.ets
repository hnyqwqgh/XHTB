/**
 * 视频剪辑长度侦听接口
 */

export interface RangSeekBarListener {
  // 视频剪辑范围发生变动
  onRangeSeekBarValuesChanged: (minValue: number, maxValue: number) => void
  onRangeSeekBarScrollChanged: (startPosition: number, endPosition: number) => void
}
