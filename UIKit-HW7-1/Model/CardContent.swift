//
//  CardContent.swift
//  UIKit-HW7-1
//
//  Created by Дима on 12/5/24.
//

struct CardContent {
    let authorText: String
    let postText: String
    let posterImage: String
    let rightImage: String
    let centerImage: String
    let leftImage: String
    
    static func getImages() -> [CardContent] {
        return [
            CardContent(authorText: "Dmitry Varyzgin", postText: "Post texterhveblsb hretbgl heruhgkah shrghshfoqfha uoahewifh uiahfoihrghhdsbn uhlsdhg uwerlh hfhulfshr urhsvhlsr lsdhriugdlvsa iulhvsdluh srlghlsiv usdlvfhi", posterImage: "picture1", rightImage: "picture2", centerImage: "picture3", leftImage: "picture4"),
            CardContent(authorText: "Elizaveta Budulina", postText: ";GNFDJBNSLJ SLFKVJ USLFDVN JDFSLVNSLJNV LGFBNLSJK LSDNFKJSDF LISUDFNL LSKJDFNVL SDLJFNVSDKFJVNLSDF LJSDNFK SKJDNFLKDSNFVLKD KLSJDFNVKL LKJNDSFKL NKSFDNLNL KSLANFRUBSL", posterImage: "poster2", rightImage: "right2", centerImage: "center2", leftImage: "left2"),
            CardContent(authorText: "Bro", postText: "vinln ijrpeoinv ijdspbhj idsvlujun uiahfoihrghhdsbn uhlsdhg uwerlh hfhulfshr urhsvhlsr lsdhriugdlvsa iulhvsdluh srlghlsiv usdlvfhi USLFDVN JDFSLVNSLJNV LGFBNLSJK LSDNFKJSDF LISUDFNL LSKJDFNVL SDLJFNVSDKFJVNLSDF LJSDNFK SKJDNFLKDSNFVLKD KLSJDFNVKL LKJNDSFKL NKSFDNLNL KSLANFRUBSL", posterImage: "poster3", rightImage: "right3", centerImage: "center3", leftImage: "left3"),
        ]
    }
}
