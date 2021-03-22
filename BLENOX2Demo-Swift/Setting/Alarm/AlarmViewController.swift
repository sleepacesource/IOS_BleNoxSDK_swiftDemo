//
//  AlarmViewController.swift
//  BLENOX2Demo-Swift
//
//  Created by jie yang on 2021/3/16.
//  Copyright © 2021 medica. All rights reserved.
//

import UIKit

class AlarmViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {
    
    var alarmDataNew:BleNoxAlarmInfo?
    var addAlarmID: UInt64?
    
    var isPreviewing: Bool = false
    
    @IBOutlet weak var tableView: UITableView!
    
    func getMusicList() -> Array<MusicInfo> {
        var musicList = [MusicInfo]()
        
        var musicInfo = MusicInfo()
        musicInfo.musicID = 31001
        musicInfo.musicName = NSLocalizedString("alarm_list_1", comment: "")
        musicList.append(musicInfo)
        
        musicInfo = MusicInfo()
        musicInfo.musicID = 31002
        musicInfo.musicName = NSLocalizedString("alarm_list_2", comment: "")
        musicList.append(musicInfo)
        
        musicInfo = MusicInfo()
        musicInfo.musicID = 31003
        musicInfo.musicName = NSLocalizedString("alarm_list_3", comment: "")
        musicList.append(musicInfo)
        
        musicInfo = MusicInfo()
        musicInfo.musicID = 31004
        musicInfo.musicName = NSLocalizedString("alarm_list_4", comment: "")
        musicList.append(musicInfo)
        
        musicInfo = MusicInfo()
        musicInfo.musicID = 31005
        musicInfo.musicName = NSLocalizedString("alarm_list_5", comment: "")
        musicList.append(musicInfo)
        
        musicInfo = MusicInfo()
        musicInfo.musicID = 31006
        musicInfo.musicName = NSLocalizedString("alarm_list_6", comment: "")
        musicList.append(musicInfo)
        
        musicInfo = MusicInfo()
        musicInfo.musicID = 31007
        musicInfo.musicName = NSLocalizedString("alarm_list_7", comment: "")
        musicList.append(musicInfo)
        
        musicInfo = MusicInfo()
        musicInfo.musicID = 31008
        musicInfo.musicName = NSLocalizedString("alarm_list_8", comment: "")
        musicList.append(musicInfo)
        
        musicInfo = MusicInfo()
        musicInfo.musicID = 31009
        musicInfo.musicName = NSLocalizedString("alarm_list_9", comment: "")
        musicList.append(musicInfo)
        
        return musicList
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.setUI()
        
        self.initData()
    }
    
    func initData() -> Void {
        self.addAlarmID = 1000
        
        self.alarmDataNew = BleNoxAlarmInfo()
        self.alarmDataNew!.alarmID = self.addAlarmID!;
        self.alarmDataNew!.isOpen = true;
        self.alarmDataNew!.hour = 8;
        self.alarmDataNew!.minute = 0;
        self.alarmDataNew!.repeat = 0;
        self.alarmDataNew!.snoozeTime = 6;
        self.alarmDataNew!.snoozeLength = 9;
        self.alarmDataNew!.volume = 16;
        self.alarmDataNew!.brightness = 100;
        self.alarmDataNew!.shake = false;
        self.alarmDataNew!.musicID = 31001;
        self.alarmDataNew!.timestamp = UInt32(NSDate().timeIntervalSince1970)
    }
    
