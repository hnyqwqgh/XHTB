/**
 * 视频帧加载回调接口
 */
export interface VideoLoadFramesListener {
  // 开始加载视频帧
  onStartLoad: () => void;
  // 视频帧加载完成
  onFinishLoad: () => void;
}
