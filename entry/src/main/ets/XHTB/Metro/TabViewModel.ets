import { ClassifyModel } from './TabItem';

export function initSideData(): ClassifyModel[] {
  let tabDataArray: ClassifyModel[] = [];
  ClassifyData.forEach((item: ClassifyModel) => {
    tabDataArray.push(new ClassifyModel(item.classifyId, item.classifyName));
  })
  return tabDataArray;
}

const ClassifyData: ClassifyModel[] = [
  new ClassifyModel(0, $r('app.string.line1')),
  new ClassifyModel(1, $r('app.string.line2')),
  new ClassifyModel(2, $r('app.string.line3')),
  new ClassifyModel(3, $r('app.string.line4')),
  new ClassifyModel(4, $r('app.string.line5')),
  new ClassifyModel(5, $r('app.string.line6')),
  new ClassifyModel(6, $r('app.string.line7'))
];