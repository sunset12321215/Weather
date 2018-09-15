

import UIKit

class ViewController: UIViewController ,UICollectionViewDelegate,UICollectionViewDataSource, UITableViewDataSource,UITableViewDelegate
{
    
    
    // -------------------------    Collection View     -------------------------
    
    var mang_Collec = [Class_Collec]()
    
    @IBOutlet weak var CollectionView: UICollectionView!
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return mang_Collec.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let CollecCell = collectionView.dequeueReusableCell(withReuseIdentifier: "CollecCell", for: indexPath) as! QuanTri_CollecCell
        
        CollecCell.lbl_NhietDo.text = String(mang_Collec[indexPath.row].NhietDo - 273) + "°C"
        CollecCell.lbl_NgayGio.text = mang_Collec[indexPath.row].NgayGio
        CollecCell.lbl_ThoiTiet.text = mang_Collec[indexPath.row].ThoiTiet
        
        return CollecCell
    }
    
    
    // -------------------------    Table View     -------------------------
    
    
    @IBOutlet weak var TableView: UITableView!
    
    var mang_Table = [Class_Table]()
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return mang_Table.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let Table_Cell = tableView.dequeueReusableCell(withIdentifier: "TableCell") as! QuanTri_TableCell
        
        Table_Cell.lbl_Thu.text = mang_Table[indexPath.row].Thu
        
        Table_Cell.lbl_ThongBao.text = mang_Table[indexPath.row].ThongBao
        
        let Temp = String(mang_Table[indexPath.row].NhietDo)
        Table_Cell.lbl_NhietDo.text = Temp + "°C"
        
        Table_Cell.Img_Hinh.download(from: "https:\(mang_Table[indexPath.row].Icon)")
        
        return Table_Cell
    }
    
    
    @IBOutlet weak var img_Bg: UIImageView!
    
    // -------------------------    Main     -------------------------
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        img_Bg.download(from: "https://vannghetiengiang.vn/uploads/news/2008_11/1225850310.jpg")
        
        //  Nạp dữ liệu cho Collection View
        CollectionView.dataSource = self
        CollectionView.delegate = self
        
        let Link_Json_CollecView = "http://api.openweathermap.org/data/2.5/forecast?q=Hanoi&APPID=26f5c851bec66e093e6dd6919008f381"

        Get_DataJson_CollecView(TheUrl: Link_Json_CollecView)


        //  Nạp dữ liệu cho Table View

        let Link_Json_TableView = "https://api.apixu.com/v1/forecast.json?key=fe5d02d695944feca8292137181204&q=Hanoi&days=7&lang=vi"

        Get_DataJson_TableView(TheUrl: Link_Json_TableView)
     
        TableView.dataSource = self
        TableView.delegate = self
        
    
    }
    

    func Get_DataJson_CollecView (TheUrl : String)
    {
        let url = URL(string: TheUrl)
        
        URLSession.shared.dataTask(with: url!)
        { (data, response, error) in
            
        
            guard
                let JsonData = try! JSONSerialization.jsonObject(with: data!) as? [String : Any] else {return}
            
            if let list = JsonData["list"]
            {
                for dict in list as! [[String : Any]]
                {
                    let Collec_Item = Class_Collec()
                    
                    // lấy nhiệt độ
                    let main = dict["main"]! as! [String : Any]
                    
                    Collec_Item.NhietDo = main["temp"] as! Float
                    
                    // lấy ngày giờ
                    Collec_Item.NgayGio = dict["dt_txt"] as! String
                    
                    // lấy trạng thái thời tiết
                    let weather = dict["weather"]

                    for dict_weather in weather as! [[String : Any]]
                    {
                        Collec_Item.ThoiTiet = dict_weather["description"] as! String
                    }
                    
                    
                    self.mang_Collec.append(Collec_Item)
                }
                
                DispatchQueue.main.async
                {
                        self.CollectionView.reloadData()
                }
            }
            
        }.resume()
    }
    
    
    //  Ánh xạ đầu màn hình
    @IBOutlet weak var lbl_DiaDiem: UILabel!
    @IBOutlet weak var lbl_NgayGio: UILabel!
    @IBOutlet weak var lbl_NhietDo: UILabel!
    @IBOutlet weak var lbl_TrangThai: UILabel!
    @IBOutlet weak var img_icon: UIImageView!
    
    
    func Get_DataJson_TableView(TheUrl : String)
    {
        let url = URL(string: TheUrl)
        
        URLSession.shared.dataTask(with: url!)
        { (data, response, error) in
            
            guard
                let Json = try! JSONSerialization.jsonObject(with: data!) as? [String : Any] else {return}
            
            
            //  ------------------------    Tải dữ liệu vào phần đầu của app     ------------------------
            
            let location = Json["location"] as! [String : Any]
            
            DispatchQueue.main.async
            {
                self.lbl_DiaDiem.text = location["name"]! as? String
                self.lbl_NgayGio.text = location["localtime"]! as? String
            }
            
            let current = Json["current"] as! [String : Any]
            
            let temp_c = current["temp_c"] as! Float
            
            let condition = current["condition"] as! [String : Any]
            
            let text = condition["text"]
            
            let icon = condition["icon"] as! String
            
            
            let url_Bg = self.img_Bg.SetImageImage(Link_Image: icon)
            
            DispatchQueue.main.async
            {
                self.lbl_NhietDo.text = String(temp_c) + "°C"
                
                self.lbl_TrangThai.text = text as? String
                
                self.img_icon.download(from: "https:\(icon)")
                
                self.img_Bg.download(from: url_Bg)
            }
            
            let forecast = Json["forecast"]! as! [String : Any]
            
            let forecastday = forecast["forecastday"]!
            
            for dict in forecastday as! [[String : Any]]
            {
                //  ------------------------    Tải dữ liệu vào Table View Cell     ------------------------
                
                //  1. Tạo biến phụ để lưu thông tin lấy đc từ Json
                let Item_Table = Class_Table()
                
                
                
                //  2. Lấy date_epoch
                let date_epoch = dict["date_epoch"]! as! Double
                
                //  Lấy thứ
                let getDay = date_epoch.getDate(timeStamp: date_epoch)
                
                //  Nạp dữ liệu vào Item Table
                Item_Table.Thu = getDay
                
                
                
                //  3. Lấy thông tin của ngày và ép kiểu
                let day = dict["day"] as! [String : Any]
                
                //  Nạp dữ liệu vào Item Table
                Item_Table.NhietDo = day["avgtemp_c"]! as! Float
//                print(day["avgtemp_c"]! )
                
                
                
                //  4. Lấy thông tin của condition trong ngày
                let condition = day["condition"] as! [String : Any]
                
                //  Nạp dữ liệu của Thông Báo vào Item Table
                Item_Table.ThongBao = condition["text"] as! String
                
                
                
                //  5.  Lấy link icon trong Condition
                Item_Table.Icon = condition["icon"] as! String
                
                
                
                //  6. Nạp Item vào mảng
                self.mang_Table.append(Item_Table)
            }

            
            DispatchQueue.main.async
            {
                    self.TableView.reloadData()
            }
            
        }.resume()
    }
}

