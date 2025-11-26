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
  new ClassifyModel(6, $r('app.string.line7')),
  new ClassifyModel(6, $r('app.string.line8')),
  new ClassifyModel(6, $r('app.string.line9')),
  new ClassifyModel(6, $r('app.string.line10')),
  new ClassifyModel(6, $r('app.string.line13')),
  new ClassifyModel(6, $r('app.string.line17')),
  new ClassifyModel(6, $r('app.string.line18')),
  new ClassifyModel(6, $r('app.string.line19')),
  new ClassifyModel(6, $r('app.string.line27')),
  new ClassifyModel(6, $r('app.string.line30')),
  new ClassifyModel(6, $r('app.string.lineS3')),
  new ClassifyModel(6, $r('app.string.line92'))
];