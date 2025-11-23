export class Constants {
  /**
   * Index content width.
   */
  static readonly INDEX_CONTENT_WIDTH: string = '91.1%';
  /**
   * Index divider height.
   */
  static readonly DIVIDER_HEIGHT: number = 0.5;
  /**
   * Index divider width.
   */
  static readonly DIVIDER_WIDTH: string = '93%';
  /**
   * Drawer divider width.
   */
  static readonly DIVIDER_DRAWER_WIDTH: string = '90%';
  /**
   * Card title height.
   */
  static readonly CARD_TITLE_HEIGHT: number = 20;
  /**
   * Card text height.
   */
  static readonly CARD_TEXT_HEIGHT: number = 48;
  /**
   * Index title height.
   */
  static readonly INDEX_TITLE_HEIGHT: number = 112;
  /**
   * Full screen width.
   */
  static readonly FULL_WIDTH: string = '100%';
  /**
   * Full screen height.
   */
  static readonly FULL_HEIGHT: string = '100%';
  /**
   * Font size of unchecked title.
   */
  static readonly FONT_SIZE_UNCHECKED = 18;
  /**
   * Font size of checked title.
   */
  static readonly FONT_SIZE_CHECKED: number = 24;
  /**
   * Content height.
   */
  static readonly CONTENT_HEIGHT: number = 300;
  /**
   * List height.
   */
  static readonly LIST_HEIGHT: number = 48;
  /**
   * List card width.
   */
  static readonly LIST_CARD_WIDTH: number = 272;
  /**
   * List card height.
   */
  static readonly LIST_CARD_HEIGHT: number = 344;
  /**
   * List content height.
   */
  static readonly LIST_CONTENT_HEIGHT: string = '110%';
  /**
   * Background tab height.
   */
  static readonly BACKGROUND_TAB_HEIGHT: number = 40;
  /**
   * Index button height.
   */
  static readonly INDEX_BUTTON_HEIGHT: number = 60;
  /**
   * Background tab width.
   */
  static readonly BACKGROUND_TAB_WIDTH: number = 96;
  /**
   * Drawer width.
   */
  static readonly DRAWER_WIDTH: number = 264;
  /**
   * Sub tab width.
   */
  static readonly SUB_TAB_WIDTH: number = 56;
  /**
   * Sub slide width.
   */
  static readonly SUB_SLIDE_TAB_WIDTH: number = 56;
  /**
   * Sub tab bottom height.
   */
  static readonly SUB_TAB_BOT_HEIGHT: number = 25;
  /**
   * Sub tab width.
   */
  static readonly SUB_TAB_HEIGHT: number = 30;
  /**
   * Sub list width.
   */
  static readonly SUB_LIST_WIDTH: string = '85%';
  /**
   * Side tab width.
   */
  static readonly SIDE_TAB_WIDTH: string = '27.8%';
  /**
   * Side contend width.
   */
  static readonly SIDE_CONTEND_WIDTH: string = '72.2%';
  /**
   * Tab index0.
   */
  static readonly TAB_INDEX_ZERO: number = 0;
  /**
   * Tab index1.
   */
  static readonly TAB_INDEX_ONE: number = 1;
  /**
   * Tab index2.
   */
  static readonly TAB_INDEX_TWO: number = 2;
  /**
   * Tab index3.
   */
  static readonly TAB_INDEX_THREE: number = 3;
  /**
   * Tab index4.
   */
  static readonly TAB_INDEX_FOUR: number = 4;
  /**
   * Tab index5.
   */
  static readonly TAB_INDEX_FIVE: number = 5;

  static readonly TAB_INDEX_SIX: number = 6;

  static readonly TAB_INDEX_SEVEN: number = 7;






  /**
   * Image tab size.
   */
  static readonly IMAGE_SIZE_TAB: number = 22;
  /**
   * Image middle size.
   */
  static readonly IMAGE_SIZE_MIDDLE: number = 56;
  /**
   * Tab padding.
   */
  static readonly TAB_PADDING: number = 12;
  /**
   * More image width.
   */
  static readonly MORE_IMAGE_WIDTH: number = 20;
  /**
   * More image height.
   */
  static readonly MORE_IMAGE_HEIGHT: number = 15;
  /**
   * More image row width.
   */
  static readonly MORE_IMAGE_ROW_WIDTH: number = 60;
  /**
   * Drawer image height or width.
   */
  static readonly DRAWER_IMAGE_HEIGHT_WIDTH: number = 24;
  /**
   * List image height or width.
   */
  static readonly LIST_IMAGE_HEIGHT_WIDTH: number = 40;
  /**
   * Image offset.
   */
  static readonly IMAGE_OFFSET: number = -15;
  /**
   * Icon offset.
   */
  static readonly ICON_Offset: number = -3;
  /**
   * Animation duration.
   */
  static readonly ANIMATION_DURATION: number = 300;
  /**
   * Margin sixteen.
   */
  static readonly MARGIN_SIXTEEN: number = 16;
  /**
   * Margin button top.
   */
  static readonly MARGIN_BUTTON_TOP: number = 48;
  /**
   * Translate top.
   */
  static readonly TRANSLATE_TOP: number = -40;
  /**
   * Translate bottom.
   */
  static readonly TRANSLATE_BOTTOM: number = 40;
  /**
   * Border radius drawer.
   */
  static readonly BORDER_RADIUS_DRAWER: number = 16;
  /**
   * Border radius index list.
   */
  static readonly BORDER_RADIUS_INDEX_LIST: number = 18;
  /**
   * Border radius drawer content.
   */
  static readonly BORDER_RADIUS_DRAWER_CONTENT: number = 20;
  /**
   * Border radius back tab.
   */
  static readonly BORDER_RADIUS_BACK_TAB: number = 21;
  /**
   * Divider strokeWidth.
   */
  static readonly STROKE_WIDTH: number = 2;
  /**
   * Slice index index0.
   */
  static readonly SLICE_INDEX_ZERO: number = 0;
  /**
   * Slice index index6.
   */
  static readonly SLICE_INDEX_SIX: number = 6;
  /**
   * fontWeight.
   */
  static readonly FONT_WEIGHT_TAB: number = 600;
  /**
   * TopTabData.
   */
  static readonly TOP_TAB_DATA: Array<Resource | string> =
    [$r('app.string.literature'), $r('app.string.making_friends'), $r('app.string.live_broadcast'),
      $r('app.string.video'), $r('app.string.ceremony'), $r('app.string.player'), $r('app.string.player')];

}

/**
 * Route type define.
 */
export interface Route {
  title: string | Resource;
  child: Array<ChildRoute>;
}

/**
 * ChildRoute type define.
 */
export interface ChildRoute {
  text: string | Resource;
  to: string;
}