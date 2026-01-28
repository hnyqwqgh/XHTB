export class CommonConstants {
  /**
   * Table grid nested list uri.
   */
  static readonly TABLE_GRID_NEST_LIST_URI: string = 'pages/GridNestListIndex';

  /**
   * Table grid nested swiper uri.
   */
  static readonly TABLE_GRID_NEST_SWIPER_URI: string = 'pages/GridNestSwiperIndex';

  /**
  * Table grid nested list uri.
  */
  static readonly WATER_FLOW_LAYOUT_WEIGHT: number = 1;

  /**
  * Divider stroke width
  */
  static readonly DIVIDER_STROKE_WIDTH: number = 2;

  /**
  * List space size
  */
  static readonly LIST_SPACE_SIZE: number = 16;

  /**
  * Height of the first page of the swiper
  */
  static readonly SWIPER_HEIGHT_SIZE1: number = 175;

  /**
   * Height of the second page of the swiper.
   */
  static readonly SWIPER_HEIGHT_SIZE2: number = 100;

  /**
   * The height of the WaterFlow item
   */
  static readonly WATER_FLOW_GROUP_BOTTOM_MARGIN: number = 12;

  /**
   * The height of the WaterFlow item
   */
  static readonly WATER_FLOW_ITEM_HEIGHT: number = 159;

  /**
   * The Animation Duration of swiper
   */
  static readonly SWIPER_DURATION: number = 700;

  /**
   * The ninety percent of the components
   */
  static readonly NINETY_PERCENT: string = '90%';

  /**
   * The height of list
   */
  static readonly LIST_HEIGHT: string = 'calc(100% - 40vp)';

  /**
   * The hundred  percent of the components
   */
  static readonly FULL_PERCENT: string = '100%';

  /**
   * Water flow layout columns template
   */
  static readonly GRID_COLUMNS_TEMPLATE: string = '1fr 1fr 1fr 1fr';

  /**
   * Height and width is 100%.
   * */
  static readonly FULL_PARENT: string = '100%';
  static readonly START_WINDOW_BACKGROUND: string = "#FFFFFFF";
  static readonly SWIPER_INTERVAL: number = 3500;
  static readonly SWIPER_DURATION1: number = 500;
  static readonly SWIPER_ITEM_SPACE: number = 10;
  static readonly HEXADECIMAL: number = 16;
  static readonly ANIMATION_DURATION: number = 500;
  static readonly ANIMATION_ITERATIONS: number = 1;
  static readonly START_GRADIENT_RANGE: number = 0.0;
  static readonly END_GRADIENT_RANGE: number = 0.5;


  /**
   * 首页图片宽度
   */
  static readonly firstImageWidth = 762;
  /**
   * 首页图片高度
   */
  static readonly firstImageHeight = 431;
  /**
   * 首页图片从视频中截取的开始时间
   */
  static readonly FIRST_IMAGE_START_TIME = 1000;
  /**
   * 首页图片从视频中截取的结束时间
   */
  static readonly FIRST_IMAGE_END_TIME = 12000;
  /**
   *  进度最大值
   */
  static readonly PROGRESS_MAX = 100;
  /**
   *  重试间隔
   */
  static readonly UPLOAD_INTERVAL_TIME = 1000;
  /**
   * 一秒钟毫秒数
   */
  static readonly MS_ONE_SECOND = 1000;
  /**
   * 一秒钟微秒数
   */
  static readonly US_ONE_SECOND = 1000000;
  /**
   * 压缩分辨率
   */
  static readonly SCALE_NUM = 100;
}

/**
 * The state of main page
 */
export enum ScrollPosition {
  start = 0,
  center = 1,
  end = 2
}