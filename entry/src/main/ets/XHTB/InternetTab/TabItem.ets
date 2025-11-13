export class TabItem {
  id: number;
  name: string | Resource;
  icon: Resource;

  constructor(id: number, name: string | Resource, icon: Resource) {
    this.id = id;
    this.name = name;
    this.icon = icon;
  }
}

export class BottomTabModel {
  selectImage: Resource;
  defaultImage: Resource;
  middleMode: boolean;
  title: string | Resource;
  isSelected: boolean = false;

  constructor(selectImage: Resource, defaultImage: Resource, title: string | Resource, middleMode = false) {
    this.selectImage = selectImage;
    this.defaultImage = defaultImage;
    this.title = title;
    this.middleMode = middleMode;
  }
}

export class ClassifyModel {
  classifyId: number;
  classifyName: string | Resource;

  constructor(classifyId: number, classifyName: string | Resource) {
    this.classifyId = classifyId;
    this.classifyName = classifyName;
  }
}