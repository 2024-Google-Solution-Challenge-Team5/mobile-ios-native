//
//  Constants.swift
//  DrugBox
//
//  Created by 김도연 on 1/27/24.
//

import Foundation

struct K {
    static let appName = "DrugBox"
    static let drugboxDefaultImage = "shippingbox"
    static let loginSegue = "LoginToMenuSelect"
//    static let registerSegue = "RegisterToChat"
    
    struct tableCell {
        static let cellIdentifier = "ReusableCell"
        
        static let cellNibName = "AlarmCell"
        static let contentCellNibName = "WayToDelete"
        
        static let boxCellNibName = "BoxCell"
        static let boxCellIdentifier = "BoxCell"
        
        static let drugCellNibName = "DrugCell"
        static let drugCellIdentifier = "DrugCell"
        
        static let countCellNibName = "DrugCountCell"
        static let countCellIdentifier = "DrugCountCell"
        
        static let memberCellNibName = "MemberCell"
        
        static let locationCellNibName = "LocationCell"
        
        static let wasteDrugCellNibName = "WasteDrugCell"
    }

    
    struct mainSegue {
        static let alarmSegue = "MenuToAlarm"
        static let manageSegue = "MenuToManage"
        static let deleteSegue = "MenuToDelete"
        static let searchSegue = "MenuToSearch"
    }
    
    struct manageSegue {
        static let createSegue = "DefaultToCreate"
        static let invitationCodeSegue = "ToJoinInvitationCode"
        static let showItemSegue = "BoxListToItemList"
        static let settingSegue = "ToSetting"
        static let inviteSegue = "ToInvite"
        static let showDetailSegue = "ToDetail"
        static let addDrugSegue = "ToAddPage"
    }
    
    struct deleteSegue {
        static let showInformationContents = "ToInfo"
        static let goToWasteDrugList = "ToWasteDrugsList"
    }
    
    struct searchSegue {
        static let showLocationList = "ToResult"
    }
    
    struct BrandColors {
//        static let purple = "BrandPurple"
//        static let lightPurple = "BrandLightPurple"
//        static let blue = "BrandBlue"
//        static let lighBlue = "BrandLightBlue"
    }
    
    struct FStore {
//        static let collectionName = "messages"
//        static let senderField = "sender"
//        static let bodyField = "body"
//        static let dateField = "date"
    }
    
    struct apiURL {
        static let baseURL = "http://104.196.48.122:8080/drugbox/"
        static let drugBaseURL = "http://104.196.48.122:8080/drugs/"
        
        static let loginURL = "http://104.196.48.122:8080/auth/login/pw"
        
        static let POSTboxURL = "\(baseURL)add"
        static let GETboxListURL = "\(baseURL)user?userId="
        static let GETboxDetailURL = "\(baseURL)setting?drugboxId="
        static let POSTinviteURL = "\(baseURL)invite?drugboxId="
        
        static let GETDrugURL = "\(drugBaseURL)list?drugboxId="
        
        static let GETLocationURL = "http://104.196.48.122:8080/maps/division?addrLvl1="

    }
    
    struct drugContents {
        static let dummy = "1. 감기로 인한 발열 및 동통(통증), 두통, 신경통, 근육통, 월경통, 염좌통(삔 통증)\n2. 다음 질환에도 사용할 수 있다.\n치통, 관절통, 류마티양 동통(통증)\n1. 경고\n1) 매일 세 잔 이상 정기적으로 술을 마시는 사람이 이 약이나 다른 해열 진통제를 복용해야 할 경우 반드시 의사 또는 약사와 상의해야 한다. 이러한 사람이 이 약을 복용하면 간손상이 유발될 수 있다.\n2) 아세트아미노펜을 복용한 환자에서 매우 드물게 급성 전신성 발진성 농포증(급성 전신성 발진성 고름물집증)(AGEP), 스티븐스  - 존슨 증후군(SJS), 독성 표피 괴사용해(TEN)와 같은 중대한 피부 반응이 보고되었고, 이러한 중대한 피부반응은 치명적일 수 있다. 따라서 이러한 중대한 피부반응의 징후에 대하여 환자들에게 충분히 알리고, 이 약 투여 후 피부발진이나 다른 과민반응의 징후가 나타나면 즉시 복용을 중단하도록 하여야 한다.\n3) 이 약은 아세트아미노펜을 함유하고 있다. 아세트아미노펜으로 일일 최대 용량(4,000mg)을 초과할 경우 간손상을 일으킬 수 있으므로 이 약을 일일 최대 용량(4,000mg)을 초과하여 복용하여서는 아니되며, 아세트아미노펜을 포함하는 다른 제품과 함께 복용하여서는 안 된다.\n2. 다음과 같은 사람은 이 약을 복용하지 말 것\n1) 이 약에 과민증 환자\n2) 소화성궤양 환자\n3) 심한 혈액 이상 환자\n4) 심한 간장애 환자\n5) 심한 신장(콩팥)장애 환자\n6) 심한 심장기능저하 환자\n7) 아스피린 천식(비스테로이드성 소염(항염)제에 의한 천식발작 유발) 또는 그 병력이 있는 환자\n8) 다음의 약물을 복용한 환자 : 바르비탈계 약물, 삼환계 항우울제\n9) 알코올을 복용한 사람\n10) 이 약은 유당을 함유하고 있으므로, 갈락토오스 불내성(galactose intolerance), Lapp 유당분해효소 결핍증(Lapp lactase deficiency) 또는 포도당  -갈락토오스 흡수장애(glucose  -galactose malabsorption) 등의 유전적인 문제가 있는 환자에게는 투여하면 안 된다."
    }
}
