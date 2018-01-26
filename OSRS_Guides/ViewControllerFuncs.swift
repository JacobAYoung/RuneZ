//
//  ViewControllerFuncs.swift
//  OSRS_Guides
//
//  Created by Zach Galloway on 1/7/18.
//  Copyright © 2018 Jake Young. All rights reserved.
//

import Foundation
import UIKit

//struct for skill stats with 3 members
struct SkillStats {
    var Rank, Level, Experience: String
    init(Rank: String = "", Level: String = "", Experience: String = "") {
        self.Rank = Rank
        self.Level = Level
        self.Experience = Experience
    }
}

var Total = SkillStats()
var Attack = SkillStats()
var Defense = SkillStats()
var Strength = SkillStats()
var Hitpoints = SkillStats()
var Ranged = SkillStats()
var Prayer = SkillStats()
var Magic = SkillStats()
var Cooking = SkillStats()
var Woodcutting = SkillStats()
var Fletching = SkillStats()
var Fishing = SkillStats()
var Firemaking = SkillStats()
var Crafting = SkillStats()
var Smithing = SkillStats()
var Mining = SkillStats()
var Herblore = SkillStats()
var Agility = SkillStats()
var Thieving = SkillStats()
var Slayer = SkillStats()
var Farming = SkillStats()
var Runecraft = SkillStats()
var Hunting = SkillStats()
var Construction = SkillStats()
var URLstatus: Bool = false
var checkedURLStatus: Bool = false
var httpstatus: Int = 0
var result = [String]()

//variable to store runescape username initialized as an empty string
var rsn: String = ""


let jsonUrlString = "http://services.runescape.com/m=hiscore_oldschool/index_lite.ws?player=" + rsn



class FunctionController: UIViewController {
    //creating struct for each skill type

    
    
    
    //rsn = "real nice"
    //replacing space and hyphen characters with ascii equivalence for URL
    //rsn = rsn.replacingOccurrences(of: " ", with: "%20")
    //rsn = rsn.replacingOccurrences(of: "-", with: "%2D")
    
    //print(rsn)
    
    //Grabs the skill data for a specific username, rsn
    
    
    //<--- Not sure if this code is doing anything --->\\
   
    //<--- Not sure if this code is doing anything --->\\
    
    //Gets URL status for a specific rs username
    //Either 200 or 404 depending on the webpage being loaded
    //404 for invalid and 200 for valid
    func checkURLStatus() {
        guard let url = URL(string: jsonUrlString) else
        {return}
        let request = URLRequest(url: url)
        
        URLSession.shared.dataTask(with: request) {data, response, error in
            if let httpResponse = response as? HTTPURLResponse {
                print("Status Code: \(httpResponse.statusCode)")
                httpstatus = httpResponse.statusCode
                let dataAsString = String(data: data!, encoding: .utf8)
                //Breaks up the text if it has a ',' or '\n'
                result = (dataAsString?.components(separatedBy: [",","\n"]))!
            }
            }
            .resume()
        return
    }
    
    //Sets the stats loaded up from the webpage
    func setStats() {
        if (httpstatus == 200) {
            URLstatus = true
            
            //matching skill type members to data pulled for all skill types
            Total = SkillStats(Rank: result[0], Level: result[1], Experience: result[2])
            Attack = SkillStats(Rank: result[3], Level: result[4], Experience: result[5])
//            self.Defense = SkillStats(Rank: result[6], Level: result[7], Experience: result[8])
//            self.Strength = SkillStats(Rank: result[9], Level: result[10], Experience: result[11])
//            self.Hitpoints = SkillStats(Rank: result[12], Level: result[13], Experience: result[14])
//            self.Ranged = SkillStats(Rank: result[15], Level: result[16], Experience: result[17])
//            self.Prayer = SkillStats(Rank: result[18], Level: result[19], Experience: result[20])
//            self.Magic = SkillStats(Rank: result[21], Level: result[22], Experience: result[23])
//            self.Cooking = SkillStats(Rank: result[24], Level: result[25], Experience: result[26])
//            self.Woodcutting = SkillStats(Rank: result[27], Level: result[28], Experience: result[29])
//            self.Fletching = SkillStats(Rank: result[30], Level: result[31], Experience: result[32])
//            self.Fishing = SkillStats(Rank: result[33], Level: result[34], Experience: result[35])
//            self.Firemaking = SkillStats(Rank: result[36], Level: result[37], Experience: result[38])
//            self.Crafting = SkillStats(Rank: result[39], Level: result[40], Experience: result[41])
//            self.Smithing = SkillStats(Rank: result[42], Level: result[43], Experience: result[44])
//            self.Mining = SkillStats(Rank: result[45], Level: result[46], Experience: result[47])
//            self.Herblore = SkillStats(Rank: result[48], Level: result[49], Experience: result[50])
//            self.Agility = SkillStats(Rank: result[51], Level: result[52], Experience: result[53])
//            self.Thieving = SkillStats(Rank: result[54], Level: result[55], Experience: result[56])
//            self.Slayer = SkillStats(Rank: result[57], Level: result[58], Experience: result[59])
//            self.Farming = SkillStats(Rank: result[60], Level: result[61], Experience: result[62])
//            self.Runecraft = SkillStats(Rank: result[63], Level: result[64], Experience: result[65])
//            self.Hunting = SkillStats(Rank: result[66], Level: result[67], Experience: result[68])
//            self.Construction = SkillStats(Rank: result[69], Level: result[70], Experience: result[71])
            
            print("Stats Loaded")
        } else if httpstatus == 404 {
            URLstatus = false
            print("Error: User entered wrong Name")
        } else {
            URLstatus = false
            print("Error: Failed test")
        }
    }
    
    func mainInit() {
        //First checks to see if the player's name is registered through the RuneScape's Hiscores
        checkURLStatus()
        
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            //Gets the stats from the website and then sets them to the specific user
            self.setStats()
            if (URLstatus == false) {
                //totalRank.text = "Rank: Failed"
                //totalLevel.text = "Level: Failed"
                //totalXP.text = "XP: Failed"
            } else {
                //totalRank.text = "Rank: " + Total.Rank
                //totalLevel.text = "Level: " + Total.Level
                //totalXP.text = "XP: " + Total.Experience
            }
        }
        
        return
    }
    

    
  //sets back navigation button to runescape font
    func setRunescapeBackButtonFont() {
    
        //removes grey line just below navigation bar
        navigationController?.navigationBar.shadowImage = UIImage()
        
        let backButton = UIBarButtonItem(title: "Back", style: UIBarButtonItemStyle.plain, target: self, action: nil)
        backButton.setTitleTextAttributes([NSAttributedStringKey.font: UIFont(name: "Runescape UF", size: 24)!], for: [])
        navigationItem.backBarButtonItem = backButton
    }
    

}
