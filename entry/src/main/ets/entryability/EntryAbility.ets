import { createDbInsertData } from '../formcommon/DbIndex';
import { actionCreate, actionNewWant, actionWindowStageCreate } from '../formcommon/formsetting/FormAction';
import { AbilityConstant, ConfigurationConstant, UIAbility, Want } from '@kit.AbilityKit';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { window } from '@kit.ArkUI';
import { BusinessError } from '@kit.BasicServicesKit';
import { router } from '@kit.ArkUI';
import { url } from '@kit.ArkTS';
import { promptAction } from '@kit.ArkUI';

const TAG: string = 'EntryAbility';
const DOMAIN_NUMBER: number = 0xFF00;

export default class EntryAbility extends UIAbility {
  private selectPage: string = '';
  private currentWindowStage: window.WindowStage | null = null;
  storage : LocalStorage = new LocalStorage();

  onCreate(want: Want, launchParam: AbilityConstant.LaunchParam): void {
    actionCreate(want);
    createDbInsertData(this.context);
    // 处理分享链接（AppLinking/碰一碰）
    const receivedLink = want.parameters?.['link'] || want.uri;
    if (receivedLink) {
      AppStorage.setOrCreate<string>('sharedVideoUrl', receivedLink.toString());
    }

    // 原有扫码逻辑保留
    let uri = want?.uri;
    setTimeout(() => {
      if (uri) {
        router.pushUrl({
          url: 'pages', // 直接跳转到视频页面
          params: {
            videoUrl: uri,
            source: 'scan'
          }
        });
      }
    })

    // 保留原有逻辑
    this.context.getApplicationContext().setColorMode(ConfigurationConstant.ColorMode.COLOR_MODE_NOT_SET);
    hilog.info(DOMAIN_NUMBER, TAG, `Ability onCreate: ${JSON.stringify(want?.parameters)}`);
    if (want?.parameters?.params) {
      // want.parameters.params 对应 postCardAction() 中 params 内容
      let params: Record<string, Object> = JSON.parse(want.parameters.params as string);
      this.selectPage = params.targetPage as string;
      hilog.info(DOMAIN_NUMBER, TAG, `onCreate selectPage: ${this.selectPage}`);
    }
    this.context.eventHub.emit('urlUpdate', receivedLink)

    //接续
    if (launchParam.launchReason === AbilityConstant.LaunchReason.CONTINUATION) {
      // 将上述的保存的数据取出恢复
      let continueInput = '';
      if (want.parameters !== undefined) {
        continueInput = JSON.stringify(want.parameters.data);
        console.info(`continue input ${continueInput}`)
      }
      // 触发页面恢复
      this.context.restoreWindowStage(this.storage);
    }
  }

  // 热启动场景通过onNewWant回调获取码值信息
  onNewWant(want: Want, launchParam: AbilityConstant.LaunchParam): void {
    actionNewWant(want, this);
    createDbInsertData(this.context);
    const receivedLink = want.parameters?.['link'] || want.uri;
    if (receivedLink) {
      AppStorage.setOrCreate<string>('sharedVideoUrl', receivedLink.toString());
      // 触发页面刷新逻辑
      this.currentWindowStage?.loadContent('pages/HomePage')
    }
    // 保留原有逻辑
    this.context.getApplicationContext().setColorMode(ConfigurationConstant.ColorMode.COLOR_MODE_NOT_SET);

  //接续
    console.info(`EntryAbility onNewWant ${AbilityConstant.LaunchReason.CONTINUATION}`)
    if (launchParam.launchReason === AbilityConstant.LaunchReason.CONTINUATION) {
      // 将上述的保存的数据取出恢复
      let continueInput = '';
      if (want.parameters !== undefined) {
        continueInput = JSON.stringify(want.parameters.data);
        console.info(`continue input ${continueInput}`);
      }
      this.context.restoreWindowStage(this.storage);
    }
  }

  onDestroy(): void {
    hilog.info(0x0000, 'testTag', '%{public}s', 'Ability onDestroy');
  }

  onWindowStageCreate(windowStage: window.WindowStage): void {
    actionWindowStageCreate(windowStage);
    // Main window is created, set main page for this ability
    windowStage.loadContent('pages/Index', (err, data) => {
      if (err.code) {
        return;
      }
      let windowClass: window.Window = windowStage.getMainWindowSync(); // 获取应用主窗口
      // 1. 设置窗口全屏
      let isLayoutFullScreen = true;
      windowClass.setWindowLayoutFullScreen(isLayoutFullScreen).then(() => {
        console.info('Succeeded in setting the window layout to full-screen mode.');
      }).catch((err: BusinessError) => {
        console.error(`Failed to set the window layout to full-screen mode. Code is ${err.code}, message is ${err.message}`);
      });
      // 进行后续步骤2-3中的操作
      //2
      windowClass.setSpecificSystemBarEnabled('status', false).then(() => {
        console.info('Succeeded in setting the status bar to be invisible.');
      }).catch((err: BusinessError) => {
        console.error(`Failed to set the status bar to be invisible. Code is ${err.code}, message is ${err.message}`);
      });
      //3
      windowClass.setSpecificSystemBarEnabled('navigationIndicator', false).then(() => {
        console.info('Succeeded in setting the navigation indicator to be invisible.');
      }).catch((err: BusinessError) => {
        console.error(`Failed to set the navigation indicator to be invisible. Code is ${err.code}, message is ${err.message}`);
      });
    });
  }
  onContinue(wantParam: Record<string, Object>) {
    const targetVersion  = wantParam.version;  // 获取迁移对端应用的版本号
    // 应用可根据源端版本号设置支持接续的最小兼容版本号，源端版本号可从app.json5文件中的versionCode字段获取；防止目标端版本号过低导致不兼容。
    const versionThreshold: number = 10301000; // 替换为应用自己支持兼容的最小版本号
    // 兼容性校验
    if (targetVersion < versionThreshold) {
      // 建议在校验版本兼容性失败后，提示用户拒绝迁移的原因
      promptAction.showToast({
        message: '目标端应用版本号过低，不支持接续，请您升级应用版本后再试',
        duration: 2000
      })
      // 在兼容性校验不通过时返回MISMATCH
      return AbilityConstant.OnContinueResult.MISMATCH;
    }
    console.info(`onContinue version = ${wantParam.version}, targetDevice: ${wantParam.targetDevice}`)
    // 迁移数据保存
    const continueInput = '迁移的数据';
    if (continueInput) {
      // 将要迁移的数据保存在wantParam的自定义字段（如：data）中;
      wantParam["data"] = continueInput;
    }
    return AbilityConstant.OnContinueResult.AGREE;
  }

  onWindowStageDestroy(): void {
    // Main window is destroyed, release UI related resources
    hilog.info(0x0000, 'testTag', '%{public}s', 'Ability onWindowStageDestroy');
  }

  onForeground(): void {
    // Ability has brought to foreground
    hilog.info(0x0000, 'testTag', '%{public}s', 'Ability onForeground');
  }

  onBackground(): void {
    // Ability has back to background
    hilog.info(0x0000, 'testTag', '%{public}s', 'Ability onBackground');
  }
}