import { TabItem } from './TabItem';

export function initTabData(): TabItem[] {
  let tabDataArray: TabItem[] = [];
  TabItemData.forEach((item: TabItem) => {
    tabDataArray.push(new TabItem(item.id, item.name));
  })
  return tabDataArray;
}

const TabItemData: TabItem[] = [
  new TabItem(0, $r('app.string.Internet1')),
  new TabItem(1, $r('app.string.Internet2')),
  new TabItem(2, $r('app.string.Internet3')),
  new TabItem(3, $r('app.string.Internet4')),
  new TabItem(4, $r('app.string.Internet5')),
  new TabItem(5, $r('app.string.Internet6')),
  new TabItem(6, $r('app.string.Internet7'))
];