    func setUI() -> Void {
        self.tableView.separatorStyle = UITableViewCell.SeparatorStyle.none
        
        let rightButton = UIButton(frame: CGRect(x: 0, y: 0, width: 40, height: 40))
        rightButton.setTitleColor(UIColor.black, for: UIControl.State.normal)
        rightButton.setTitle(NSLocalizedString("save", comment: ""), for: UIControl.State.normal)
        rightButton.addTarget(self, action: #selector(rightClick), for: UIControl.Event.touchUpInside)
        navigationItem.rightBarButtonItem = UIBarButtonItem(customView: rightButton)
    }
    
    @objc func rightClick() -> Void {
        SLPBLEManager.shared()?.bleNox(DataManager.shared()?.peripheral, alarmConfig: self.alarmDataNew!, timeout: 0, callback: { (status: SLPDataTransferStatus, data: Any?) in
            if status == SLPDataTransferStatus.succeed {
                Utils.showMessage(NSLocalizedString("save_succeed", comment: ""), controller: self)
                DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                    self.navigationController?.popViewController(animated: true)
                }
                
            } else {
                Utils.showDeviceOperationFailed(-1, at: self)
            }
        })
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func getAlarmTimeString(_ dataModel: BleNoxAlarmInfo) -> String {
        let timeStr = String(format: "%.2d:%.2d", dataModel.hour, dataModel.minute)
        return timeStr
    }
    
    func getMusicName(_ musicID: UInt16) -> String {
        let musicList = self.getMusicList()
        
        var musicName = ""
        for music in musicList {
            if music.musicID == musicID {
                musicName = music.musicName!
                break
            }
        }
        
        return musicName
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell: UITableViewCell?
        
        if indexPath.row == 0 {
            tableView.register(UINib(nibName: "NormalTableViewCell", bundle: nil), forCellReuseIdentifier: "NormalTableViewCell")
            let normalCell = tableView.dequeueReusableCell(withIdentifier: "NormalTableViewCell") as! NormalTableViewCell
            normalCell.titleLabel?.text = NSLocalizedString("time", comment: "")
            normalCell.subTitleLabel?.text = self.getAlarmTimeString(self.alarmDataNew!)
            return normalCell
        } else if indexPath.row == 1 {
            tableView.register(UINib(nibName: "NormalTableViewCell", bundle: nil), forCellReuseIdentifier: "NormalTableViewCell")
            let normalCell = tableView.dequeueReusableCell(withIdentifier: "NormalTableViewCell") as! NormalTableViewCell
            normalCell.titleLabel?.text = NSLocalizedString("reply", comment: "")
            normalCell.subTitleLabel?.text = SLPWeekDay.getAlarmRepeatDayString(withWeekDay: self.alarmDataNew!.repeat)
            return normalCell
        } else if indexPath.row == 2 {
            tableView.register(UINib(nibName: "NormalTableViewCell", bundle: nil), forCellReuseIdentifier: "NormalTableViewCell")
            let normalCell = tableView.dequeueReusableCell(withIdentifier: "NormalTableViewCell") as! NormalTableViewCell
            normalCell.subTitleLabel?.text = self.getMusicName(self.alarmDataNew!.musicID)
            normalCell.titleLabel?.text = NSLocalizedString("music", comment: "")
            return normalCell
        } else if indexPath.row == 3 {
            tableView.register(UINib(nibName: "NormalTableViewCell", bundle: nil), forCellReuseIdentifier: "NormalTableViewCell")
            let normalCell = tableView.dequeueReusableCell(withIdentifier: "NormalTableViewCell") as! NormalTableViewCell
            normalCell.subTitleLabel?.text = String(format: "%d", self.alarmDataNew!.volume)
            normalCell.titleLabel?.text = NSLocalizedString("volume", comment: "")
            return normalCell
        } else if indexPath.row == 4 {
            tableView.register(UINib(nibName: "SwtichTableViewCell", bundle: nil), forCellReuseIdentifier: "SwtichTableViewCell")
            let normalCell = tableView.dequeueReusableCell(withIdentifier: "SwtichTableViewCell") as! SwtichTableViewCell
            normalCell.titleLabel?.text = NSLocalizedString("light_wake", comment: "")
            normalCell.switcherBlock = {(switcher) ->() in
                if switcher.isOn {
                    self.alarmDataNew!.brightness = 100
                } else {
                    self.alarmDataNew!.brightness = 0
                }
            }
            return normalCell
        }
        
        return cell!
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        if indexPath.row == 0 {
            self.goSelectTime()
        } else if indexPath.row == 1 {
            self.goSelectWeekdayPage()
        } else if indexPath.row == 2 {
            self.goSelectMusic()
        } else if indexPath.row == 3 {
            self.goSelectVolume()
        }
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 104
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let view = UIView()
        
        let btn = UIButton()
        btn.addTarget(self, action: #selector(previewAndStopAlarm), for: UIControl.Event.touchUpInside)
        if self.isPreviewing {
            btn.setTitle(NSLocalizedString("preview_stop", comment: ""), for: UIControl.State.normal)
        } else {
            btn.setTitle(NSLocalizedString("preview_alarm", comment: ""), for: UIControl.State.normal)
        }
        view.addSubview(btn)
        btn.backgroundColor = UIColor.init(red: 42/255.0, green: 151/255.0, blue: 254/255.0, alpha: 1.0)
        btn.layer.cornerRadius = 2.0;
        btn.layer.masksToBounds = true;
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.topAnchor.constraint(equalTo: view.topAnchor, constant: 30).isActive = true  //顶部约束
        btn.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 60).isActive = true  //左端约束
        btn.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -60).isActive = true  //右端约束
        btn.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -30).isActive = true  //底部约束
        
