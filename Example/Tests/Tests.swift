// https://github.com/Quick/Quick

import Quick
import Nimble
import GioSwKriptor

class TableOfContentsSpec: QuickSpec {
    override func spec() {
        describe("these will fail") {

            it("can do maths") {
                var pub = "480213f53682ce5842022196fbadea6552f687cf533e4d671b4a01ce620584fb47e6acf1f4272fa2263cf1cb06a12fa7520237bf6cadc60f4903975ee9d80443aa8176e7f0b1cad984321646e93cfd4c051e3279aa1ce191b5368f579239dd219d812862108ff1349add375f390a7b0503911e0d960d2d24c31d94bca683dd52a060c29fb52e1285586d98d813015a81533501f6e70cb521bc74548d40fd52e2b22d6b9a220c0b7c8e2bb373133aa4c29b99451986124c2db17eee622cab8d5d64821be441d682e044ec2433c01e08b226e698ef9f4a4305023d0ead72cea5fcd0d815d74d8f6d4f6857ec0d7b7e7c796a32fda9570d0dedb1dd3bee72447f31"
               var a = GioDH()
                do{
               try  a.getDHKeys(pub)
                    print(a.commonKey)
                }catch{}
                
            }
        }
    }
}
