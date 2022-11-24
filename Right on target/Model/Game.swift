//
//  Game.swift
//  Right on target
//
//  Created by Оксана Попова on 24.11.2022.
//

import Foundation

protocol GameProtocol {
    // Количество заработанных очков
    var score: Int { get }
    // Загаданное значение
    var currentSecretValue: Int { get }
    // Проверяет закончена ли игра
    var isGameEnded: Bool { get }
    //Начинает игру и сразу стартует новый первый раунд
    func restartGame()
    //Начинает новый раунд (обновляет загаданное число)
    func srartNewRound()
    //Сравнивает переданное значение и начисляет очки
    func calculateScore(with value: Int)
}