        return view
    }
    
    @objc func previewAndStopAlarm() {
        if self.isPreviewing {
            SLPBLEManager.shared()?.bleNox(DataManager.shared()?.peripheral, stopAlarmRreviewTimeout: 0, callback: { (status: SLPDataTransferStatus, data: Any?) in
                if status == SLPDataTransferStatus.succeed {
                    self.isPreviewing = false
                    self.tableView.reloadData()
                } else {
                    print("stop preview failed")
                    Utils.showDeviceOperationFailed(-1, at: self)
                }
            })
        } else {
            SLPBLEManager.shared()?.bleNox(DataManager.shared()?.peripheral, startAlarmRreviewvolume: self.alarmDataNew!.volume, brightness: self.alarmDataNew!.brightness, musicID: self.alarmDataNew!.musicID, timeout: 0, callback: { (status:SLPDataTransferStatus, data: Any?) in
                if status == SLPDataTransferStatus.succeed {
                    self.isPreviewing = true
                    self.tableView.reloadData()
                } else {
                    print("preview failed")
                    Utils.showDeviceOperationFailed(-1, at: self)
                }
            })
        }
    }
    
    func goSelectVolume() -> Void {
        let minuteSelectView = Bundle.main.loadNibNamed("SLPMinuteSelectView", owner: nil, options: nil)?.first as! SLPMinuteSelectView
        var values = [Int]()
        for i in 1...16 {
            values.append(i)
        }
        minuteSelectView.iValues = values
        minuteSelectView.show(in: UIApplication.shared.keyWindow!, mode: SLPMinutePickerMode.second, time: Int(self.alarmDataNew!.volume)) { (volume) in
            self.alarmDataNew!.volume = UInt8(volume)
            self.tableView.reloadData()
        } cancelHandle: {
            
        }

    }
    
    func goSelectMusic() -> Void {
        let vc = MusicListViewController()
        vc.title = NSLocalizedString("music_list", comment: "")
        let musicList = self.getMusicList()
        vc.musicList = musicList
        vc.musicID = self.alarmDataNew!.musicID
        vc.selectMusicBlock = {(musicID) ->() in
            self.alarmDataNew!.musicID = musicID
            self.tableView!.reloadData()
        }
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    func goSelectTime() -> Void {
        let time = SLPTime24.init()
        time.hour = Int(self.alarmDataNew!.hour)
        time.minute = Int(self.alarmDataNew!.minute)
        
        let timePicker = Bundle.main.loadNibNamed("TimePickerSelectView", owner: nil, options: nil)?.first as! TimePickerSelectView
        timePicker.show(in: UIApplication.shared.keyWindow!, mode: SLPTimePickerMode._24Hour, time: time) { (time24) in
            self.alarmDataNew!.hour = UInt8(time24.hour)
            self.alarmDataNew!.minute = UInt8(time24.minute)
            self.tableView.reloadData()
        } cancelHandle: {
            
        }

    }
    
    func goSelectWeekdayPage() -> Void {
        let vc = WeekdaySelectViewController()
        vc.title = NSLocalizedString("reply", comment: "")
        vc.selectWeekDay = self.alarmDataNew!.repeat
        vc.selectWeekdayBlock = {(weekday) ->() in
            self.alarmDataNew!.repeat = weekday
            self.tableView!.reloadData()
        }
        self.navigationController?.pushViewController(vc, animated: true)
    }
}