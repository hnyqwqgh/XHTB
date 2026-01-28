/**
 * 视频剪辑回调接口
 */
export interface VideoTrimListener {
  // 开始裁剪
  onStartTrim: () => void;

  // 裁剪完成，返回输出文件路径
  onFinishTrim: (outputFile: string) => void;

  // 取消裁剪
  onCancel: () => void;
}
