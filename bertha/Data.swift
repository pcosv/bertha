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
  
    //Badges - concepts already done
    var badges: [Concept]
    
    //Cards - concepts to be done
    var cards: [Concept]

    init(context: NSManagedObjectContext) {
        self.context = context
        self.badges = [Concept]()
        self.cards = [Concept]()

        // checa se tem algo no banco
        // se tiver, carrega concepts e challenges do banco.
        self.challenges = try! context.fetch(NSFetchRequest(entityName: "Challenge")) as! [Challenge]
        self.concepts = try! context.fetch(NSFetchRequest(entityName: "Concept")) as! [Concept]
        
        if (challenges.count != 10 && concepts.count != 10) {
            self.concepts = [
                Concept(title: "Democracia", description: "É um tipo de governo em que todas as decisões políticas importantes estão com o povo, que elegem seus representantes por meio do voto.\n\nMas você sabia que as mulheres demoraram para conseguir o direito do voto?", context: context),
                Concept(title: "Três poderes", description: "O Brasil é um país que possui três poderes (Executivo, Legislativo e Judiciário), que atuam de forma independentes. Neste modelo republicano de governo, cada um dos poderes possui funções específicas, embora haja certo relacionamento entre eles. \n\nVocê quer entender como funciona essa relação?", context: context),
                Concept(title: "Voto branco e nulo", description: "De acordo com o Glossário Eleitoral do Tribunal Superior Eleitoral, o voto em branco é aquele em que o eleitor não manifesta preferência por nenhum dos candidatos, já o voto nulo é aquele em que o eleitor manifesta sua vontade de anular o voto. \n\nMas você sabe o quanto eles interferem no resultado das eleições?", context: context),
                Concept(title: "Inelegibilidade", description: "A inelegibilidade determina o impedimento temporário da capacidade eleitoral passiva do cidadão, isto é, a pessoa não pode receber votos durante um período determinado de tempo. A pessoa que tenha inelegibilidade não perde outros tipos de direitos políticos, como exercer seu voto. \n\nEntenda quais as regras para uma pessoa poder se candidatar e exercer um cargo político no Brasil!", context: context),
                Concept(title: "Pesquisas eleitorais", description: "A pesquisa eleitoral, realizada por empresa de pesquisa, é um dos artifícios mais eficientes quando queremos avaliar as influências institucionais das campanhas. \n\nVamos aprender como elas funcionam?", context: context),
                Concept(title: "Voto facultativo", description: "O voto facultativo existe quando os eleitores são incentivados a votar, mas não tem a obrigação nem de votar nem de comparecer ao seu domicílio eleitoral nem de justificar sua ausência. Apenas 19 países do mundo adotam o voto obrigatório, incluindo o Brasil. \n\nQuer descobrir por que no nosso país o ato de votar é obrigatório?", context: context),
                Concept(title: "Título de eleitor", description: "O título de eleitor é um documento muito importante no nosso país, não só no período eleitoral. Criado no Brasil Império (aquele governado por Dom Pedro II), este documento comprova que o cidadão está inscrito na Justiça Eleitoral e por isso pode participar do processo eleitoral, como eleitor ou candidato. \n\nQuer aprender a história deste documento tão importante?", context: context),
                Concept(title: "Presidente da República", description: "O presidente é a autoridade máxima da política brasileira, o Chefe do Poder Executivo do país, esta pessoa é eleita para governar o país durante um determinado período. É o que acontece no Brasil: a cada quatro anos, os brasileiros escolhem o próximo presidente. \n\nVocê sabe exatamente o que faz um presidente?", context: context),
                Concept(title: "Governador", description: "Governador (do termo latino gubernatore) é o cargo político, geralmente eletivo, que detém a autoridade máxima do poder executivo em uma província, distrito ou estado de uma federação. \n\nQuer descobrir o papel do Governador do seu estado?", context: context),
                Concept(title: "Desigualdade de Gênero na Política", description: "Apesar das mulheres serem ao menos metade da população e dos eleitores, o imaginário comum continua a fazer acreditar que política é lugar para homens engravatados. \n\nRealize este desafio e entenda um pouco de como se comporta a política brasileira em relação às mulheres. Faça este desafio para entender o papel feminino na política.", context: context)
            ]
    
            self.challenges = [
                Challenge(description: "Assista o filme \"As Sufragistas\", que narra a história das mulheres que enfrentaram seus limites na luta por igualdade e pelo direito de voto.", media: "https://www.youtube.com/watch?v=e88IJJv7PLQ", censura: 12, image: #imageLiteral(resourceName: "Democracia"), concept: concepts[0], context: context),
                Challenge(description: "Leia o texto do Politize! sobre os três poderes (Executivo, Legislativo e Judiciário) e aprenda qual o papel de cada um deles e como se relacionam entre si. ", media: "http://www.politize.com.br/separacao-dos-tres-poderes-executivo-legislativo-e-judiciario/", image: #imageLiteral(resourceName: "Representatividade"), concept: concepts[1], context: context),
                Challenge(description: "Leia o texto do Politize! e entenda as diferenças entre voto branco e nulo, bem como o impacto dos mesmos no resultado final do processo eleitoral. Boa leitura!", media: "http://www.politize.com.br/votos-brancos-e-nulos/", image: #imageLiteral(resourceName: "Direitos Humanos"), concept: concepts[2], context: context),
                Challenge(description: "Leia o texto do Politize! e descubra quem está apto ou não a assumir um cargo político.", media: "http://www.politize.com.br/inelegibilidade-cargo-politico/", image: #imageLiteral(resourceName: "Segunda Guerra Mundial"), concept: concepts[3], context: context),
                Challenge(description: "Veja o infográfico do Politize! e aprenda como é feita uma pesquisa eleitoral, ou pesquisa de intenção de voto.", media: "http://www.politize.com.br/pesquisas-eleitorais-como-sao-feitas/", image: #imageLiteral(resourceName: "Desigualdade Social"), concept: concepts[4], context: context),
                Challenge(description: "Leia o texto do Politize! sobre voto facultativo e descubra todas as razões de no nosso país termos o voto obrigatório.", media: "http://www.politize.com.br/voto-facultativo/", image: #imageLiteral(resourceName: "Poder Executivo"), concept: concepts[5], context: context),
                Challenge(description: "Leia o texto do Politize! e conheça como o título de eleitor evoluiu ao longo da história política brasileira.", media: "http://www.politize.com.br/titulo-de-eleitor-tudo-que-voce-precisa-saber/", image: #imageLiteral(resourceName: "Poder Legislativo"), concept: concepts[6], context: context),
                Challenge(description: "Leia o texto do Politize! e conheça as funções e responsabilidades de um presidente para que nas próximas eleições você possa dar o seu voto conciente.", media: "http://www.politize.com.br/presidente-da-republica-o-que-faz/", image: #imageLiteral(resourceName: "Poder Judiciário"), concept: concepts[7], context: context),
                Challenge(description: "Leia o texto do Politize! e conheça as funções e responsabilidades de um governador para que nas próximas eleições você possa dar o seu voto conciente.", media: "http://www.politize.com.br/governador-o-que-faz/", image: #imageLiteral(resourceName: "Guerra Fria"), concept: concepts[8], context: context),
                Challenge(description: "Leia o texto do Politize! e entenda como a desigualdade de gênero no Brasil repercute também na presença feminina em posições de liderança política.", media: "http://www.politize.com.br/lugar-de-mulher-e-na-politica/", image: #imageLiteral(resourceName: "Revolução Industrial"), concept: concepts[9], context: context)
        
            ]
            cards = concepts
            setRelationships()
            (UIApplication.shared.delegate as! AppDelegate).saveContext()
        } else {
            updateCards()
        }
    }
    
    func setRelationships(){
        for concept in concepts {
            for challenge in challenges {
                if concepts.index(of: concept) == challenges.index(of: challenge) {
                    concept.challenge = challenge
                    challenge.concept = concept
                }
            }
        }
    }
    
    func updateCards() {
        self.badges = [Concept]()
        self.cards = [Concept]()
        for concept in concepts {
            if concept.done {
                self.badges.append(concept)
            } else {
                self.cards.append(concept)
            }
        }
    }
  
    func getNumCards() -> Int {
        updateCards()
        return cards.count
    }
}
