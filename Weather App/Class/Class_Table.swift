

import Foundation
import UIKit

class Class_Table
{
    var Thu : String
    var ThongBao : String
    
    var Icon : String
    var NhietDo : Float
    
    init(Thu : String, ThongBao : String, Icon : String, NhietDo : Float)
    {
        self.Thu = Thu
        self.ThongBao = ThongBao
        self.Icon = Icon
        self.NhietDo = NhietDo
    }
    
    init()
    {
        self.Thu = ""
        self.ThongBao = ""
        self.Icon = ""
        self.NhietDo = 0
    }
}
