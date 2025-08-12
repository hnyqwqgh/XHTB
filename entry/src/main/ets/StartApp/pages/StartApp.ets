let storage1451592377 = new LocalStorage()

@Entry(storage1451592377)
@Component
export struct Control_C1 {
  @LocalStorageProp('backgroundImg') backgroundImg: Resource = $r('app.media.CIcon')
  ClickToRedButtonYTarget = () : void => {
    postCardAction(this, {
      "action": "router",
      // Configuring the UIAbility name for jumping.
      'abilityName': 'EntryAbility',
      // Configuring the parameters to be transferred.
      "params": {
        'targetPage': 'page1'
      }
    });  
}  
  ClickToHome = () : void => {
    postCardAction(this, {
      "action": "router",
      // Configuring the UIAbility name for jumping.
      'abilityName': 'EntryAbility',
      // Configuring the parameters to be transferred.
      "params": {
        'targetPage': 'page1'
      }
    });  
}  
  build() {
    Stack({ alignContent: Alignment.TopEnd }) {
      Column() {
        Column() {
          Row()
            .width('70%')
            .height('25%')
        }
        .width('100%')
        .height('58%')
        .alignItems(HorizontalAlign.Start)
        .justifyContent(FlexAlign.SpaceAround)
      }
      .padding('8%')
      .width('100%')
      .height('100%')
      .justifyContent(FlexAlign.SpaceBetween)
    }
    .backgroundImage(this.backgroundImg)
    .backgroundImageSize({ width: '100%', height: '100%' })
    .width('100%')
    .height('100%')
    .onClick(this.ClickToHome)
  }
}