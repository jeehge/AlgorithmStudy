//
//  모의고사.swift
//  JH
//
//  Created by JH on 2020/11/04.
//

import Protocol

/**
https://programmers.co.kr/learn/courses/30/lessons/42840?language=swift
수포자는 수학을 포기한 사람의 준말입니다.
수포자 삼인방은 모의고사에 수학 문제를 전부 찍으려 합니다.
수포자는 1번 문제부터 마지막 문제까지 다음과 같이 찍습니다.
1번 수포자가 찍는 방식: 1, 2, 3, 4, 5, 1, 2, 3, 4, 5, ...
2번 수포자가 찍는 방식: 2, 1, 2, 3, 2, 4, 2, 5, 2, 1, 2, 3, 2, 4, 2, 5, ...
3번 수포자가 찍는 방식: 3, 3, 1, 1, 2, 2, 4, 4, 5, 5, 3, 3, 1, 1, 2, 2, 4, 4, 5, 5, ...
1번 문제부터 마지막 문제까지의 정답이 순서대로 들은 배열 answers가 주어졌을 때,
가장 많은 문제를 맞힌 사람이 누구인지 배열에 담아 return 하도록 solution 함수를 작성해주세요.
*/

class 모의고사: Exem {
	static func exemStart() {
		let answers = [1, 2, 3, 4, 5]
		print(모의고사().solution(answers))
	}
	
	func solution(_ answers: [Int]) -> [Int] {
		var result: [Int] = []
		let 수포자1 = [1, 2, 3, 4, 5]
		let 수포자2 = [2, 1, 2, 3, 2, 4, 2, 5]
		let 수포자3 = [3, 3, 1, 1, 2, 2, 4, 4, 5, 5]
		
		var winCount = [0, 0, 0]
		for (index, value) in answers.enumerated() {
			if 수포자1[index % 수포자1.count] == value {
				winCount[0] += 1
			}
			if 수포자2[index % 수포자2.count] == value {
				winCount[1] += 1
			}
			if 수포자3[index % 수포자3.count] == value {
				winCount[2] += 1
			}
		}
		
		let maxCount = winCount.max()
		winCount.enumerated().forEach {
			if $1 == maxCount {
				result.append($0+1)
			}
		}
		
		return result.sorted(by: <)
	}
}
