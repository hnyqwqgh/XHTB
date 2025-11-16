import { TabItem } from './TabItem';

export function initTabData(): TabItem[] {
  let tabDataArray: TabItem[] = [];
  TabItemData.forEach((item: TabItem) => {
    tabDataArray.push(new TabItem(item.id, item.name, item.icon));
  })
  return tabDataArray;
}

const TabItemData: TabItem[] = [
  new TabItem(0, $r('app.string.Internet1'), $r('app.media.ic_swiper_grid_image0')),
  new TabItem(1, $r('app.string.Internet2'), $r('app.media.ic_swiper_grid_image1')),
  new TabItem(2, $r('app.string.Internet3'), $r('app.media.ic_swiper_grid_image3')),
  new TabItem(3, $r('app.string.Internet4'), $r('app.media.ic_swiper_grid_image4')),
  new TabItem(4, $r('app.string.Internet5'), $r('app.media.ic_swiper_grid_image5')),
  new TabItem(5, $r('app.string.Internet6'), $r('app.media.ic_swiper_grid_image6')),
  new TabItem(6, $r('app.string.Internet7'), $r('app.media.ic_swiper_grid_image6'))
];