

import Foundation

class Class_Collec
{
    var NhietDo : Float
    var NgayGio : String
    var ThoiTiet : String
    
    init(NhietDo : Float, NgayGio : String, ThoiTiet : String)
    {
        self.NhietDo = NhietDo
        self.NgayGio = NgayGio
        self.ThoiTiet = ThoiTiet
    }
    
    init() {
        self.NhietDo = 0
        self.NgayGio = ""
        self.ThoiTiet = ""
    }
}
