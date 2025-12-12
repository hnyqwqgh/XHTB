import {
  DocType,
  DocumentScanner,
  DocumentScannerConfig,
  SaveOption,
  FilterId,
  ShootingMode
} from "@kit.VisionKit"
import { hilog } from '@kit.PerformanceAnalysisKit';


const TAG: string = 'DocDemoPage'


//文档扫描页，用于加载uiExtensionAbility
@Entry
@Component
export struct DocScanPage {
  @State docImageUris: string[] = []
  @Consume('pathStack') pathStack: NavPathStack
  private docScanConfig = new DocumentScannerConfig()


  aboutToAppear() {
    this.docScanConfig.supportType = [DocType.DOC, DocType.SHEET]
    this.docScanConfig.isGallerySupported = true
    this.docScanConfig.editTabs = []
    this.docScanConfig.maxShotCount = 3
    this.docScanConfig.defaultFilterId = FilterId.ORIGINAL
    this.docScanConfig.defaultShootingMode = ShootingMode.MANUAL
    this.docScanConfig.isShareable = true
    this.docScanConfig.originalUris = []
  }


  build() {
    Column(){
      DocumentScanner({
          scannerConfig: this.docScanConfig,
          onResult: (code: number, saveType: SaveOption, uris: string[]) => {
            hilog.info(0x0001, TAG, `result code: ${code}, save: ${saveType}`)
            if (code === -1) {
              this.pathStack.pop()
            }
            uris.forEach(uriString => {
              hilog.info(0x0001, TAG, `uri: ${uriString}`)
            })
            this.docImageUris = uris
          }
        })
        .size({ width: '100%', height: '100%' })
  }
}
}