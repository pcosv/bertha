//
//  Data.swift
//  bertha
//
//  Created by Turma Tarde on 30/04/18.
//  Copyright © 2018 molieres. All rights reserved.
//

import Foundation
import CoreData
import UIKit

class Data {

    var context: NSManagedObjectContext
    var concepts: [Concept]
    var challenges: [Challenge]

    init(context: NSManagedObjectContext) {
        self.context = context

        // checa se tem algo no banco
        // se tiver, carrega concepts e challenges do banco.
        let challenges = try! context.fetch(NSFetchRequest(entityName: "Challenge")) as! [Challenge]
        let concepts = try! context.fetch(NSFetchRequest(entityName: "Concept")) as! [Concept]
        
        if (challenges.count != 10 && concepts.count != 10) {
            self.concepts = [
                Concept(title: "Democracia", description: "É um tipo de governo em que todas as decisões políticas importantes estão com o povo, que elegem seus representantes por meio do voto.\nMas você sabia que as mulheres demoraram para conseguir o direito do voto?", context: context),
                Concept(title: "Representatividade", description: "É representar determinado grupo na esfera política e social como forma de dar voz aos seus integrantes nas decisões tomadas.\nMas quantas super heroinas você conhece?", context: context),
                Concept(title: "Direitos Humanos", description: "Os direitos humanos são direitos inerentes a todos os seres humanos, independentemente de raça, sexo, nacionalidade, etnia, idioma, religião ou qualquer outra condição.\nMas você sabe exatamente quais são eles?", context: context),
                Concept(title: "Segunda Guerra Mundial", description: "Foi um conflito militar global entre os países mais poderosos da época e que foi marcado por inúmeros ataques contra civis, como o Holocausto e a utilização de armas atômicas.\nMas você já se perguntou sobre o papel das mulheres nessa guerra?", context: context),
                Concept(title: "Desigualdade Social", description: "É a falta de equilibrio entre o padrão de vida dos habitantes de um país, seja de forma profissional, de gênero e, principalmente, econômica. Causada pela falta de investimentos em políticas sociais e pela má distribuição de renda.\nVocê já se perguntou sobre como é viver em diferentes extremos sociais?", context: context),
                Concept(title: "Poder Executivo", description: "É o responsável por administrar os interesses públicos e governar a população de acordo com a Constituição. No Brasil, é exercido pelo presidente, governadores e prefeitos.\nMas você entede exatamente o que cada uma dessas pessoas faz?", context: context),
                Concept(title: "Poder Legislativo", description: "É o responsável pela elaboração das leis que regulam o Estado, os cidadãos e as organizações. É composto pela senadores, deputados federais e estaduais e vereadores.\nMas você entende exatamente o que isso significa? ", context: context),
                Concept(title: "Poder Judiciário", description: "É exercido pelos juízes e possui a capacidade e a prerrogativa de julgar, de acordo com as regras constitucionais e leis criadas pelo poder legislativo em determinado país.\nMas você entende exatamente o que isso significa?", context: context),
                Concept(title: "Guerra Fria", description: "Foi o período após o final da Segunda Guerra Mundial marcado pelo conflito indireto e de caráter ideologico entre as duas super potências da época, Estados Unidos (capitalista) e União Soviética (comunista).\nTambém foi notável o grande avanço tecnológico, do qual as mulheres tiveram grande participação, você sabia?", context: context),
                Concept(title: "Revolução Industrial", description: "Foi um conjunto de mudanças que ocorreram na Europa durante os séculos XVIII e XIX. Essa fase foi marcada por uma revolução na dinâmica de produção, que inicialmente era feita por artesãos e se tornou industrial.\nComo você imagina que era a condição dos trabalhadores dessas fábricas nessa época?", context: context)
            ]
    
            self.challenges = [
                Challenge(description: "Assista o filme \"As Sufragistas\", que narra a história das mulheres que enfrentaram seus limites na luta por igualdade e pelo direito de voto. [12 ANOS]", media: "https://www.youtube.com/watch?v=e88IJJv7PLQ", censura: 12, image: #imageLiteral(resourceName: "democracy"), concept: concepts[0], context: context),
                Challenge(description: "Assista o filme \"Mulher Maravilha\" e questione-se o porquê de existirem tão poucas super heroínas nas histórias em quadrinhos e no cinema. Converse com suas amigas.", media: "https://www.youtube.com/watch?v=I6Gj8Fvukk4", censura: 0, image: #imageLiteral(resourceName: "womensvoice"), concept: concepts[1], context: context),
                Challenge(description: "Leia a Cartilha de Direitos Humanos do Ziraldo. Após a leitura, observe as pessoas ao seu redor, você acha que todas as pessoas têm seus direitos garantidos? Converse com seus pais sobre isso.", media: "http://www.turminha.mpf.mp.br/multimidia/cartilhas/CartilhaZiraldodireitoshumanos.pdf/view", image: #imageLiteral(resourceName: "human-rights"), concept: concepts[2], context: context),
                Challenge(description: "Junte-se a sua melhor amiga para assistirem \"O Corajoso Coração de Irena Sendler\", filme que retrata a polonesa Irena Sendler, uma católica servidora social que salva milhares de crianças judias durante a Segunda Guerra Mundial. Depois da sessão, conversem sobre o filme.", media: "", censura: 14, image: #imageLiteral(resourceName: "ww2"), concept: concepts[3], context: context),
                Challenge(description: "Assista \"Casa Grande\", que conta a história de uma rica família brasileira que está a beira da falência", media: "https://www.youtube.com/watch?v=lVxMtz0p0-k", censura: 14, image: #imageLiteral(resourceName: "inequality"), concept: concepts[4], context: context),
                Challenge(description: "Assista a este vídeo educativo para entender o que é e qual a responsabilidade exata do Poder Executivo.\nVocê acha que os representantes políticos de sua cidade cumprem o dever a eles atribuídos?", media: "https://www.youtube.com/watch?v=OUxccIvFnMM", image: #imageLiteral(resourceName: "executivo"), concept: concepts[5], context: context),
                Challenge(description: "Assista a este vídeo educativo para entender o que é e qual a responsabilidade exata do Poder Legislativo.\nVocê acha que os representantes políticos de sua cidade cumprem o dever a eles atribuídos?", media: "https://www.youtube.com/watch?v=Ip9DC_StPUg", image: #imageLiteral(resourceName: "legislativo"), concept: concepts[6], context: context),
                Challenge(description: "Assista a este vídeo educativo para entender o que é e qual a responsabilidade exata do Poder Judiciário. Como você a atuação deste poder no seu país?", media: "https://www.youtube.com/watch?v=YMmR3LjweiQ", image: #imageLiteral(resourceName: "judiciario"), concept: concepts[7], context: context),
                Challenge(description: "Assista \"Estrelas Além do Tempo\", filme que conta a história de uma equipe de cientistas mulheres, na NASA, que teve grande participação na vitória norte americana em cima dos russos na corrida espacial.", media: "https://www.youtube.com/watch?v=wx3PVtrU-Os", censura: 0, image: #imageLiteral(resourceName: "coldwar"), concept: concepts[8], context: context),
                Challenge(description: "Assista Tempos Modernos, filme que mostra a rotina de um operário numa linha de montagem e suas dificuldades.", media: "https://www.youtube.com/watch?v=FNv7M-UPNuY", censura: 0, image: #imageLiteral(resourceName: "industry"), concept: concepts[9], context: context)
        
            ]
            relationships()
            (UIApplication.shared.delegate as! AppDelegate).saveContext()
        } else {
            self.concepts = concepts
            self.challenges = challenges
        }
    }
    
    func relationships(){
        for concept in concepts {
            for challenge in challenges {
                concept.challenge = challenge
                challenge.concept = concept
            }
        }
    }
}
